let run (module R : Sigs.RESOLVER) cache =
  let open Yocaml.Eff in
  let open Yocaml.Path in
  let src = R.Source.doc / "doc" in
  let dst = R.Target.doc / "doc" in
  cache
  |> Batch_copy.run ~extension:[ "csv" ] ~source:R.Source.static ~target:R.Target.static
  >>= Batch_copy.run ~extension:[ "pdf" ] ~source:src ~target:dst
;;
