(** An action that reads every page once, producing the metadata, url, source
    path, and body content used by all downstream actions. *)

type entry =
  { meta : Model.Page.t
  ; url : string
  ; file : Yocaml.Path.t
  ; content : string
  }

val run
  :  (module Sigs.RESOLVER)
  -> Yocaml.Cache.t
  -> (Yocaml.Cache.t * entry list) Yocaml.Eff.t
