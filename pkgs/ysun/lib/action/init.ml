let run (module R : Sigs.RESOLVER) =
  Yocaml.Action.restore_cache ~on:`Target R.Target.cache
;;
