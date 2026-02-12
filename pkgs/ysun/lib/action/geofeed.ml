type entry =
  { prefix : string
  ; country : string
  ; region : string
  ; city : string
  ; postal : string
  }

let header =
  "# StepBroBD, Inc. | noc@stepbrobd.com | AS10779, AS18932 | 2025-12-18T00:00:00Z"
;;

let entries =
  [ { prefix = "23.161.104.0/24"
    ; country = "US"
    ; region = "US-OR"
    ; city = "Portland"
    ; postal = "97210"
    }
  ; { prefix = "192.104.136.0/24"
    ; country = "US"
    ; region = "US-OR"
    ; city = "Portland"
    ; postal = "97210"
    }
  ; { prefix = "2602:f590::/36"
    ; country = "US"
    ; region = "US-OR"
    ; city = "Portland"
    ; postal = "97210"
    }
  ]
;;

let anycast_entries =
  [ { prefix = "23.161.104.17/32"
    ; country = "US"
    ; region = "US-OR"
    ; city = "Portland"
    ; postal = "97210"
    }
  ; { prefix = "2602:f590::23:161:104:17/128"
    ; country = "US"
    ; region = "US-OR"
    ; city = "Portland"
    ; postal = "97210"
    }
  ]
;;

type node =
  { name : string
  ; v4 : entry
  ; v6 : entry
  }

let nodes =
  [ { name = "Toompea"
    ; v4 =
        { prefix = "23.161.104.128/32"
        ; country = "EE"
        ; region = "EE-37"
        ; city = "Tallinn"
        ; postal = "10111"
        }
    ; v6 =
        { prefix = "2602:f590::23:161:104:128/128"
        ; country = "EE"
        ; region = "EE-37"
        ; city = "Tallinn"
        ; postal = "10111"
        }
    }
  ; { name = "Highline"
    ; v4 =
        { prefix = "23.161.104.129/32"
        ; country = "US"
        ; region = "US-NY"
        ; city = "New York City"
        ; postal = "10001"
        }
    ; v6 =
        { prefix = "2602:f590::23:161:104:129/128"
        ; country = "US"
        ; region = "US-NY"
        ; city = "New York City"
        ; postal = "10001"
        }
    }
  ; { name = "Kongo"
    ; v4 =
        { prefix = "23.161.104.130/32"
        ; country = "JP"
        ; region = "JP-27"
        ; city = "Osaka"
        ; postal = "540-0001"
        }
    ; v6 =
        { prefix = "2602:f590::23:161:104:130/128"
        ; country = "JP"
        ; region = "JP-27"
        ; city = "Osaka"
        ; postal = "540-0001"
        }
    }
  ; { name = "Timah"
    ; v4 =
        { prefix = "23.161.104.131/32"
        ; country = "SG"
        ; region = "SG"
        ; city = "Singapore"
        ; postal = "139963"
        }
    ; v6 =
        { prefix = "2602:f590::23:161:104:131/128"
        ; country = "SG"
        ; region = "SG"
        ; city = "Singapore"
        ; postal = "139963"
        }
    }
  ; { name = "Butte"
    ; v4 =
        { prefix = "23.161.104.132/32"
        ; country = "FR"
        ; region = "FR-IDF"
        ; city = "Paris"
        ; postal = "75000"
        }
    ; v6 =
        { prefix = "2602:f590::23:161:104:132/128"
        ; country = "FR"
        ; region = "FR-IDF"
        ; city = "Paris"
        ; postal = "75000"
        }
    }
  ; { name = "Isere"
    ; v4 =
        { prefix = "23.161.104.133/32"
        ; country = "FR"
        ; region = "FR-ARA"
        ; city = "Grenoble"
        ; postal = "38000"
        }
    ; v6 =
        { prefix = "2602:f590::23:161:104:133/128"
        ; country = "FR"
        ; region = "FR-ARA"
        ; city = "Grenoble"
        ; postal = "38000"
        }
    }
  ]
;;

let entry_to_csv { prefix; country; region; city; postal } =
  String.concat "," [ prefix; country; region; city; postal ]
;;

let generate () =
  let buf = Buffer.create 1024 in
  Buffer.add_string buf header;
  Buffer.add_char buf '\n';
  List.iter
    (fun e ->
       Buffer.add_string buf (entry_to_csv e);
       Buffer.add_char buf '\n')
    entries;
  Buffer.add_string buf "# Anycast\n";
  List.iter
    (fun e ->
       Buffer.add_string buf (entry_to_csv e);
       Buffer.add_char buf '\n')
    anycast_entries;
  List.iter
    (fun node ->
       Buffer.add_string buf ("# " ^ node.name ^ "\n");
       Buffer.add_string buf (entry_to_csv node.v4);
       Buffer.add_char buf '\n';
       Buffer.add_string buf (entry_to_csv node.v6);
       Buffer.add_char buf '\n')
    nodes;
  Buffer.contents buf
;;

let run (module R : Sigs.RESOLVER) cache =
  let open Yocaml.Task in
  Yocaml.Action.Static.write_file R.Target.geofeed (lift (fun () -> generate ())) cache
;;
