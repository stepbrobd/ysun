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

include Yocaml.Required.DATA_READABLE with type t := t
include Yocaml.Required.DATA_INJECTABLE with type t := t

val get_url : pages_prefix:Yocaml.Path.t -> Yocaml.Path.t -> string
val url_to_path : string -> string
val count_words : string -> int

type template_type =
  | Page
  | Other of string
  | Standalone of string
  | Error of string

val resolve_template : available_templates:string list -> t -> template_type * string
val inject_og_metas : t -> string -> t
