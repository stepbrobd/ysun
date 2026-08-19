let run_build target root log_level =
  let module Resolver = Ysun.Resolver.Make (struct
      let target = target
      let root = root
    end)
  in
  Yocaml_eio.run ~level:log_level (Ysun.Action.All.run (module Resolver))
;;

let run_watch target root log_level port =
  let module Resolver = Ysun.Resolver.Make (struct
      let target = target
      let root = root
    end)
  in
  Yocaml_eio.serve
    ~target:Resolver.target
    ~level:log_level
    ~port
    (Ysun.Action.All.run (module Resolver))
;;

open Cmdliner

let exits = Cmd.Exit.defaults

let version =
  match Build_info.V1.version () with
  | Some v -> Build_info.V1.Version.to_string v
  | None -> raise (Failure "incorrect dune-build-info setup")
;;

let path_conv =
  Arg.conv
    ~docv:"PATH"
    ((fun str -> str |> Yocaml.Path.from_string |> Result.ok), Yocaml.Path.pp)
;;

let port_conv =
  Arg.conv'
    ~docv:"PORT"
    ( (fun str ->
        match int_of_string_opt str with
        | None -> Result.error (str ^ " is not a valid port value")
        | Some x when x < 0 -> Result.error (str ^ " is < 0")
        | Some x when x > 65535 -> Result.error (str ^ " is > 65535")
        | Some x -> Result.ok x)
    , fun ppf -> Format.fprintf ppf "%04d" )
;;

let log_levels =
  [ "app", `App; "info", `Info; "debug", `Debug; "warning", `Warning; "error", `Error ]
;;

let target_arg =
  let default = Yocaml.Path.rel [ "outputs" ] in
  let doc = "the directory where the site will be generated to" in
  let arg = Arg.info ~doc ~docs:Manpage.s_common_options [ "target"; "output" ] in
  Arg.(value (opt path_conv default arg))
;;

let root_arg =
  let default = "https://ysun.co" in
  let doc =
    "canonical site root URL, used to build per-page <link rel=\"canonical\"> tags as \
     well as absolute URLs in the sitemap, atom feed and robots.txt. trailing slashes \
     are stripped, so https://example.com and https://example.com/ are equivalent. \
     subpath roots are not supported because asset and page links are root absolute"
  in
  let arg = Arg.info ~doc ~docs:Manpage.s_common_options [ "root"; "canonical" ] in
  Arg.(value (opt string default arg))
;;

let port_arg =
  let default = 3000 in
  let doc = "dev server port" in
  let arg = Arg.info ~doc ~docs:Manpage.s_common_options [ "port"; "listen" ] in
  Arg.(value (opt port_conv default arg))
;;

let log_level_arg default =
  let doc = Printf.sprintf "log level, %s" (Arg.doc_alts_enum log_levels) in
  let arg = Arg.info ~doc ~docs:Manpage.s_common_options [ "log-level" ] in
  Arg.(value (opt (enum log_levels) default arg))
;;

let bug_report =
  "forked from <https://github.com/muhokama/ring>, do not report issues to upstream"
;;

let description = "forked from <https://github.com/muhokama/ring>, but for personal site"

let build =
  let doc = "build to TARGET with LOG_LEVEL" in
  let man =
    [ `S Manpage.s_description; `P description; `S Manpage.s_bugs; `P bug_report ]
  in
  let info = Cmd.info "build" ~version ~doc ~exits ~man in
  let term = Term.(const run_build $ target_arg $ root_arg $ log_level_arg `Debug) in
  Cmd.v info term
;;

let watch =
  let doc = "build to TARGET with LOG_LEVEL and launch a web server listening at PORT" in
  let man =
    [ `S Manpage.s_description; `P description; `S Manpage.s_bugs; `P bug_report ]
  in
  let info = Cmd.info "watch" ~version ~doc ~exits ~man in
  let term =
    Term.(const run_watch $ target_arg $ root_arg $ log_level_arg `Info $ port_arg)
  in
  Cmd.v info term
;;

let index =
  let doc = "ysun" in
  let man =
    [ `S Manpage.s_description; `P description; `S Manpage.s_bugs; `P bug_report ]
  in
  let info = Cmd.info "ysun" ~version ~doc ~man in
  let default = Term.(ret (const (`Help (`Pager, None)))) in
  Cmd.group info ~default [ build; watch ]
;;

let () = exit @@ Cmd.eval index
