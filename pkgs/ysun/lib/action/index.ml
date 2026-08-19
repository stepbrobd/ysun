type entry =
  { meta : Model.Page.t
  ; url : string
  ; file : Yocaml.Path.t
  ; content : string
  }

let run (module R : Sigs.RESOLVER) cache =
  let open Yocaml.Eff in
  let where kind path =
    match kind with
    | `File -> Yocaml.Path.has_extension "md" path
    | `Directory -> true
  in
  let* cache, entries =
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
         return (cache, { meta; url; file; content } :: state))
      cache
  in
  let sorted =
    entries
    |> Stdlib.List.sort (fun a b ->
      let open Model.Page in
      let created_cmp = String.compare b.meta.created a.meta.created in
      if created_cmp <> 0
      then created_cmp
      else String.compare b.meta.updated a.meta.updated)
  in
  return (cache, sorted)
;;
