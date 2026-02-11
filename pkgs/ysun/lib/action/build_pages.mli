val run
  :  (module Sigs.RESOLVER)
  -> Yocaml.Cache.t * (Model.Page.t * string * Yocaml.Path.t) list
  -> Yocaml.Cache.t Yocaml.Eff.t
