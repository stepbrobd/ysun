let run (module R : Sigs.RESOLVER) cache =
  let open Yocaml.Eff in
  cache
  |> Batch_copy.run ~extension:[ "csv" ] ~source:R.Source.static ~target:R.Target.static
  >>= Batch_copy.run ~extension:[ "pdf" ] ~source:R.Source.doc ~target:R.Target.doc
;;
