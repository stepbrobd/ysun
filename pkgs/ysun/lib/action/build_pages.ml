module Make (R : Sigs.RESOLVER) = struct
  let normalize_page_item (meta, url) =
    let open Yocaml.Data in
    let open Model.Page in
    record
      [ "title", option string meta.title
      ; "date", option string meta.date
      ; "url", string url
      ]
  ;;

  module Raw_data = struct
    type t = (string * Yocaml.Data.t) list

    let normalize x = x
  end

  let run (cache, all_pages) =
    let open Yocaml.Eff in
    let menu_pages =
      all_pages
      |> Stdlib.List.filter (fun (meta, _, _) -> not meta.Model.Page.hidden)
      |> Stdlib.List.map (fun (meta, url, _) -> meta, url)
    in
    let process_file (pre_meta, url, file) cache =
      let open Yocaml.Task in
      let target =
        let open Yocaml.Path in
        if url = "/"
        then R.Target.index
        else (
          (* remove leading / and trailing / *)
          let segment = String.sub url 1 (String.length url - 2) in
          R.Target.root / segment / "index.html")
      in
      let tmpl_type, template_name = Model.Page.resolve_template pre_meta in
      let template_path = R.Source.template template_name in
      Yocaml.Action.Static.write_file
        target
        (R.track_common_dependencies
         >>> Yocaml.Pipeline.track_file file
         (* read content again, ignore fresh metadata, use pre_meta *)
         >>> Yocaml_yaml.Pipeline.read_file_with_metadata (module Model.Page) file
         >>> lift (fun (_, content) ->
           let data = Model.Page.normalize pre_meta in
           let pages_data =
             [ "pages", Yocaml.Data.list_of normalize_page_item menu_pages ]
           in
           let url_data = [ "url", Yocaml.Data.string url ] in
           let final_data = data @ pages_data @ url_data in
           final_data, content)
         >>> Yocaml_omd.content_to_html ()
         >>> lift (fun (data, html) ->
           let content_data = [ "content", Yocaml.Data.string html ] in
           let final_data = data @ content_data in
           final_data, html)
         (* custom template *)
         >>> Yocaml_liquid.Pipeline.as_template (module Raw_data) template_path
         (* apply page template wrapper if needed *)
         >>> (match tmpl_type with
           | Other _ ->
             lift (fun (data, html) ->
               let content_data = [ "content", Yocaml.Data.string html ] in
               data @ content_data, html)
             >>> Yocaml_liquid.Pipeline.as_template
                   (module Raw_data)
                   (R.Source.template "page.liquid")
           | Page -> lift (fun x -> x))
         (* apply main layout *)
         >>> lift (fun (data, html) ->
           let content_data = [ "content", Yocaml.Data.string html ] in
           data @ content_data, html)
         >>> Yocaml_liquid.Pipeline.as_template
               (module Raw_data)
               (R.Source.template "main.liquid")
         >>> lift snd)
        cache
    in
    let rec aux fs c =
      match fs with
      | [] -> return c
      | item :: rest ->
        let* next_c = process_file item c in
        aux rest next_c
    in
    aux all_pages cache
  ;;
end

let run (module R : Sigs.RESOLVER) (cache, pages) =
  let module M = Make (R) in
  M.run (cache, pages)
;;
