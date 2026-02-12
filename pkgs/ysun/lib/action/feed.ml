let parse_date date_str =
  match String.split_on_char '-' date_str with
  | [ y; m; d ] ->
    let year = int_of_string y in
    let month = int_of_string m in
    let day = int_of_string d in
    (match Yocaml.Datetime.make ~year ~month ~day () with
     | Ok dt -> Some (Yocaml_syndication.Datetime.make dt)
     | Error _ -> None)
  | _ -> None
;;

let default_datetime =
  match Yocaml.Datetime.make ~year:2024 ~month:1 ~day:1 () with
  | Ok dt -> Yocaml_syndication.Datetime.make dt
  | Error _ -> failwith "invalid default datetime"
;;

let make_entry (meta, url, _file) =
  let open Model.Page in
  let title =
    Yocaml_syndication.Atom.text (Option.value ~default:"Untitled" meta.title)
  in
  let id = Config.site_url ^ url in
  let updated =
    match meta.date with
    | Some d -> Option.value ~default:default_datetime (parse_date d)
    | None -> default_datetime
  in
  let links = [ Yocaml_syndication.Atom.alternate (Config.site_url ^ url) ] in
  let summary = Option.map Yocaml_syndication.Atom.text meta.description in
  Yocaml_syndication.Atom.entry ~title ~id ~updated ~links ?summary ()
;;

let run (module R : Sigs.RESOLVER) (cache, sorted_pages) =
  let open Yocaml.Task in
  let feed_pages =
    sorted_pages
    |> List.filter (fun (meta, _, _) ->
      let open Model.Page in
      (not meta.hidden) && meta.title <> Some Config.author_name)
    |> fun l ->
    let rec take n = function
      | [] -> []
      | _ when n <= 0 -> []
      | x :: xs -> x :: take (n - 1) xs
    in
    take 25 l
  in
  let authors =
    Yocaml.Nel.singleton (Yocaml_syndication.Person.make Config.author_name)
  in
  Yocaml.Action.Static.write_file
    R.Target.feed
    (lift (fun () -> feed_pages)
     >>> Yocaml_syndication.Atom.(
           from
             ~updated:(updated_from_entries ~default_value:default_datetime ())
             ~title:(text Config.author_name)
             ~authors
             ~id:(Config.site_url ^ "/")
             ~links:[ self (Config.site_url ^ "/atom.xml"); alternate Config.site_url ]
             make_entry))
    cache
;;
