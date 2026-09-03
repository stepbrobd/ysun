open Ast.Impl

type element_type =
  | Inline
  | Block
  | Table

type t =
  | Element of element_type * string * attributes * t option
  | Text of string
  | Raw of string
  | Null
  | Concat of t * t

let elt etype name attrs childs = Element (etype, name, attrs, childs)
let text s = Text s
let raw s = Raw s

let concat t1 t2 =
  match t1, t2 with
  | Null, t | t, Null -> t
  | _ -> Concat (t1, t2)
;;

let concat_map f l = List.fold_left (fun accu x -> concat accu (f x)) Null l
let concat_map2 f l1 l2 = List.fold_left2 (fun accu x y -> concat accu (f x y)) Null l1 l2

(* only convert when "necessary" *)
let htmlentities s =
  let b = Buffer.create (String.length s) in
  let rec loop i =
    if i >= String.length s
    then Buffer.contents b
    else (
      (match s.[i] with
       | '"' -> Buffer.add_string b "&quot;"
       | '&' -> Buffer.add_string b "&amp;"
       | '<' -> Buffer.add_string b "&lt;"
       | '>' -> Buffer.add_string b "&gt;"
       | c -> Buffer.add_char b c);
      loop (succ i))
  in
  loop 0
;;

let add_attrs_to_buffer buf attrs =
  let f (k, v) = Printf.bprintf buf " %s=\"%s\"" k (htmlentities v) in
  List.iter f attrs
;;

let rec add_to_buffer buf = function
  | Element (eltype, name, attrs, None) ->
    Printf.bprintf buf "<%s%a />" name add_attrs_to_buffer attrs;
    if eltype = Block then Buffer.add_char buf '\n'
  | Element (eltype, name, attrs, Some c) ->
    Printf.bprintf
      buf
      "<%s%a>%s%a</%s>%s"
      name
      add_attrs_to_buffer
      attrs
      (match eltype with
       | Table -> "\n"
       | _ -> "")
      add_to_buffer
      c
      name
      (match eltype with
       | Table | Block -> "\n"
       | _ -> "")
  | Text s -> Buffer.add_string buf (htmlentities s)
  | Raw s -> Buffer.add_string buf s
  | Null -> ()
  | Concat (t1, t2) ->
    add_to_buffer buf t1;
    add_to_buffer buf t2
;;

let escape_uri s =
  let b = Buffer.create (String.length s) in
  String.iter
    (function
      | ( '!'
        | '*'
        | '\''
        | '('
        | ')'
        | ';'
        | ':'
        | '@'
        | '='
        | '+'
        | '$'
        | ','
        | '/'
        | '?'
        | '%'
        | '#'
        | 'A' .. 'Z'
        | 'a' .. 'z'
        | '0' .. '9'
        | '-' | '_' | '.' | '~' | '&' ) as c -> Buffer.add_char b c
      | _ as c -> Printf.bprintf b "%%%2X" (Char.code c))
    s;
  Buffer.contents b
;;

let trim_start_while p s =
  let start = ref true in
  let b = Buffer.create (String.length s) in
  Uutf.String.fold_utf_8
    (fun () _ -> function
       | `Malformed _ -> Buffer.add_string b s
       | `Uchar u when p u && !start -> ()
       | `Uchar u when !start ->
         start := false;
         Uutf.Buffer.add_utf_8 b u
       | `Uchar u -> Uutf.Buffer.add_utf_8 b u)
    ()
    s;
  Buffer.contents b
;;

let underscore = Uchar.of_char '_'
let hyphen = Uchar.of_char '-'
let period = Uchar.of_char '.'
let is_white_space = Uucp.White.is_white_space
let is_alphabetic = Uucp.Alpha.is_alphabetic
let is_hex_digit = Uucp.Num.is_hex_digit

module Identifiers : sig
  type t

  val empty : t

  (** Bump the frequency count for the given string.
      It returns the previous count (before bumping) *)
  val touch : string -> t -> int * t
end = struct
  module SMap = Map.Make (String)

  type t = int SMap.t

  let empty = SMap.empty

  let count s t =
    match SMap.find_opt s t with
    | None -> 0
    | Some x -> x
  ;;

  let incr s t = SMap.add s (count s t + 1) t

  let touch s t =
    let count = count s t in
    count, incr s t
  ;;
end

