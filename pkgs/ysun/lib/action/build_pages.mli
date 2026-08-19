(** [discover_templates dir] lists the liquid template names under [dir],
    relative to it and without the extension. *)
val discover_templates : string -> string list

(** An action that renders every page. [templates] is the available template
    list from {!val:discover_templates}. [deps] must contain every template and
    page file, since each rendered page embeds the nav menu built from all
    pages and liquid includes are resolved at render time. *)
val run
  :  (module Sigs.RESOLVER)
  -> templates:string list
  -> deps:Yocaml.Path.t list
  -> Yocaml.Cache.t * Index.entry list
  -> Yocaml.Cache.t Yocaml.Eff.t
