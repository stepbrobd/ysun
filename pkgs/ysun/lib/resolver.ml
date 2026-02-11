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
  end

  let track_common_dependencies = Yocaml.Pipeline.track_file Source.executable
end
