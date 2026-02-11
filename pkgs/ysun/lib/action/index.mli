val run
  :  (module Sigs.RESOLVER)
  -> Yocaml.Cache.t
  -> (Yocaml.Cache.t * (Model.Page.t * string * Yocaml.Path.t) list) Yocaml.Eff.t
