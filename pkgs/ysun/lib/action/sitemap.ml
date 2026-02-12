let escape_xml s =
  let buf = Buffer.create (String.length s) in
  String.iter
    (function
      | '&' -> Buffer.add_string buf "&amp;"
      | '<' -> Buffer.add_string buf "&lt;"
      | '>' -> Buffer.add_string buf "&gt;"
      | '"' -> Buffer.add_string buf "&quot;"
      | '\'' -> Buffer.add_string buf "&apos;"
      | c -> Buffer.add_char buf c)
    s;
  Buffer.contents buf
;;

let generate sorted_pages =
  let buf = Buffer.create 4096 in
  Buffer.add_string buf "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n";
  Buffer.add_string buf "<urlset xmlns=\"http://www.sitemaps.org/schemas/sitemap/0.9\">\n";
  List.iter
    (fun (meta, url, _file) ->
       let open Model.Page in
       if (not meta.hidden) && meta.redirect = None
       then (
         Buffer.add_string buf "  <url>\n";
         Buffer.add_string buf "    <loc>";
         Buffer.add_string buf (escape_xml (Config.site_url ^ url));
         Buffer.add_string buf "</loc>\n";
         (match meta.date with
          | Some d ->
            Buffer.add_string buf "    <lastmod>";
            Buffer.add_string buf (escape_xml d);
            Buffer.add_string buf "</lastmod>\n"
          | None -> ());
         Buffer.add_string buf "  </url>\n"))
    sorted_pages;
  Buffer.add_string buf "</urlset>\n";
  Buffer.contents buf
;;

let run (module R : Sigs.RESOLVER) (cache, sorted_pages) =
  let open Yocaml.Task in
  Yocaml.Action.Static.write_file
    R.Target.sitemap
    (lift (fun () -> generate sorted_pages))
    cache
;;
