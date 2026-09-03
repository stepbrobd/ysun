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

val htmlentities : string -> string
val of_doc : ?auto_identifiers:bool -> attributes block list -> t
val to_string : t -> string
