module Raw_data = struct
  type t = (string * Yocaml.Data.t) list

  let normalize x = x
end

let normalize_page_item (meta, url) =
  let open Yocaml.Data in
  let open Model.Page in
  record
    [ "title", option string meta.title
    ; "date", option string meta.date
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
  | Other _ -> apply template_name >>> apply "page.liquid" >>> apply "main.liquid"
  | Standalone _ -> apply template_name
  | Error _ -> apply template_name >>> apply "error/generic.liquid"
;;

let process_file
      (module R : Sigs.RESOLVER)
      ~available_templates
      menu_pages
      (pre_meta, url, file)
      cache
  =
  let open Yocaml.Task in
  let target = url_to_target (module R) url in
  let tmpl_type, template_name =
    Model.Page.resolve_template ~available_templates pre_meta
  in
  let chain = template_chain (module R) tmpl_type template_name in
  Yocaml.Action.Static.write_file
    target
    (R.track_common_dependencies
     >>> Yocaml.Pipeline.track_file file
     >>> Yocaml_yaml.Pipeline.read_file_with_metadata (module Model.Page) file
     >>> lift (fun (_, content) ->
       let meta = Model.Page.inject_og_metas pre_meta url in
       let data = Model.Page.normalize meta in
       let pages_data = [ "pages", Yocaml.Data.list_of normalize_page_item menu_pages ] in
       let url_data = [ "url", Yocaml.Data.string url ] in
       data @ pages_data @ url_data, content)
     >>> Yocaml_omd.content_to_html ()
     >>> chain
     >>> lift snd)
    cache
;;

let run (module R : Sigs.RESOLVER) (cache, all_pages) =
  let open Yocaml.Eff in
  let available_templates = discover_templates "assets/layout" in
  let menu_pages =
    all_pages
    |> Stdlib.List.filter (fun (meta, url, _) ->
      (not meta.Model.Page.hidden) && url <> "/")
    |> Stdlib.List.map (fun (meta, url, _) -> meta, url)
  in
  let rec aux fs c =
    match fs with
    | [] -> return c
    | item :: rest ->
      let* next_c = process_file (module R) ~available_templates menu_pages item c in
      aux rest next_c
  in
  aux all_pages cache
;;
