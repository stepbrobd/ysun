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

val empty : t

val make
  :  ?title:string
  -> ?description:string
  -> ?date:string
  -> ?words:int
  -> ?minutes:int
  -> ?list:bool
  -> ?layout:string
  -> ?external_:string
  -> ?hidden:bool
  -> unit
  -> t

val validate_underlying_page
  :  (string * Yocaml.Data.t) list
  -> t Yocaml.Data.Validation.validated_record

include Yocaml.Required.DATA_READABLE with type t := t
include Yocaml.Required.DATA_INJECTABLE with type t := t

val get_url : Yocaml.Path.t -> string
val count_words : string -> int

type template_type =
  | Page
  | Other of string

val resolve_template : t -> template_type * string
