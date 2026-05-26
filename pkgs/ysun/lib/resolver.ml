module Make (R : Sigs.RESOLVABLE) = struct
  include R
  open Yocaml

  module Source = struct
    (* - *)
    let root = R.source
    let executable = Path.rel [ Sys.argv.(0) ]

    (* - *)
    let pages = Path.rel [ "pages" ]
    let assets = Path.rel [ "assets" ]

    (* - *)
    let css = Path.(assets / "style" / "tailwind.css")

    (* - *)
    let static = Path.(assets / "static")
    let doc = Path.(static / "doc")
    let img = Path.(static / "img")
    let favicon = Path.(img / "favicon.ico")

    (* - *)
    let layouts = Path.(assets / "layout")
    let template file = Path.(layouts / file)
  end

  module Target = struct
    let root = R.target
    let cache = Path.(R.target / "cache")
    let assets = Path.(R.target / "assets")
    let static = Path.(assets / "static")
    let doc = Path.(static / "doc")
    let img = Path.(static / "img")
    let css = Path.(assets / "style" / "tailwind.css")
    let index = Path.(R.target / "index.html")
    let feed = Path.(R.target / "atom.xml")
    let geofeed = Path.(R.target / "geofeed.csv")
    let sitemap = Path.(R.target / "sitemap.xml")
    let robots = Path.(R.target / "robots.txt")
    let favicon = Path.(R.target / "favicon.ico")
  end

  module Url = struct
    (* strip every trailing '/' so concatenation with paths beginning with '/'
       never produces "//" — works for "https://ysun.co/", "https://ysun.co//",
       "https://sdf.org/~ysun/", etc. *)
    let strip_trailing_slashes s =
      let rec find_end i = if i > 0 && s.[i - 1] = '/' then find_end (i - 1) else i in
      String.sub s 0 (find_end (String.length s))
    ;;

    let site = strip_trailing_slashes R.root
    let absolute path = site ^ path
    let og_image = absolute "/assets/static/img/og.avif"
  end

  let track_common_dependencies = Yocaml.Pipeline.track_file Source.executable
end
