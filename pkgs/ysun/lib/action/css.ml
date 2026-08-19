let run (module R : Sigs.RESOLVER) deps =
  let open Yocaml.Task in
  (* tailwind scans templates and pages for class names so they are real inputs *)
  let cmd =
    Yocaml.Cmd.make
      "tailwindcss"
      [ Yocaml.Cmd.param "input" (Yocaml.Cmd.w R.Source.css); Yocaml.Cmd.flag "m" ]
  in
  Yocaml.Action.Static.write_file
    R.Target.css
    (R.track_common_dependencies
     >>> Yocaml.Pipeline.track_files deps
     >>> Yocaml.Pipeline.exec_cmd_with_result cmd)
;;