(* Based on pandoc algorithm to derive id's.
   See: https://pandoc.org/MANUAL.html#extension-auto_identifiers *)
let slugify s =
  let s = trim_start_while (fun c -> not (is_alphabetic c)) s in
  let length = String.length s in
  let b = Buffer.create length in
  let last_is_ws = ref false in
  let add_to_buffer u =
    if !last_is_ws = true
    then (
      Uutf.Buffer.add_utf_8 b (Uchar.of_char '-');
      last_is_ws := false);
    Uutf.Buffer.add_utf_8 b u
  in
  let fold () _ = function
    | `Malformed _ -> add_to_buffer Uutf.u_rep
    | `Uchar u when is_white_space u && not !last_is_ws -> last_is_ws := true
    | `Uchar u when is_white_space u && !last_is_ws -> ()
    | `Uchar u ->
      if is_alphabetic u || is_hex_digit u
      then (
        match Uucp.Case.Map.to_lower u with
        | `Self -> add_to_buffer u
        | `Uchars us -> List.iter add_to_buffer us);
      if u = underscore || u = hyphen || u = period then add_to_buffer u
  in
  Uutf.String.fold_utf_8 fold () s;
  Buffer.contents b
;;

let to_plain_text t =
  let buf = Buffer.create 1024 in
  let rec go : _ inline -> unit = function
    | Concat (_, l) -> List.iter go l
    | Text (_, t) | Code (_, t) -> Buffer.add_string buf t
    | Emph (_, i)
    | Strong (_, i)
    | Link (_, { label = i; _ })
    | Image (_, { label = i; _ }) -> go i
    | Hard_break _ | Soft_break _ -> Buffer.add_char buf ' '
    | Html _ -> ()
    | Sup (_, i) -> go i
    | Math (_, t) -> Buffer.add_string buf t
  in
  go t;
  Buffer.contents buf
;;

exception Image_error of string

let () =
  Printexc.register_printer (function
    | Image_error msg -> Some (Printf.sprintf "Omd.Image_error(%s)" msg)
    | _ -> None)
;;

(* a destination that names a scheme, or is protocol relative, points somewhere
   this process cannot read *)
let is_remote destination =
  let starts_with_scheme () =
    let n = String.length destination in
    let rec loop i =
      if i >= n
      then false
      else (
        match destination.[i] with
        | 'A' .. 'Z' | 'a' .. 'z' | '0' .. '9' | '+' | '-' | '.' -> loop (i + 1)
        | ':' -> true
        | _ -> false)
    in
    match destination.[0] with
    | 'A' .. 'Z' | 'a' .. 'z' -> loop 1
    | _ -> false
  in
  String.length destination > 0
  && (starts_with_scheme ()
      || (String.length destination > 1 && destination.[0] = '/' && destination.[1] = '/')
     )
;;

(* image dimensions come from the file on disk, so they are read only when the
   caller says which directory a site absolute path is relative to. without that
   the result would depend on the process working directory. a local path that
   does not resolve stops the build, because the alternative is shipping an img
   with no width and height while the build reports success *)
let get_dimensions ~image_root destination =
  match image_root with
  | None -> None
  | Some _ when is_remote destination -> None
  | Some root ->
    let path =
      if String.length destination > 0 && destination.[0] = '/'
      then String.sub destination 1 (String.length destination - 1)
      else destination
    in
    let path = Filename.concat root path in
    (match Imgmeta.of_file path with
     | Ok { width; height; _ } -> Some (string_of_int width, string_of_int height)
     | Error e ->
       raise
         (Image_error
            (Format.asprintf "%a for %S at %S" Imgmeta.pp_error e destination path)))
;;

exception Math_error of string

(* re-exported as Omd.Math_error. without a printer the default rendering names
   the internal module *)
let () =
  Printexc.register_printer (function
    | Math_error msg -> Some (Printf.sprintf "Omd.Math_error(%s)" msg)
    | _ -> None)
;;

(* convert tex to mathml at build time. an expression outside camlmath's subset
   stops the build. the alternative is emitting the source as text, which ships
   raw tex to readers while the build reports success *)
let tex2mathml ~display content =
  match Camlmath.to_mathml ~display content with
  | Ok markup -> markup
  | Error e -> raise (Math_error (Format.asprintf "%a in %S" Camlmath.pp_error e content))
;;

let nl = Raw "\n"

let rec url ~image_root label destination title attrs =
  let attrs =
    match title with
    | None -> attrs
    | Some title -> ("title", title) :: attrs
  in
  let attrs = ("href", escape_uri destination) :: attrs in
  elt Inline "a" attrs (Some (inline ~image_root label))

and img ~image_root ?alt label destination title attrs =
  let attrs =
    match title with
    | None -> attrs
    | Some title -> ("title", title) :: attrs
  in
  let attrs =
    match get_dimensions ~image_root destination with
    | Some (w, h) -> ("width", w) :: ("height", h) :: attrs
    | None -> attrs
  in
  let alt =
    match alt with
    | Some alt -> alt
    | None -> to_plain_text label
  in
  let attrs =
    ("src", escape_uri destination)
    :: ("alt", alt)
    :: ("loading", "lazy")
    :: ("decoding", "async")
    :: attrs
  in
  elt Inline "img" attrs None

(* wrap img with figure and caption *)
and figure ~image_root label destination title attrs =
  let alt = to_plain_text label in
  if String.trim alt = ""
  then elt Block "figure" [] (Some (img ~image_root label destination title attrs))
  else (
    (* the caption already carries the description, so repeating it in alt only
       makes a screen reader read it twice *)
    let img_el = img ~image_root ~alt:"" label destination title attrs in
    let caption = elt Block "figcaption" [] (Some (text alt)) in
    elt Block "figure" [] (Some (concat img_el caption)))

and sup attrs child = elt Inline "sup" attrs (Some child)

and inline ~image_root = function
  | Ast.Impl.Concat (_, l) -> concat_map (inline ~image_root) l
  | Text (_, t) -> text t
  | Emph (attr, il) -> elt Inline "em" attr (Some (inline ~image_root il))
  | Strong (attr, il) -> elt Inline "strong" attr (Some (inline ~image_root il))
  | Code (attr, s) -> elt Inline "code" attr (Some (text s))
  | Hard_break attr -> concat (elt Inline "br" attr None) nl
  | Soft_break _ -> nl
  | Html (_, body) -> raw body
  | Link (attr, { label; destination; title }) ->
    url ~image_root label destination title attr
  | Image (attr, { label; destination; title }) ->
    img ~image_root label destination title attr
  | Sup (attrs, il) -> sup attrs (inline ~image_root il)
  (* math reached here is inside a paragraph, so it renders inline. a paragraph
     that is nothing but math is handled as a block below *)
  | Math (_, content) -> raw (tex2mathml ~display:Camlmath.Inline content)
;;

let alignment_attributes = function
  | Default -> []
  | Left -> [ "align", "left" ]
  | Right -> [ "align", "right" ]
  | Centre -> [ "align", "center" ]
;;

let table_header ~image_root headers =
  elt
    Table
    "thead"
    []
    (Some
       (elt
          Table
          "tr"
          []
          (Some
             (concat_map
                (fun (header, alignment) ->
                   let attrs = alignment_attributes alignment in
                   elt Block "th" attrs (Some (inline ~image_root header)))
                headers))))
;;

let table_body ~image_root headers rows =
  elt
    Table
    "tbody"
    []
    (Some
       (concat_map
          (fun row ->
             elt
               Table
               "tr"
               []
               (Some
                  (concat_map2
                     (fun (_, alignment) cell ->
                        let attrs = alignment_attributes alignment in
                        elt Block "td" attrs (Some (inline ~image_root cell)))
                     headers
                     row)))
          rows))
;;

let footnote_block attr content =
  elt
    Block
    "div"
    (("class", "footnotes") :: attr)
    (Some (concat (elt Block "hr" [] None) content))
;;

(* changed from : to - to match deno lume's behavior *)
let footnote_list ~image_root footnotes =
  let backlink label =
    sup [] (url ~image_root (Text ([], "↩︎")) ("#fnref-" ^ label) None [])
  in
  let p footnote =
    elt
      Block
      "p"
      []
      (Some (concat (inline ~image_root footnote.content) (backlink footnote.label)))
  in
  elt
    Block
    "ol"
    []
    (Some
       (concat_map
          (fun footnote -> elt Block "li" [ "id", footnote.id ] (Some (p footnote)))
          footnotes))
;;

let rec block ~auto_identifiers ~image_root = function
  | Blockquote (attr, q) ->
    elt
      Block
      "blockquote"
      attr
      (Some (concat nl (concat_map (block ~auto_identifiers ~image_root) q)))
  | Paragraph (_, Ast.Impl.Image (attr, { label; destination; title })) ->
    figure ~image_root label destination title attr
  (* a paragraph that holds nothing but math becomes the display block itself.
     wrapping it in <p> instead would put a <div> inside a <p>, which no html
     parser keeps *)
  | Paragraph (_, Ast.Impl.Math (_, content)) ->
    elt
      Block
      "div"
      [ "class", "math-display" ]
      (Some (raw (tex2mathml ~display:Camlmath.Block content)))
  | Paragraph (attr, md) -> elt Block "p" attr (Some (inline ~image_root md))
  | List (attr, ty, sp, bl) ->
    let name =
      match ty with
      | Ordered _ -> "ol"
      | Bullet _ -> "ul"
    in
    let attr =
      match ty with
      | Ordered (n, _) when n <> 1 -> ("start", string_of_int n) :: attr
      | _ -> attr
    in
    let li t =
      let block' t =
        match t, sp with
        | Paragraph (_, t), Tight -> concat (inline ~image_root t) nl
        | _ -> block ~auto_identifiers ~image_root t
      in
      let nl = if sp = Tight then Null else nl in
      elt Block "li" [] (Some (concat nl (concat_map block' t)))
    in
    elt Block name attr (Some (concat nl (concat_map li bl)))
  | Code_block (attr, label, code) ->
    let lang = String.trim label in
    (* the language class names the block whether or not a grammar was found,
       so highlighted and unhighlighted blocks look the same to a consumer *)
    let code_attr = if lang = "" then [] else [ "class", "language-" ^ lang ] in
    let inner =
      match lang with
      | "" -> text code
      | lang ->
        (match Hilite.src_code_to_pairs ~lang code with
         | Ok pairs ->
           let rec drop_trailing_empty = function
             | [] -> []
             | [ line ] when List.for_all (fun (_, s) -> String.trim s = "") line -> []
             | line :: rest -> line :: drop_trailing_empty rest
           in
           drop_trailing_empty pairs
           |> List.concat
           (* content is already html escaped by hilite, the class is not *)
           |> List.map (fun (cls, content) ->
             elt Inline "span" [ "class", cls ] (Some (raw content)))
           |> List.fold_left (fun acc s -> concat acc s) Null
         | Error _ -> text code)
    in
    elt Block "pre" attr (Some (elt Inline "code" code_attr (Some inner)))
  | Thematic_break attr -> elt Block "hr" attr None
  | Html_block (_, body) -> raw body
  | Heading (attr, level, text) ->
    let name =
      match level with
      | 1 -> "h1"
      | 2 -> "h2"
      | 3 -> "h3"
      | 4 -> "h4"
      | 5 -> "h5"
      | 6 -> "h6"
      | _ -> "p"
    in
    (* when a heading has an id, prepend a "#" anchor link and add
       tabindex="-1" for accessibility match deno lume behavior *)
    (match List.assoc_opt "id" attr with
     | Some id ->
       let anchor =
         (* hidden from assistive tech, and unfocusable because aria-hidden must
            not sit on anything reachable by keyboard *)
         elt
           Inline
           "a"
           [ "class", "header-anchor"
           ; "href", "#" ^ id
           ; "aria-hidden", "true"
           ; "tabindex", "-1"
           ]
           (Some (raw "#"))
       in
       let attr' = ("tabindex", "-1") :: attr in
       let content = concat anchor (concat (raw " ") (inline ~image_root text)) in
       elt Block name attr' (Some content)
     | None -> elt Block name attr (Some (inline ~image_root text)))
  | Definition_list (attr, l) ->
    let f { term; defs } =
      concat
        (elt Block "dt" [] (Some (inline ~image_root term)))
        (concat_map (fun s -> elt Block "dd" [] (Some (inline ~image_root s))) defs)
    in
    elt Block "dl" attr (Some (concat_map f l))
  | Table (attr, headers, []) ->
    elt Table "table" attr (Some (table_header ~image_root headers))
  | Table (attr, headers, rows) ->
    elt
      Table
      "table"
      attr
      (Some
         (concat (table_header ~image_root headers) (table_body ~image_root headers rows)))
  | Footnote_list (_, []) -> Null
  | Footnote_list (attr, footnotes) ->
    footnote_block attr (footnote_list ~image_root footnotes)
;;

let of_doc ?(auto_identifiers = true) ?image_root doc =
  let identifiers = Identifiers.empty in
  let f identifiers = function
    | Heading (attr, level, text) ->
      let attr, identifiers =
        if (not auto_identifiers) || List.mem_assoc "id" attr
        then attr, identifiers
        else (
          let id = slugify (to_plain_text text) in
          (* Default identifier if empty. It matches what pandoc does. *)
          let id = if id = "" then "section" else id in
          let count, identifiers = Identifiers.touch id identifiers in
          let id = if count = 0 then id else Printf.sprintf "%s-%i" id count in
          ("id", id) :: attr, identifiers)
      in
      Heading (attr, level, text), identifiers
    | _ as c -> c, identifiers
  in
  let html, _ =
    List.fold_left
      (fun (accu, ids) x ->
         let x', ids = f ids x in
         let el = concat accu (block ~auto_identifiers ~image_root x') in
         el, ids)
      (Null, identifiers)
      doc
  in
  html
;;

let to_string t =
  let buf = Buffer.create 1024 in
  add_to_buffer buf t;
  Buffer.contents buf
;;
