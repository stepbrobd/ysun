let generate ~sitemap_url =
  String.concat "\n" [ "User-agent: *"; "Allow: /"; ""; "Sitemap: " ^ sitemap_url; "" ]
;;

let run (module R : Sigs.RESOLVER) cache =
  let open Yocaml.Task in
  let sitemap_url = R.Url.absolute "/sitemap.xml" in
  Yocaml.Action.Static.write_file
    R.Target.robots
    (lift (fun () -> generate ~sitemap_url))
    cache
;;
