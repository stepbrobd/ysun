let run ?extension ~source ~target cache =
  let where = Option.map Yocaml.Path.one_of_extensions extension in
  Yocaml.Action.batch
    ~only:`Files
    ?where
    source
    (Yocaml.Action.copy_file ~into:target)
    cache
;;
