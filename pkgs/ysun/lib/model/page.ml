type t =
  { title : string option
  ; description : string option
  ; date : string option
  ; words : int option
  ; minutes : int option
  ; list : bool
  ; layout : string option
  ; external_ : string option
  ; hidden : bool
  }

let make
      ?title
      ?description
      ?date
      ?words
      ?minutes
      ?(list = false)
      ?layout
      ?external_
      ?(hidden = false)
      ()
  =
  { title; description; date; words; minutes; list; layout; external_; hidden }
;;

let entity_name = "Page"
let empty = make ()
let neutral = Ok empty

let validate_underlying_page fields =
  let open Yocaml.Data.Validation in
  let+ title = optional fields "title" string
  and+ description = optional fields "description" string
  and+ date = optional fields "date" string
  and+ layout = optional fields "layout" string
  and+ external_ = optional fields "external" string
  and+ hidden = optional fields "hidden" bool in
  let hidden = Option.value ~default:false hidden in
  { title
  ; description
  ; date
  ; words = None
  ; minutes = None
  ; list = false
  ; layout
  ; external_
  ; hidden
  }
;;

let validate = Yocaml.Data.Validation.record validate_underlying_page

let normalize
      { title
      ; description
      ; date
      ; words
      ; minutes
      ; list = is_list
      ; layout
      ; external_
      ; hidden
      }
  =
  let open Yocaml.Data in
  [ "title", option string title
  ; "description", option string description
  ; "date", option string date
  ; "words", option int words
  ; "minutes", option int minutes
  ; "list", bool is_list
  ; "layout", option string layout
  ; "external", option string external_
  ; "hidden", bool hidden
  ]
;;

let get_url file =
  let open Yocaml in
  let filename = Path.basename file |> Option.value ~default:"" in
  let name = Filename.remove_extension filename in
  if name = "home" then "/" else "/" ^ name ^ "/"
;;

let count_words str =
  let regexp = Str.regexp "[ \n\r\t]+" in
  let words = Str.split regexp str in
  List.length words
;;

type template_type =
  | Page
  | Other of string

let resolve_template meta =
  let default = "page.liquid" in
  match meta.layout with
  | None -> Page, default
  | Some l ->
    let base = Filename.remove_extension l in
    let ext = Filename.extension l in
    let resolved = if ext = ".vto" then base ^ ".liquid" else l in
    if resolved = "page.liquid" then Page, resolved else Other resolved, resolved
;;
