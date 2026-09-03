(** {1 A markdown parser in OCaml} *)

(** {2 The document model}

    The following types define the AST representing Omd's document model. *)

include Ast.Intf

(** {2 Helper functions for constructing the document AST } *)

module Ctor : Ast_constructors.Intf

(** {2 Generating and constructing tables of contents} *)

val headers : ?remove_links:bool -> 'attr block list -> ('attr * int * 'attr inline) list
val toc : ?start:int list -> ?depth:int -> doc -> doc

(** {2 Helper functions} *)

(** Perform escaping of HTML entities. Turns: ['"'] into ["&quot;"],
    ['&'] into ["&amp;"], ['<'] in ["&lt;"] and ['>'] into ["&gt;"]
*)
val escape_html_entities : string -> string

(** {2 Converting to and from documents} *)

val of_channel : in_channel -> doc
val of_string : string -> doc

(** Raised by {!to_html} when a math node does not convert: an expression
    outside the subset camlmath accepts, a character it cannot emit, or a [$$]
    pair that was never meant as math. Nothing is emitted for such a node,
    because rendering the source as text would ship raw TeX to readers while
    reporting success. *)
exception Math_error of string

(** Raised by {!to_html} when [image_root] is given and a site local image
    cannot be read or decoded. Without [image_root] no image is opened at all,
    so rendering stays a function of the document alone. *)
exception Image_error of string

(** [to_html ?image_root doc] renders [doc]. [image_root] is the directory a
    site absolute image destination is resolved against; give it to have
    [width] and [height] filled in from the file on disk, and to have a
    destination that does not resolve raise {!Image_error} rather than silently
    render without them. Remote destinations are never opened. *)
val to_html : ?auto_identifiers:bool -> ?image_root:string -> doc -> string

val to_sexp : doc -> string
