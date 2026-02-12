let run (module R : Sigs.RESOLVER) cache =
  let open Yocaml.Eff in
  let where kind path =
    match kind with
    | `File -> Yocaml.Path.has_extension "md" path
    | `Directory -> true
  in
  let* cache, page_list =
    Yocaml.Batch.fold_tree
      ~where
      ~state:[]
      R.Source.pages
      (fun file state cache ->
         let* meta, content =
           Yocaml_yaml.Eff.read_file_with_metadata (module Model.Page) ~on:`Source file
         in
         let url =
           match meta.Model.Page.url with
           | Some u -> Model.Page.url_to_path u
           | None -> Model.Page.get_url ~pages_prefix:R.Source.pages file
         in
         let words = Model.Page.count_words content in
         let minutes = max 1 (words / 200) in
         let meta = { meta with words = Some words; minutes = Some minutes } in
         return (cache, (meta, url, file) :: state))
      cache
  in
  let sorted_pages =
    page_list
    |> Stdlib.List.sort (fun (a, _, _) (b, _, _) ->
      let open Model.Page in
      let da = Option.value ~default:"" a.date in
      let db = Option.value ~default:"" b.date in
      String.compare db da)
  in
  return (cache, sorted_pages)
;;
