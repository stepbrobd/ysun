let run_build target source log_level =
  let module Resolver =
    Ysun.Resolver.Make (struct
      let source = source
      let target = target
    end)
  in
  Yocaml_eio.run ~level:log_level (Ysun.Action.All.run (module Resolver))
;;

let run_watch target source log_level port =
  let module Resolver =
    Ysun.Resolver.Make (struct
      let source = source
      let target = target
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

let log_level_conv =
  Arg.conv
    ~docv:"LEVEL"
    ( (fun str ->
        match String.(str |> trim |> lowercase_ascii) with
        | "app" -> Result.ok `App
        | "info" -> Result.ok `Info
        | "error" -> Result.ok `Error
        | "warning" -> Result.ok `Warning
        | s -> Error (`Msg (Printf.sprintf "%S is not a valid log level" s)))
    , fun ppf -> function
        | `App -> Format.fprintf ppf "app"
        | `Info -> Format.fprintf ppf "info"
        | `Error -> Format.fprintf ppf "error"
        | `Warning -> Format.fprintf ppf "warning"
        | `Debug -> Format.fprintf ppf "debug" )
;;

let target_arg =
  let default = Yocaml.Path.rel [ "outputs" ] in
  let doc = "the directory where the site will be generated to" in
  let arg = Arg.info ~doc ~docs:Manpage.s_common_options [ "target"; "output" ] in
  Arg.(value (opt path_conv default arg))
;;

let source_arg =
  let default = Yocaml.Path.rel [] in
  let doc = "source directory" in
  let arg = Arg.info ~doc ~docs:Manpage.s_common_options [ "source"; "input" ] in
  Arg.(value (opt path_conv default arg))
;;

let port_arg =
  let default = 3000 in
  let doc = "dev server port" in
  let arg = Arg.info ~doc ~docs:Manpage.s_common_options [ "port"; "listen" ] in
  Arg.(value (opt port_conv default arg))
;;

let log_level_arg default =
  let doc = "log level (app | info | debug | error | warning)" in
  let arg = Arg.info ~doc ~docs:Manpage.s_common_options [ "log-level" ] in
  Arg.(value (opt log_level_conv default arg))
;;

let bug_report =
  "forked from <https://github.com/muhokama/ring>, do not report issues to upstream"
;;

let description = "forked from <https://github.com/muhokama/ring>, but for personal site"

let build =
  let doc = "build to TARGET from SOURCE with LOG_LEVEL" in
  let man =
    [ `S Manpage.s_description; `P description; `S Manpage.s_bugs; `P bug_report ]
  in
  let info = Cmd.info "build" ~version ~doc ~exits ~man in
  let term = Term.(const run_build $ target_arg $ source_arg $ log_level_arg `Debug) in
  Cmd.v info term
;;

let watch =
  let doc =
    "build to TARGET from SOURCE with LOG_LEVEL and launch a web server listening at PORT"
  in
  let man =
    [ `S Manpage.s_description; `P description; `S Manpage.s_bugs; `P bug_report ]
  in
  let info = Cmd.info "watch" ~version ~doc ~exits ~man in
  let term =
    Term.(const run_watch $ target_arg $ source_arg $ log_level_arg `Info $ port_arg)
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
