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
      let ca = Option.value ~default:"" a.created in
      let cb = Option.value ~default:"" b.created in
      let created_cmp = String.compare cb ca in
      if created_cmp <> 0
      then created_cmp
      else (
        let ua = Option.value ~default:"" a.updated in
        let ub = Option.value ~default:"" b.updated in
        String.compare ub ua))
  in
  return (cache, sorted_pages)
;;
