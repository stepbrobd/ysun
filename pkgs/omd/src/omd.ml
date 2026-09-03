(* The document model *)

include Ast.Impl

(* Helper functions for construction document AST *)

module Ctor = Ast_constructors.Impl

(* Table of contents *)

let headers = Toc.headers
let toc = Toc.toc

(* Conversion *)

let parse_inline ~fnrefs defs s = Parser.inline ~fnrefs defs (Parser.P.of_string s)

(* the trailing footnote list, or nothing when the document defines none. an
   empty block here would reach every consumer that matches over blocks *)
let footnotes defs =
  match
    List.filter_map
      (fun def ->
         match def.Parser.kind with
         | Footnote { id; label } ->
           Some { id; label; Ast_block.Raw.content = def.destination }
         | _ -> None)
      defs
  with
  | [] -> []
  | footnote_defs -> [ (Footnote_list ([], footnote_defs) : _ Ast_block.Raw.block) ]
;;

let parse_inlines (md, defs) : doc =
  let defs =
    let f (def : attributes Parser.link_def) =
      { def with label = Parser.normalize def.label }
    in
    List.map f defs
  in
  let blocks = md @ footnotes defs in
  (* one table per document so a label referenced twice gets two distinct ids *)
  let fnrefs = Hashtbl.create 8 in
  List.map (Ast_block.Mapper.map (parse_inline ~fnrefs defs)) blocks
;;

let escape_html_entities = Html.htmlentities
let of_channel ic : doc = parse_inlines (Block_parser.Pre.of_channel ic)
let of_string s = parse_inlines (Block_parser.Pre.of_string s)

exception Math_error = Html.Math_error

let to_html ?auto_identifiers doc = Html.to_string (Html.of_doc ?auto_identifiers doc)
let to_sexp ast = Format.asprintf "@[%a@]@." Sexp.print (Sexp.create ast)
