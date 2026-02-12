let make_url_node (meta, url, _file) =
  let open Model.Page in
  let open Yocaml_syndication.Xml in
  let loc = leaf ~name:"loc" (escape (Config.site_url ^ url)) in
  let lastmod = may_leaf ~name:"lastmod" ~finalize:escape Fun.id meta.date in
  node ~name:"url" [ loc; lastmod ]
;;

let generate sorted_pages =
  let open Yocaml_syndication.Xml in
  let entries =
    sorted_pages
    |> List.filter (fun (meta, _, _) ->
      let open Model.Page in
      (not meta.hidden) && meta.redirect = None)
    |> List.map make_url_node
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
  Yocaml.Action.Static.write_file
    R.Target.sitemap
    (lift (fun () -> generate sorted_pages))
    cache
;;
