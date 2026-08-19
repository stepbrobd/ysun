let make_url_node ~site_url (e : Index.entry) =
  let open Yocaml_syndication.Xml in
  let loc = leaf ~name:"loc" (escape (site_url ^ e.url)) in
  let lastmod = leaf ~name:"lastmod" (escape e.meta.Model.Page.updated) in
  node ~name:"url" [ loc; lastmod ]
;;

let generate ~site_url sorted_pages =
  let open Yocaml_syndication.Xml in
  let entries =
    sorted_pages
    |> List.filter (fun (e : Index.entry) ->
      (not e.meta.Model.Page.hidden) && e.meta.Model.Page.redirect = None)
    |> List.map (make_url_node ~site_url)
  in
  let urlset =
    node
      ~name:"urlset"
      ~attr:[ Attr.string ~key:"xmlns" "http://www.sitemaps.org/schemas/sitemap/0.9" ]
      entries
  in
  document urlset |> to_string
;;

let run (module R : Sigs.RESOLVER) (cache, sorted_pages) =
  let open Yocaml.Task in
  let page_files = List.map (fun (e : Index.entry) -> e.file) sorted_pages in
  Yocaml.Action.Static.write_file
    R.Target.sitemap
    (R.track_common_dependencies
     >>> Yocaml.Pipeline.track_files page_files
     >>> lift (fun () -> generate ~site_url:R.Url.site sorted_pages))
    cache
;;
