let init_message (module R : Sigs.RESOLVER) =
  Yocaml.Eff.logf ~level:`Debug "target: `%a`" Yocaml.Path.pp R.target
;;

let run (module R : Sigs.RESOLVER) () =
  let open Yocaml.Eff in
  let* () = init_message (module R) in
  let* cache = Init.run (module R) >>= Assets.run (module R) >>= Images.run (module R) in
  let* cache, sorted_pages = Index.run (module R) cache in
  let templates = Build_pages.discover_templates "assets/layout" in
  let deps =
    Stdlib.List.map (fun name -> R.Source.template (name ^ ".liquid")) templates
    @ Stdlib.List.map (fun (e : Index.entry) -> e.file) sorted_pages
  in
  let* cache = Css.run (module R) deps cache in
  let* cache = Build_pages.run (module R) ~templates ~deps (cache, sorted_pages) in
  let* cache = Feed.run (module R) (cache, sorted_pages) in
  let* cache = Sitemap.run (module R) (cache, sorted_pages) in
  cache
  |> Geofeed.run (module R)
  >>= Robots.run (module R)
  >>= Yocaml.Action.copy_file ~into:R.Target.root R.Source.favicon
  >>= Yocaml.Action.store_cache R.Target.cache
;;
