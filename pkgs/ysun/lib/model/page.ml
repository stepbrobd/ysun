type t =
  { title : string option
  ; description : string option
  ; date : string option
  ; words : int option
  ; minutes : int option
  ; url : string option
  ; layout : string option
  ; hidden : bool
  ; redirect : string option
  ; metas : (string * string) list
  }

let make
      ?title
      ?description
      ?date
      ?words
      ?minutes
      ?url
      ?layout
      ?(hidden = false)
      ?redirect
      ?(metas = [])
      ()
  =
  { title; description; date; words; minutes; url; layout; hidden; redirect; metas }
;;

let entity_name = "Page"
let empty = make ()
let neutral = Ok empty

let validate_string_pairs =
  Yocaml.Data.Validation.record (fun fields ->
    let open Yocaml.Data.Validation in
    let pairs =
      List.filter_map
        (fun (key, value) ->
           match string value with
           | Ok s -> Some (key, s)
           | Error _ -> None)
        fields
    in
    Ok pairs)
;;

let validate_underlying_page fields =
  let open Yocaml.Data.Validation in
  let+ title = optional fields "title" string
  and+ description = optional fields "description" string
  and+ date = optional fields "date" string
  and+ url = optional fields "url" string
  and+ layout = optional fields "layout" string
  and+ hidden = optional fields "hidden" bool
  and+ redirect = optional fields "redirect" string
  and+ metas = optional fields "metas" validate_string_pairs in
  let hidden = Option.value ~default:false hidden in
  let metas = Option.value ~default:[] metas in
  { title
  ; description
  ; date
  ; words = None
  ; minutes = None
  ; url
  ; layout
  ; hidden
  ; redirect
  ; metas
  }
;;

let validate = Yocaml.Data.Validation.record validate_underlying_page

let normalize
      { title
      ; description
      ; date
      ; words
      ; minutes
      ; url = _
      ; layout
      ; hidden
      ; redirect
      ; metas
      }
  =
  let open Yocaml.Data in
  [ "title", option string title
  ; "description", option string description
  ; "date", option string date
  ; "words", option int words
  ; "minutes", option int minutes
  ; "layout", option string layout
  ; "hidden", bool hidden
  ; "redirect", option string redirect
  ; ( "metas"
    , list
        (List.map
           (fun (k, v) ->
              let attr =
                if String.length k > 3 && String.sub k 0 3 = "og:"
                then "property"
                else "name"
              in
              record [ "attr", string attr; "name", string k; "content", string v ])
           metas) )
  ]
;;

let get_url ~pages_prefix file =
  let open Yocaml in
  let trimmed = Path.trim ~prefix:pages_prefix file in
  let _, segments = Path.to_pair trimmed in
  (* segments = ["error"; "widget.md"] or ["home.md"] *)
  let segments =
    List.map
      (fun s -> if Filename.check_suffix s ".md" then Filename.remove_extension s else s)
      segments
  in
  (* if last segment is "index", drop it: ["error"; "index"] -> "/error/" *)
  let segments =
    match List.rev segments with
    | "index" :: rest -> List.rev rest
    | _ -> segments
  in
  "/" ^ String.concat "/" segments ^ "/"
;;

let url_to_path u =
  (* convert frontmatter url like "/index.html" to a URL path like "/" *)
  if String.length u = 0
  then "/"
  else (
    let base =
      if Filename.check_suffix u ".html" then Filename.remove_extension u else u
    in
    (* "/index" -> "/", "/foo/index" -> "/foo/" *)
    if base = "/index"
    then "/"
    else if
      String.length base > 6 && String.sub base (String.length base - 6) 6 = "/index"
    then String.sub base 0 (String.length base - 5)
    else if base.[String.length base - 1] = '/'
    then base
    else base ^ "/")
;;

let count_words str =
  let regexp = Str.regexp "[ \n\r\t]+" in
  let words = Str.split regexp str in
  List.length words
;;

type template_type =
  | Page
  | Other of string
  | Standalone of string
  | Error of string

let resolve_template ~available_templates meta =
  let resolve name =
    if List.mem name available_templates
    then name ^ ".liquid"
    else
      failwith
        (Printf.sprintf
           "unknown template %S (available: %s)"
           name
           (String.concat ", " available_templates))
  in
  match meta.layout with
  | None | Some "page" ->
    let f = resolve "page" in
    Page, f
  | Some name when name = "error/generic" ->
    let f = resolve name in
    Standalone f, f
  | Some name when String.starts_with ~prefix:"error/" name ->
    let f = resolve name in
    Error f, f
  | Some name ->
    let f = resolve name in
    Other f, f
;;

let inject_og_metas meta url =
  let og =
    [ "og:type", "website"
    ; "og:locale", "en_US"
    ; "og:title", Option.value ~default:"" meta.title
    ; "og:url", Config.site_url ^ url
    ; "og:image", Config.og_image
    ; "twitter:card", "summary_large_image"
    ]
  in
  let og =
    match meta.description with
    | Some d -> og @ [ "og:description", d; "description", d ]
    | None -> og
  in
  { meta with metas = og @ meta.metas }
;;
