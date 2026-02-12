let run (module R : Sigs.RESOLVER) cache =
  let src = R.Source.img in
  let dst = R.Target.img in
  cache
  |> Batch_copy.run
       ~extension:[ "avif"; "png"; "jpg"; "svg"; "gif"; "ico" ]
       ~source:src
       ~target:dst
;;
