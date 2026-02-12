let generate () =
  String.concat
    "\n"
    [ "User-agent: *"
    ; "Allow: /"
    ; ""
    ; "Sitemap: " ^ Config.site_url ^ "/sitemap.xml"
    ; ""
    ]
;;

let run (module R : Sigs.RESOLVER) cache =
  let open Yocaml.Task in
  Yocaml.Action.Static.write_file R.Target.robots (lift (fun () -> generate ())) cache
;;
