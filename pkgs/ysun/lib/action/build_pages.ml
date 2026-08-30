module Raw_data = struct
  type t = (string * Yocaml.Data.t) list

  let normalize x = x
end

let normalize_page_item (meta, url) =
  let open Yocaml.Data in
  let open Model.Page in
  record
    [ "title", string (escape meta.title)
    ; "created", string (escape meta.created)
    ; "url", string url
    ]
;;

let discover_templates layout_dir =
  let rec walk prefix dir =
    Sys.readdir dir
    |> Array.to_list
    |> List.concat_map (fun entry ->
      let path = Filename.concat dir entry in
      let name = if prefix = "" then entry else prefix ^ "/" ^ entry in
      if Sys.is_directory path
      then walk name path
      else if Filename.check_suffix entry ".liquid"
      then [ Filename.remove_extension name ]
      else [])
  in
  walk "" layout_dir
;;

let apply_template (module R : Sigs.RESOLVER) name =
  let open Yocaml.Task in
  lift (fun (data, html) ->
    let content_data = [ "content", Yocaml.Data.string html ] in
    data @ content_data, html)
  >>> Yocaml_liquid.Pipeline.as_template (module Raw_data) (R.Source.template name)
;;

let url_to_target (module R : Sigs.RESOLVER) url =
  if url = "/"
  then R.Target.index
  else (
    let segment = String.sub url 1 (String.length url - 2) in
    let parts = String.split_on_char '/' segment in
    Yocaml.Path.(Stdlib.List.fold_left ( / ) R.Target.root parts / "index.html"))
;;

let template_chain (module R : Sigs.RESOLVER) tmpl_type template_name =
  let open Yocaml.Task in
  let apply = apply_template (module R) in
  match (tmpl_type : Model.Page.template_type) with
  | Page -> apply "page.liquid" >>> apply "main.liquid"
  | Other -> apply template_name >>> apply "page.liquid" >>> apply "main.liquid"
  | Standalone -> apply template_name
  | Error -> apply template_name >>> apply "error/generic.liquid"
;;

let process_file
      (module R : Sigs.RESOLVER)
      ~available_templates
      ~deps
      menu_pages
      entry
      cache
  =
  let open Yocaml.Task in
  let { Index.meta = pre_meta; url; file = _; content } = entry in
  let target = url_to_target (module R) url in
  let tmpl_type, template_name =
    Model.Page.resolve_template ~available_templates pre_meta
  in
  let chain = template_chain (module R) tmpl_type template_name in
  Yocaml.Action.Static.write_file
    target
    (R.track_common_dependencies
     >>> Yocaml.Pipeline.track_files deps
     >>> lift (fun () ->
       let meta =
         Model.Page.inject_og_metas
           ~site_url:R.Url.site
           ~og_image:R.Url.og_image
           pre_meta
           url
       in
       let data = Model.Page.normalize meta in
       let pages_data = [ "pages", Yocaml.Data.list_of normalize_page_item menu_pages ] in
       let url_data = [ "url", Yocaml.Data.string url ] in
       let canonical_data = [ "canonical", Yocaml.Data.string (R.Url.absolute url) ] in
       let outpath_data =
         [ "outpath", Yocaml.Data.string Config.outpath
         ; "narinfo", Yocaml.Data.string Config.narinfo
         ]
       in
       data @ pages_data @ url_data @ canonical_data @ outpath_data, content)
     >>> Yocaml_omd.content_to_html ()
     >>> chain
     >>> lift snd)
    cache
;;

let run (module R : Sigs.RESOLVER) ~templates ~deps (cache, all_pages) =
  let open Yocaml.Eff in
  let available_templates = templates in
  let menu_pages =
    all_pages
    |> Stdlib.List.filter (fun e ->
      (not e.Index.meta.Model.Page.hidden) && e.Index.url <> "/")
    |> Stdlib.List.map (fun e -> e.Index.meta, e.Index.url)
  in
  let rec aux fs c =
    match fs with
    | [] -> return c
    | item :: rest ->
      let* next_c =
        process_file (module R) ~available_templates ~deps menu_pages item c
      in
      aux rest next_c
  in
  aux all_pages cache
;;
