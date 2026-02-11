let init_message (module R : Sigs.RESOLVER) =
  Yocaml.Eff.logf
    ~level:`Debug
    "source: `%a`, target: `%a`"
    Yocaml.Path.pp
    R.source
    Yocaml.Path.pp
    R.target
;;

let run (module R : Sigs.RESOLVER) () =
  let open Yocaml.Eff in
  let* () = init_message (module R) in
  let* cache = Init.run (module R) in
  return cache
  >>= Css.run (module R)
  >>= Assets.run (module R)
  >>= Images.run (module R)
  >>= Index.run (module R)
  >>= Build_pages.run (module R)
  >>= Yocaml.Action.store_cache R.Target.cache
;;
