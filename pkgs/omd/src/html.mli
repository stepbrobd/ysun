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

(** Raised when a [Math] node does not convert: an expression outside the
    subset camlmath accepts, a character it cannot emit, or a [$$] pair that was
    never meant as math. The payload names the failure and the source it came
    from. *)
exception Math_error of string

(** Raised when an image destination is site local, an [image_root] was given,
    and the file cannot be read or decoded. The payload names the failure, the
    destination as written and the path it resolved to. *)
exception Image_error of string

val htmlentities : string -> string
val of_doc : ?auto_identifiers:bool -> ?image_root:string -> attributes block list -> t
val to_string : t -> string
