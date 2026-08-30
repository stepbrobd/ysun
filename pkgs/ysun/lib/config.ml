let author_name = "Yifei Sun"
let cache = "https://cache.ysun.co"

(* OUTPATH is set $out in nix *)
let outpath, narinfo =
  match Sys.getenv_opt "OUTPATH" with
  | Some out ->
    let hash = List.hd (String.split_on_char '-' (Filename.basename out)) in
    out, cache ^ "/" ^ hash ^ ".narinfo"
  | None -> "/nix/store/00000000000000000000000000000000-ysun", cache
;;
