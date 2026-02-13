let ocaml_interface =
  `Assoc
    [ "name", `String "OCaml Interface"
    ; "scopeName", `String "source.ocaml.interface"
    ; "fileTypes", `List [ `String "mli"; `String "eliomi" ]
    ; ( "patterns"
      , `List
          [ `Assoc [ "include", `String "source.ocaml#directives" ]
          ; `Assoc [ "include", `String "source.ocaml#comments" ]
          ; `Assoc [ "include", `String "source.ocaml#attributes" ]
          ; `Assoc [ "include", `String "source.ocaml#extensions" ]
          ; `Assoc [ "include", `String "#bindings" ]
          ; `Assoc [ "include", `String "source.ocaml#operators" ]
          ; `Assoc [ "include", `String "#keywords" ]
          ; `Assoc [ "include", `String "source.ocaml#types" ]
          ; `Assoc [ "include", `String "source.ocaml#identifiers" ]
          ] )
    ; ( "repository"
      , `Assoc
          [ ( "bindings"
            , `Assoc
                [ ( "comment"
                  , `String "bindings that are shared between .ml and .mli syntaxes" )
                ; ( "patterns"
                  , `List
                      [ `Assoc
                          [ "comment", `String "optional labeled argument"
                          ; "name", `String "variable.parameter.optional.ocaml"
                          ; "match", `String "\\?([[:lower:]_][[:word:]']*)?"
                          ]
                      ; `Assoc
                          [ "comment", `String "labeled argument"
                          ; "name", `String "variable.parameter.labeled.ocaml"
                          ; "match", `String "~([[:lower:]_][[:word:]']*)?"
                          ]
                      ; `Assoc
                          [ "comment", `String "type declaration"
                          ; ( "match"
                            , `String
                                "\\b(type)[[:space:]]+(nonrec[[:space:]]+)?(_[[:space:]]+|[+-]?'[[:alpha:]][[:word:]']*[[:space:]]+|\\(.*\\)[[:space:]]+)?([[:lower:]_][[:word:]']*)"
                            )
                          ; ( "captures"
                            , `Assoc
                                [ "1", `Assoc [ "name", `String "keyword.ocaml" ]
                                ; "2", `Assoc [ "name", `String "keyword.ocaml" ]
                                ; ( "3"
                                  , `Assoc
                                      [ ( "patterns"
                                        , `List [ `Assoc [ "include", `String "$base" ] ]
                                        )
                                      ] )
                                ; ( "4"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "entity.name.function.binding.ocaml" )
                                      ] )
                                ] )
                          ]
                      ; `Assoc
                          [ ( "comment"
                            , `String
                                "and declaration for let bindings, type declarations, \
                                 class bindings, class type definitions, or module \
                                 constraints" )
                          ; ( "match"
                            , `String
                                "\\b(and)[[:space:]]+(?!(?:module|type|lazy)\\b(?!'))(virtual[[:space:]]+)?(_[[:space:]]+|'[[:alpha:]][[:word:]']*[[:space:]]+|\\(.*\\)[[:space:]]+)?([[:lower:]_][[:word:]']*)(?![[:word:]'])[[:space:]]*(?!,|::|[[:space:]])"
                            )
                          ; ( "captures"
                            , `Assoc
                                [ "1", `Assoc [ "name", `String "keyword.ocaml" ]
                                ; "2", `Assoc [ "name", `String "keyword.ocaml" ]
                                ; ( "3"
                                  , `Assoc
                                      [ ( "patterns"
                                        , `List [ `Assoc [ "include", `String "$base" ] ]
                                        )
                                      ] )
                                ; ( "4"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "entity.name.function.binding.ocaml" )
                                      ] )
                                ] )
                          ]
                      ; `Assoc
                          [ "comment", `String "external declaration"
                          ; ( "begin"
                            , `String
                                "\\b(external)[[:space:]]+([[:lower:]_][[:word:]']*)?" )
                          ; ( "beginCaptures"
                            , `Assoc
                                [ "1", `Assoc [ "name", `String "keyword.ocaml" ]
                                ; ( "2"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "entity.name.function.binding.ocaml" )
                                      ] )
                                ] )
                          ; "end", `String "(?<=]|\")[[:space:]]*(?:$|(?=]))"
                          ; ( "patterns"
                            , `List
                                [ `Assoc
                                    [ "comment", `String "string literal"
                                    ; "name", `String "string.quoted.double.ocaml"
                                    ; "begin", `String "\""
                                    ; "end", `String "\""
                                    ]
                                ; `Assoc [ "include", `String "$base" ]
                                ] )
                          ]
                      ; `Assoc
                          [ ( "comment"
                            , `String "val declaration for class instance variables" )
                          ; ( "match"
                            , `String
                                "\\b(val)[[:space:]]+(virtual)[[:space:]]+(mutable)[[:space:]]+([[:lower:]_][[:word:]']*)"
                            )
                          ; ( "captures"
                            , `Assoc
                                [ "1", `Assoc [ "name", `String "keyword.ocaml" ]
                                ; "2", `Assoc [ "name", `String "keyword.ocaml" ]
                                ; "3", `Assoc [ "name", `String "keyword.ocaml" ]
                                ; ( "4"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "entity.name.function.binding.ocaml" )
                                      ] )
                                ] )
                          ]
                      ; `Assoc
                          [ ( "comment"
                            , `String
                                "val declaration for let bindings or class instance \
                                 variables" )
                          ; ( "match"
                            , `String
                                "\\b(val|val!)[[:space:]]+(mutable[[:space:]]+)?(virtual[[:space:]]+)?([[:lower:]_][[:word:]']*)"
                            )
                          ; ( "captures"
                            , `Assoc
                                [ "1", `Assoc [ "name", `String "keyword.ocaml" ]
                                ; "2", `Assoc [ "name", `String "keyword.ocaml" ]
                                ; "3", `Assoc [ "name", `String "keyword.ocaml" ]
                                ; ( "4"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "entity.name.function.binding.ocaml" )
                                      ] )
                                ] )
                          ]
                      ; `Assoc
                          [ "comment", `String "class method declaration"
                          ; ( "match"
                            , `String
                                "\\b(method)[[:space:]]+(virtual)[[:space:]]+(private)[[:space:]]+([[:lower:]_][[:word:]']*)"
                            )
                          ; ( "captures"
                            , `Assoc
                                [ "1", `Assoc [ "name", `String "keyword.ocaml" ]
                                ; "2", `Assoc [ "name", `String "keyword.ocaml" ]
                                ; "3", `Assoc [ "name", `String "keyword.ocaml" ]
                                ; ( "4"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "entity.name.function.binding.ocaml" )
                                      ] )
                                ] )
                          ]
                      ; `Assoc
                          [ "comment", `String "class method declaration"
                          ; ( "match"
                            , `String
                                "\\b(method|method!)[[:space:]]+(private[[:space:]]+)?(virtual[[:space:]]+)?([[:lower:]_][[:word:]']*)"
                            )
                          ; ( "captures"
                            , `Assoc
                                [ "1", `Assoc [ "name", `String "keyword.ocaml" ]
                                ; "2", `Assoc [ "name", `String "keyword.ocaml" ]
                                ; "3", `Assoc [ "name", `String "keyword.ocaml" ]
                                ; ( "4"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "entity.name.function.binding.ocaml" )
                                      ] )
                                ] )
                          ]
                      ; `Assoc
                          [ ( "comment"
                            , `String
                                "class specification or class type definition with type \
                                 parameters" )
                          ; ( "match"
                            , `String
                                "\\b(class)[[:space:]]*([[:space:]]+type)?([[:space:]]+virtual)?[[:space:]]*(\\[.*\\])[[:space:]]*([[:lower:]_][[:word:]']*)"
                            )
                          ; ( "captures"
                            , `Assoc
                                [ "1", `Assoc [ "name", `String "keyword.ocaml" ]
                                ; "2", `Assoc [ "name", `String "keyword.ocaml" ]
                                ; "3", `Assoc [ "name", `String "keyword.ocaml" ]
                                ; ( "4"
                                  , `Assoc
                                      [ ( "patterns"
                                        , `List [ `Assoc [ "include", `String "$base" ] ]
                                        )
                                      ] )
                                ; ( "5"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "entity.name.function.binding.ocaml" )
                                      ] )
                                ] )
                          ]
                      ; `Assoc
                          [ ( "comment"
                            , `String "class specification or class type definition" )
                          ; ( "match"
                            , `String
                                "\\b(class)[[:space:]]+(type[[:space:]]+)?(virtual[[:space:]]+)?([[:lower:]_][[:word:]']*)"
                            )
                          ; ( "captures"
                            , `Assoc
                                [ "1", `Assoc [ "name", `String "keyword.ocaml" ]
                                ; "2", `Assoc [ "name", `String "keyword.ocaml" ]
                                ; "3", `Assoc [ "name", `String "keyword.ocaml" ]
                                ; ( "4"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "entity.name.function.binding.ocaml" )
                                      ] )
                                ] )
                          ]
                      ; `Assoc
                          [ "comment", `String "named self in object"
                          ; ( "match"
                            , `String
                                "\\b(object)[[:space:]]*\\([[:space:]]*([[:lower:]_][[:word:]']*)"
                            )
                          ; ( "captures"
                            , `Assoc
                                [ "1", `Assoc [ "name", `String "keyword.ocaml" ]
                                ; ( "2"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "entity.name.function.binding.ocaml" )
                                      ] )
                                ] )
                          ]
                      ; `Assoc
                          [ "comment", `String "module type of"
                          ; ( "begin"
                            , `String "\\b(module)[[:space:]]+(type)[[:space:]]+(of)\\b" )
                          ; ( "beginCaptures"
                            , `Assoc
                                [ "1", `Assoc [ "name", `String "keyword.ocaml" ]
                                ; "2", `Assoc [ "name", `String "keyword.ocaml" ]
                                ; "3", `Assoc [ "name", `String "keyword.ocaml" ]
                                ] )
                          ; ( "end"
                            , `String
                                "(?=val|external|type|exception|class|module|open|include|=)"
                            )
                          ; ( "patterns"
                            , `List [ `Assoc [ "include", `String "source.ocaml" ] ] )
                          ]
                      ] )
                ] )
          ; ( "keywords"
            , `Assoc
                [ ( "patterns"
                  , `List
                      [ `Assoc
                          [ "comment", `String "reserved ocaml keyword (in interfaces)"
                          ; "name", `String "keyword.other.ocaml.interface"
                          ; ( "match"
                            , `String
                                "\\b(and|as|class|constraint|end|exception|external|functor|in|include|inherit|let[[:space:]]+open|method|module|mutable|nonrec|object|of|open|private|rec|sig|type|val|virtual|with)\\b(?!')"
                            )
                          ]
                      ] )
                ] )
          ] )
    ]
;;

let ocaml =
  `Assoc
    [ "name", `String "OCaml"
    ; "scopeName", `String "source.ocaml"
    ; "fileTypes", `List [ `String "ml"; `String "eliom"; `String ".ocamlinit" ]
    ; ( "patterns"
      , `List
          [ `Assoc [ "include", `String "#directives" ]
          ; `Assoc [ "include", `String "#comments" ]
          ; `Assoc [ "include", `String "#strings" ]
          ; `Assoc [ "include", `String "#characters" ]
          ; `Assoc [ "include", `String "#attributes" ]
          ; `Assoc [ "include", `String "#extensions" ]
          ; `Assoc [ "include", `String "#modules" ]
          ; `Assoc [ "include", `String "#bindings" ]
          ; `Assoc [ "include", `String "#operators" ]
          ; `Assoc [ "include", `String "#keywords" ]
          ; `Assoc [ "include", `String "#literals" ]
          ; `Assoc [ "include", `String "#types" ]
          ; `Assoc [ "include", `String "#identifiers" ]
          ] )
    ; ( "repository"
      , `Assoc
          [ ( "directives"
            , `Assoc
                [ ( "patterns"
                  , `List
                      [ `Assoc
                          [ "comment", `String "line number directive"
                          ; "begin", `String "^[[:space:]]*(#)[[:space:]]*([[:digit:]]+)"
                          ; "end", `String "$"
                          ; ( "beginCaptures"
                            , `Assoc
                                [ "1", `Assoc [ "name", `String "keyword.other.ocaml" ]
                                ; ( "2"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "constant.numeric.decimal.integer.ocaml"
                                        )
                                      ] )
                                ] )
                          ; "contentName", `String "comment.line.directive.ocaml"
                          ]
                      ; `Assoc
                          [ "comment", `String "general, loading codes"
                          ; ( "begin"
                            , `String
                                "^[[:space:]]*(#)[[:space:]]*(help|quit|cd|directory|remove_directory|load_rec|load|use|mod_use)"
                            )
                          ; "end", `String "$"
                          ; ( "beginCaptures"
                            , `Assoc
                                [ "1", `Assoc [ "name", `String "keyword.other.ocaml" ]
                                ; "2", `Assoc [ "name", `String "keyword.other.ocaml" ]
                                ] )
                          ; "patterns", `List [ `Assoc [ "include", `String "#strings" ] ]
                          ]
                      ; `Assoc
                          [ "comment", `String "environment queries"
                          ; ( "begin"
                            , `String
                                "^[[:space:]]*(#)[[:space:]]*(show_class_type|show_class|show_exception|show_module_type|show_module|show_type|show_val|show)"
                            )
                          ; "end", `String "$"
                          ; ( "beginCaptures"
                            , `Assoc
                                [ "1", `Assoc [ "name", `String "keyword.other.ocaml" ]
                                ; "2", `Assoc [ "name", `String "keyword.other.ocaml" ]
                                ] )
                          ; ( "patterns"
                            , `List
                                [ `Assoc [ "include", `String "#types" ]
                                ; `Assoc [ "include", `String "#identifiers" ]
                                ] )
                          ]
                      ; `Assoc
                          [ "comment", `String "pretty-printing, tracing"
                          ; ( "begin"
                            , `String
                                "^[[:space:]]*(#)[[:space:]]*(install_printer|print_depth|print_length|remove_printer|trace|untrace_all|untrace)"
                            )
                          ; "end", `String "$"
                          ; ( "beginCaptures"
                            , `Assoc
                                [ "1", `Assoc [ "name", `String "keyword.other.ocaml" ]
                                ; "2", `Assoc [ "name", `String "keyword.other.ocaml" ]
                                ] )
                          ; ( "patterns"
                            , `List
                                [ `Assoc [ "include", `String "#literals" ]
                                ; `Assoc [ "include", `String "#identifiers" ]
                                ] )
                          ]
                      ; `Assoc
                          [ "comment", `String "compiler options"
                          ; ( "begin"
                            , `String
                                "^[[:space:]]*(#)[[:space:]]*(labels|ppx|principal|rectypes|warn_error|warnings)"
                            )
                          ; "end", `String "$"
                          ; ( "beginCaptures"
                            , `Assoc
                                [ "1", `Assoc [ "name", `String "keyword.other.ocaml" ]
                                ; "2", `Assoc [ "name", `String "keyword.other.ocaml" ]
                                ] )
                          ; ( "patterns"
                            , `List
                                [ `Assoc [ "include", `String "#strings" ]
                                ; `Assoc [ "include", `String "#literals" ]
                                ] )
                          ]
                      ; `Assoc
                          [ "comment", `String "topfind directives"
                          ; ( "begin"
                            , `String
                                "^[[:space:]]*(#)[[:space:]]*(require|list|camlp4o|camlp4r|predicates|thread)"
                            )
                          ; "end", `String "$"
                          ; ( "beginCaptures"
                            , `Assoc
                                [ "1", `Assoc [ "name", `String "keyword.other.ocaml" ]
                                ; "2", `Assoc [ "name", `String "keyword.other.ocaml" ]
                                ] )
                          ; "patterns", `List [ `Assoc [ "include", `String "#strings" ] ]
                          ]
                      ; `Assoc
                          [ "comment", `String "cppo directives"
                          ; ( "begin"
                            , `String
                                "^[[:space:]]*(#)[[:space:]]*(define|undef|ifdef|ifndef|if|else|elif|endif|include|warning|error|ext|endext)"
                            )
                          ; "end", `String "$"
                          ; ( "beginCaptures"
                            , `Assoc
                                [ "1", `Assoc [ "name", `String "keyword.other.ocaml" ]
                                ; "2", `Assoc [ "name", `String "keyword.other.ocaml" ]
                                ] )
                          ; ( "patterns"
                            , `List
                                [ `Assoc
                                    [ "name", `String "keyword.other.ocaml"
                                    ; "match", `String "\\b(defined)\\b"
                                    ]
                                ; `Assoc
                                    [ "name", `String "keyword.other.ocaml"
                                    ; "match", `String "\\\\"
                                    ]
                                ; `Assoc [ "include", `String "#comments" ]
                                ; `Assoc [ "include", `String "#strings" ]
                                ; `Assoc [ "include", `String "#characters" ]
                                ; `Assoc [ "include", `String "#keywords" ]
                                ; `Assoc [ "include", `String "#operators" ]
                                ; `Assoc [ "include", `String "#literals" ]
                                ; `Assoc [ "include", `String "#types" ]
                                ; `Assoc [ "include", `String "#identifiers" ]
                                ] )
                          ]
                      ] )
                ] )
          ; ( "comments"
            , `Assoc
                [ ( "patterns"
                  , `List
                      [ `Assoc
                          [ "comment", `String "empty comment"
                          ; "name", `String "comment.block.ocaml"
                          ; "match", `String "\\(\\*\\*\\)"
                          ]
                      ; `Assoc
                          [ "comment", `String "ocamldoc comment"
                          ; "name", `String "comment.doc.ocaml"
                          ; "begin", `String "\\(\\*\\*"
                          ; "end", `String "\\*\\)"
                          ; ( "patterns"
                            , `List
                                [ `Assoc
                                    [ "include", `String "source.ocaml.ocamldoc#markup" ]
                                ; `Assoc [ "include", `String "#strings-in-comments" ]
                                ; `Assoc [ "include", `String "#comments" ]
                                ] )
                          ]
                      ; `Assoc
                          [ "comment", `String "Cinaps comment"
                          ; "begin", `String "\\(\\*\\$"
                          ; "end", `String "\\*\\)"
                          ; ( "beginCaptures"
                            , `Assoc
                                [ "1", `Assoc [ "name", `String "comment.cinaps.ocaml" ] ]
                            )
                          ; ( "endCaptures"
                            , `Assoc
                                [ "1", `Assoc [ "name", `String "comment.cinaps.ocaml" ] ]
                            )
                          ; "patterns", `List [ `Assoc [ "include", `String "$self" ] ]
                          ]
                      ; `Assoc
                          [ "comment", `String "block comment"
                          ; "name", `String "comment.block.ocaml"
                          ; "begin", `String "\\(\\*"
                          ; "end", `String "\\*\\)"
                          ; ( "patterns"
                            , `List
                                [ `Assoc [ "include", `String "#strings-in-comments" ]
                                ; `Assoc [ "include", `String "#comments" ]
                                ] )
                          ]
                      ] )
                ] )
          ; ( "strings-in-comments"
            , `Assoc
                [ ( "patterns"
                  , `List
                      [ `Assoc
                          [ "comment", `String "char literal"
                          ; "match", `String "'(\\\\)?.'"
                          ]
                      ; `Assoc
                          [ "comment", `String "string literal"
                          ; "begin", `String "\""
                          ; "end", `String "\""
                          ; ( "patterns"
                            , `List
                                [ `Assoc [ "match", `String "\\\\\\\\" ]
                                ; `Assoc [ "match", `String "\\\\\"" ]
                                ] )
                          ]
                      ; `Assoc
                          [ "comment", `String "quoted string literal"
                          ; "begin", `String "\\{[[:lower:]_]*\\|"
                          ; "end", `String "\\|[[:lower:]_]*\\}"
                          ]
                      ] )
                ] )
          ; ( "strings"
            , `Assoc
                [ ( "patterns"
                  , `List
                      [ `Assoc
                          [ "comment", `String "quoted string literal"
                          ; "name", `String "string.quoted.braced.ocaml"
                          ; ( "begin"
                            , `String
                                "\\{(%%?[[:alpha:]_][[:word:]']*(\\.[[:alpha:]_][[:word:]']*)*[[:space:]]*)?[[:lower:]_]*\\|"
                            )
                          ; "end", `String "\\|[[:lower:]_]*\\}"
                          ; ( "beginCaptures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ "name", `String "keyword.other.extension.ocaml" ]
                                  )
                                ] )
                          ]
                      ; `Assoc
                          [ "comment", `String "string literal"
                          ; "name", `String "string.quoted.double.ocaml"
                          ; "begin", `String "\""
                          ; "end", `String "\""
                          ; ( "patterns"
                            , `List
                                [ `Assoc
                                    [ "comment", `String "escaped newline"
                                    ; "name", `String "constant.character.escape.ocaml"
                                    ; "match", `String "\\\\$"
                                    ]
                                ; `Assoc
                                    [ "comment", `String "escaped backslash"
                                    ; "name", `String "constant.character.escape.ocaml"
                                    ; "match", `String "\\\\\\\\"
                                    ]
                                ; `Assoc
                                    [ "comment", `String "escaped quote or whitespace"
                                    ; "name", `String "constant.character.escape.ocaml"
                                    ; "match", `String "\\\\[\"'ntbr ]"
                                    ]
                                ; `Assoc
                                    [ ( "comment"
                                      , `String "character from decimal ASCII code" )
                                    ; "name", `String "constant.character.escape.ocaml"
                                    ; "match", `String "\\\\[[:digit:]]{3}"
                                    ]
                                ; `Assoc
                                    [ ( "comment"
                                      , `String "character from hexadecimal ASCII code" )
                                    ; "name", `String "constant.character.escape.ocaml"
                                    ; "match", `String "\\\\x[[:xdigit:]]{2}"
                                    ]
                                ; `Assoc
                                    [ "comment", `String "character from octal ASCII code"
                                    ; "name", `String "constant.character.escape.ocaml"
                                    ; "match", `String "\\\\o[0-3][0-7]{2}"
                                    ]
                                ; `Assoc
                                    [ ( "comment"
                                      , `String "unicode character escape sequence" )
                                    ; "name", `String "constant.character.escape.ocaml"
                                    ; "match", `String "\\\\u\\{[[:xdigit:]]{1,6}\\}"
                                    ]
                                ; `Assoc
                                    [ "comment", `String "printf format string"
                                    ; "name", `String "constant.character.printf.ocaml"
                                    ; ( "match"
                                      , `String
                                          "%[-0+ \
                                           #]*([[:digit:]]+|\\*)?(.([[:digit:]]+|\\*))?[lLn]?[diunlLNxXosScCfFeEgGhHBbat!%@,\
                                           ]" )
                                    ]
                                ; `Assoc
                                    [ "comment", `String "unknown escape sequence"
                                    ; ( "name"
                                      , `String "invalid.illegal.unknown-escape.ocaml" )
                                    ; "match", `String "\\\\."
                                    ]
                                ] )
                          ]
                      ] )
                ] )
          ; ( "characters"
            , `Assoc
                [ ( "patterns"
                  , `List
                      [ `Assoc
                          [ "comment", `String "character literal from escaped backslash"
                          ; "name", `String "string.quoted.single.ocaml"
                          ; "match", `String "'(\\\\\\\\)'"
                          ; ( "captures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ "name", `String "constant.character.escape.ocaml"
                                      ] )
                                ] )
                          ]
                      ; `Assoc
                          [ ( "comment"
                            , `String "character literal from escaped quote or whitespace"
                            )
                          ; "name", `String "string.quoted.single.ocaml"
                          ; "match", `String "'(\\\\[\"'ntbr ])'"
                          ; ( "captures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ "name", `String "constant.character.escape.ocaml"
                                      ] )
                                ] )
                          ]
                      ; `Assoc
                          [ "comment", `String "character literal from decimal ASCII code"
                          ; "name", `String "string.quoted.single.ocaml"
                          ; "match", `String "'(\\\\[[:digit:]]{3})'"
                          ; ( "captures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ "name", `String "constant.character.escape.ocaml"
                                      ] )
                                ] )
                          ]
                      ; `Assoc
                          [ ( "comment"
                            , `String "character literal from hexadecimal ASCII code" )
                          ; "name", `String "string.quoted.single.ocaml"
                          ; "match", `String "'(\\\\x[[:xdigit:]]{2})'"
                          ; ( "captures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ "name", `String "constant.character.escape.ocaml"
                                      ] )
                                ] )
                          ]
                      ; `Assoc
                          [ "comment", `String "character literal from octal ASCII code"
                          ; "name", `String "string.quoted.single.ocaml"
                          ; "match", `String "'(\\\\o[0-3][0-7]{2})'"
                          ; ( "captures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ "name", `String "constant.character.escape.ocaml"
                                      ] )
                                ] )
                          ]
                      ; `Assoc
                          [ ( "comment"
                            , `String "character literal from unknown escape sequence" )
                          ; "name", `String "string.quoted.single.ocaml"
                          ; "match", `String "'(\\\\.)'"
                          ; ( "captures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "invalid.illegal.unknown-escape.ocaml" )
                                      ] )
                                ] )
                          ]
                      ; `Assoc
                          [ "comment", `String "character literal"
                          ; "name", `String "string.quoted.single.ocaml"
                          ; "match", `String "'.'"
                          ]
                      ] )
                ] )
          ; ( "attributes"
            , `Assoc
                [ ( "begin"
                  , `String "\\[(@|@@|@@@)[[:space:]]*([[:alpha:]_]+(\\.[[:word:]']+)*)" )
                ; "end", `String "\\]"
                ; ( "beginCaptures"
                  , `Assoc
                      [ "1", `Assoc [ "name", `String "keyword.operator.attribute.ocaml" ]
                      ; ( "2"
                        , `Assoc
                            [ "name", `String "keyword.other.attribute.ocaml"
                            ; ( "patterns"
                              , `List
                                  [ `Assoc
                                      [ ( "name"
                                        , `String
                                            "keyword.other.ocaml \
                                             punctuation.other.period \
                                             punctuation.separator.period" )
                                      ; "match", `String "\\."
                                      ]
                                  ] )
                            ] )
                      ] )
                ; "patterns", `List [ `Assoc [ "include", `String "$self" ] ]
                ] )
          ; ( "extensions"
            , `Assoc
                [ ( "begin"
                  , `String "\\[(%|%%)[[:space:]]*([[:alpha:]_]+(\\.[[:word:]']+)*)" )
                ; "end", `String "\\]"
                ; ( "beginCaptures"
                  , `Assoc
                      [ "1", `Assoc [ "name", `String "keyword.operator.extension.ocaml" ]
                      ; ( "2"
                        , `Assoc
                            [ "name", `String "keyword.other.extension.ocaml"
                            ; ( "patterns"
                              , `List
                                  [ `Assoc
                                      [ ( "name"
                                        , `String
                                            "keyword.other.ocaml \
                                             punctuation.other.period \
                                             punctuation.separator.period" )
                                      ; "match", `String "\\."
                                      ]
                                  ] )
                            ] )
                      ] )
                ; "patterns", `List [ `Assoc [ "include", `String "$self" ] ]
                ] )
          ; ( "modules"
            , `Assoc
                [ ( "patterns"
                  , `List
                      [ `Assoc
                          [ "begin", `String "\\b(sig)\\b"
                          ; "end", `String "\\b(end)\\b"
                          ; ( "beginCaptures"
                            , `Assoc
                                [ "1", `Assoc [ "name", `String "keyword.other.ocaml" ] ]
                            )
                          ; ( "endCaptures"
                            , `Assoc
                                [ "1", `Assoc [ "name", `String "keyword.other.ocaml" ] ]
                            )
                          ; ( "patterns"
                            , `List
                                [ `Assoc [ "include", `String "source.ocaml.interface" ] ]
                            )
                          ]
                      ; `Assoc
                          [ "begin", `String "\\b(struct)\\b"
                          ; "end", `String "\\b(end)\\b"
                          ; ( "beginCaptures"
                            , `Assoc
                                [ "1", `Assoc [ "name", `String "keyword.other.ocaml" ] ]
                            )
                          ; ( "endCaptures"
                            , `Assoc
                                [ "1", `Assoc [ "name", `String "keyword.other.ocaml" ] ]
                            )
                          ; "patterns", `List [ `Assoc [ "include", `String "$self" ] ]
                          ]
                      ] )
                ] )
          ; ( "bindings"
            , `Assoc
                [ ( "patterns"
                  , `List
                      [ `Assoc
                          [ "comment", `String "for loop"
                          ; ( "match"
                            , `String "\\b(for)[[:space:]]+([[:lower:]_][[:word:]']*)" )
                          ; ( "captures"
                            , `Assoc
                                [ "1", `Assoc [ "name", `String "keyword.ocaml" ]
                                ; ( "2"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "entity.name.function.binding.ocaml" )
                                      ] )
                                ] )
                          ]
                      ; `Assoc
                          [ "comment", `String "local open/exception/module"
                          ; ( "match"
                            , `String
                                "\\b(let)[[:space:]]+(open|exception|module)\\b(?!')" )
                          ; ( "captures"
                            , `Assoc
                                [ "1", `Assoc [ "name", `String "keyword.ocaml" ]
                                ; "2", `Assoc [ "name", `String "keyword.ocaml" ]
                                ] )
                          ]
                      ; `Assoc
                          [ "comment", `String "let expression"
                          ; ( "match"
                            , `String
                                "\\b(let)[[:space:]]+(?!lazy\\b(?!'))(rec[[:space:]]+)?(?!rec\\b(?!'))([[:lower:]_][[:word:]']*)(?![[:word:]'])[[:space:]]*(?!,|::|[[:space:]])"
                            )
                          ; ( "captures"
                            , `Assoc
                                [ "1", `Assoc [ "name", `String "keyword.ocaml" ]
                                ; "2", `Assoc [ "name", `String "keyword.ocaml" ]
                                ; ( "3"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "entity.name.function.binding.ocaml" )
                                      ] )
                                ] )
                          ]
                      ; `Assoc
                          [ "comment", `String "using binding operators"
                          ; ( "match"
                            , `String
                                "\\b(let|and)([$&*+\\-/=>@^|<][!?$&*+\\-/=>@^|%:]*)[[:space:]]*(?!lazy\\b(?!'))([[:lower:]_][[:word:]']*)(?![[:word:]'])[[:space:]]*(?!,|::|[[:space:]])"
                            )
                          ; ( "captures"
                            , `Assoc
                                [ "1", `Assoc [ "name", `String "keyword.ocaml" ]
                                ; "2", `Assoc [ "name", `String "keyword.ocaml" ]
                                ; ( "3"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "entity.name.function.binding.ocaml" )
                                      ] )
                                ] )
                          ]
                      ; `Assoc
                          [ "comment", `String "first class module packing"
                          ; ( "match"
                            , `String
                                "\\([[:space:]]*(val)[[:space:]]+([[:lower:]_][[:word:]']*)"
                            )
                          ; ( "captures"
                            , `Assoc
                                [ "1", `Assoc [ "name", `String "keyword.ocaml" ]
                                ; ( "2"
                                  , `Assoc
                                      [ ( "patterns"
                                        , `List [ `Assoc [ "include", `String "$self" ] ]
                                        )
                                      ] )
                                ] )
                          ]
                      ; `Assoc
                          [ "comment", `String "locally abstract types"
                          ; ( "match"
                            , `String
                                "(?:\\(|(:))[[:space:]]*(type)((?:[[:space:]]+[[:lower:]_][[:word:]']*)+)"
                            )
                          ; ( "captures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ ( "name"
                                        , `String
                                            "keyword.other.ocaml punctuation.other.colon \
                                             punctuation.colon" )
                                      ] )
                                ; "2", `Assoc [ "name", `String "keyword.ocaml" ]
                                ; ( "3"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "entity.name.function.binding.ocaml" )
                                      ] )
                                ] )
                          ]
                      ; `Assoc
                          [ "comment", `String "optional labeled argument with type"
                          ; ( "begin"
                            , `String "(\\?)\\([[:space:]]*([[:lower:]_][[:word:]']*)" )
                          ; ( "beginCaptures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "variable.parameter.optional.ocaml" )
                                      ] )
                                ; ( "2"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "variable.parameter.optional.ocaml" )
                                      ] )
                                ] )
                          ; "end", `String "\\)"
                          ; "patterns", `List [ `Assoc [ "include", `String "$self" ] ]
                          ]
                      ; `Assoc
                          [ "comment", `String "labeled argument with type"
                          ; ( "begin"
                            , `String "(~)\\([[:space:]]*([[:lower:]_][[:word:]']*)" )
                          ; ( "beginCaptures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ "name", `String "variable.parameter.labeled.ocaml"
                                      ] )
                                ; ( "2"
                                  , `Assoc
                                      [ "name", `String "variable.parameter.labeled.ocaml"
                                      ] )
                                ] )
                          ; "end", `String "\\)"
                          ; "patterns", `List [ `Assoc [ "include", `String "$self" ] ]
                          ]
                      ; `Assoc [ "include", `String "source.ocaml.interface#bindings" ]
                      ] )
                ] )
          ; ( "operators"
            , `Assoc
                [ ( "patterns"
                  , `List
                      [ `Assoc
                          [ "comment", `String "binding operator"
                          ; "name", `String "keyword.ocaml"
                          ; ( "match"
                            , `String "\\b(let|and)[$&*+\\-/=>@^|<][!?$&*+\\-/=>@^|%:]*" )
                          ]
                      ; `Assoc
                          [ "comment", `String "infix symbol"
                          ; "name", `String "keyword.operator.ocaml"
                          ; "match", `String "[$&*+\\-/=>@^%<][~!?$&*+\\-/=>@^|%<:.]*"
                          ]
                      ; `Assoc
                          [ ( "comment"
                            , `String "infix symbol that begins with vertical bar" )
                          ; "name", `String "keyword.operator.ocaml"
                          ; "match", `String "\\|[~!?$&*+\\-/=>@^|%<:.]+"
                          ]
                      ; `Assoc
                          [ "comment", `String "vertical bar"
                          ; "name", `String "keyword.other.ocaml"
                          ; "match", `String "(?<!\\[)(\\|)(?!\\])"
                          ]
                      ; `Assoc
                          [ "comment", `String "infix symbol"
                          ; "name", `String "keyword.operator.ocaml"
                          ; "match", `String "#[~!?$&*+\\-/=>@^|%<:.]+"
                          ]
                      ; `Assoc
                          [ "comment", `String "prefix symbol"
                          ; "name", `String "keyword.operator.ocaml"
                          ; "match", `String "![~!?$&*+\\-/=>@^|%<:.]*"
                          ]
                      ; `Assoc
                          [ "comment", `String "prefix symbol"
                          ; "name", `String "keyword.operator.ocaml"
                          ; "match", `String "[?~][~!?$&*+\\-/=>@^|%<:.]+"
                          ]
                      ; `Assoc
                          [ "comment", `String "named operator"
                          ; "name", `String "keyword.operator.ocaml"
                          ; "match", `String "\\b(or|mod|land|lor|lxor|lsl|lsr|asr)\\b"
                          ]
                      ; `Assoc
                          [ "comment", `String "method invocation"
                          ; "name", `String "keyword.other.ocaml"
                          ; "match", `String "#"
                          ]
                      ; `Assoc
                          [ "comment", `String "type annotation"
                          ; ( "name"
                            , `String
                                "keyword.other.ocaml punctuation.other.colon \
                                 punctuation.colon" )
                          ; "match", `String ":"
                          ]
                      ; `Assoc
                          [ "comment", `String "field accessor"
                          ; ( "name"
                            , `String
                                "keyword.other.ocaml punctuation.other.period \
                                 punctuation.separator.period" )
                          ; "match", `String "\\."
                          ]
                      ; `Assoc
                          [ "comment", `String "semicolon separator"
                          ; ( "name"
                            , `String
                                "keyword.other.ocaml punctuation.separator.terminator \
                                 punctuation.separator.semicolon" )
                          ; "match", `String ";"
                          ]
                      ; `Assoc
                          [ "comment", `String "comma separator"
                          ; ( "name"
                            , `String
                                "keyword.other.ocaml punctuation.comma \
                                 punctuation.separator.comma" )
                          ; "match", `String ","
                          ]
                      ] )
                ] )
          ; ( "keywords"
            , `Assoc
                [ ( "patterns"
                  , `List
                      [ `Assoc
                          [ "comment", `String "reserved ocaml keyword"
                          ; "name", `String "keyword.other.ocaml"
                          ; ( "match"
                            , `String
                                "\\b(and|as|assert|begin|class|constraint|do|done|downto|else|end|exception|external|for|fun|function|functor|if|in|include|inherit|initializer|lazy|let|match|method|module|mutable|new|nonrec|object|of|open|private|rec|sig|struct|then|to|try|type|val|virtual|when|while|with)\\b(?!')"
                            )
                          ]
                      ] )
                ] )
          ; ( "literals"
            , `Assoc
                [ ( "patterns"
                  , `List
                      [ `Assoc
                          [ "comment", `String "boolean literal"
                          ; "name", `String "constant.language.boolean.ocaml"
                          ; "match", `String "\\b(true|false)\\b"
                          ]
                      ; `Assoc
                          [ ( "comment"
                            , `String "floating point decimal literal with exponent" )
                          ; "name", `String "constant.numeric.decimal.float.ocaml"
                          ; ( "match"
                            , `String
                                "\\b([[:digit:]][[:digit:]_]*(\\.[[:digit:]_]*)?[eE][+-]?[[:digit:]][[:digit:]_]*[g-zG-Z]?)\\b"
                            )
                          ]
                      ; `Assoc
                          [ "comment", `String "floating point decimal literal"
                          ; "name", `String "constant.numeric.decimal.float.ocaml"
                          ; ( "match"
                            , `String
                                "\\b([[:digit:]][[:digit:]_]*)(\\.[[:digit:]_]*[g-zG-Z]?\\b|\\.)"
                            )
                          ]
                      ; `Assoc
                          [ ( "comment"
                            , `String
                                "floating point hexadecimal literal with exponent part" )
                          ; "name", `String "constant.numeric.hexadecimal.float.ocaml"
                          ; ( "match"
                            , `String
                                "\\b((0x|0X)[[:xdigit:]][[:xdigit:]_]*(\\.[[:xdigit:]_]*)?[pP][+-]?[[:digit:]][[:digit:]_]*[g-zG-Z]?)\\b"
                            )
                          ]
                      ; `Assoc
                          [ "comment", `String "floating point hexadecimal literal"
                          ; "name", `String "constant.numeric.hexadecimal.float.ocaml"
                          ; ( "match"
                            , `String
                                "\\b((0x|0X)[[:xdigit:]][[:xdigit:]_]*)(\\.[[:xdigit:]_]*[g-zG-Z]?\\b|\\.)"
                            )
                          ]
                      ; `Assoc
                          [ "comment", `String "decimal integer literal"
                          ; "name", `String "constant.numeric.decimal.integer.ocaml"
                          ; ( "match"
                            , `String "\\b([[:digit:]][[:digit:]_]*[lLng-zG-Z]?)\\b" )
                          ]
                      ; `Assoc
                          [ "comment", `String "hexadecimal integer literal"
                          ; "name", `String "constant.numeric.hexadecimal.integer.ocaml"
                          ; ( "match"
                            , `String
                                "\\b((0x|0X)[[:xdigit:]][[:xdigit:]_]*[lLng-zG-Z]?)\\b" )
                          ]
                      ; `Assoc
                          [ "comment", `String "octal integer literal"
                          ; "name", `String "constant.numeric.octal.integer.ocaml"
                          ; "match", `String "\\b((0o|0O)[0-7][0-7_]*[lLng-zG-Z]?)\\b"
                          ]
                      ; `Assoc
                          [ "comment", `String "binary integer literal"
                          ; "name", `String "constant.numeric.binary.integer.ocaml"
                          ; "match", `String "\\b((0b|0B)[0-1][0-1_]*[lLng-zG-Z]?)\\b"
                          ]
                      ; `Assoc
                          [ "comment", `String "unit literal"
                          ; "name", `String "constant.language.unit.ocaml"
                          ; "match", `String "\\(\\)"
                          ]
                      ; `Assoc
                          [ "comment", `String "parentheses"
                          ; "begin", `String "\\("
                          ; "end", `String "\\)"
                          ; "patterns", `List [ `Assoc [ "include", `String "$self" ] ]
                          ]
                      ; `Assoc
                          [ "comment", `String "empty array"
                          ; "name", `String "constant.language.array.ocaml"
                          ; "match", `String "\\[\\|\\|\\]"
                          ]
                      ; `Assoc
                          [ "comment", `String "array"
                          ; "begin", `String "\\[\\|"
                          ; "end", `String "\\|\\]"
                          ; "patterns", `List [ `Assoc [ "include", `String "$self" ] ]
                          ]
                      ; `Assoc
                          [ "comment", `String "empty list"
                          ; "name", `String "constant.language.list.ocaml"
                          ; "match", `String "\\[\\]"
                          ]
                      ; `Assoc
                          [ "comment", `String "list"
                          ; "begin", `String "\\["
                          ; "end", `String "]"
                          ; "patterns", `List [ `Assoc [ "include", `String "$self" ] ]
                          ]
                      ; `Assoc
                          [ "comment", `String "braces"
                          ; "begin", `String "\\{"
                          ; "end", `String "\\}"
                          ; "patterns", `List [ `Assoc [ "include", `String "$self" ] ]
                          ]
                      ] )
                ] )
          ; ( "types"
            , `Assoc
                [ ( "patterns"
                  , `List
                      [ `Assoc
                          [ "comment", `String "type parameter"
                          ; "name", `String "storage.type.ocaml"
                          ; "match", `String "'[[:alpha:]][[:word:]']*\\b|'_\\b"
                          ]
                      ; `Assoc
                          [ "comment", `String "weak type parameter"
                          ; "name", `String "storage.type.weak.ocaml"
                          ; "match", `String "'_[[:alpha:]][[:word:]']*\\b"
                          ]
                      ; `Assoc
                          [ "comment", `String "builtin type"
                          ; "name", `String "support.type.ocaml"
                          ; ( "match"
                            , `String
                                "\\b(unit|bool|int|int32|int64|nativeint|float|char|bytes|string)\\b"
                            )
                          ]
                      ] )
                ] )
          ; ( "identifiers"
            , `Assoc
                [ ( "patterns"
                  , `List
                      [ `Assoc
                          [ "comment", `String "wildcard underscore"
                          ; "name", `String "constant.language.ocaml"
                          ; "match", `String "\\b_\\b"
                          ]
                      ; `Assoc
                          [ ( "comment"
                            , `String
                                "capital identifier for constructor, exception, or module"
                            )
                          ; "name", `String "constant.language.capital-identifier.ocaml"
                          ; "match", `String "\\b[[:upper:]][[:word:]']*('|\\b)"
                          ]
                      ; `Assoc
                          [ "comment", `String "lowercase identifier"
                          ; "name", `String "source.ocaml"
                          ; "match", `String "\\b[[:lower:]_][[:word:]']*('|\\b)"
                          ]
                      ; `Assoc
                          [ "comment", `String "polymorphic variant tag"
                          ; "name", `String "constant.language.polymorphic-variant.ocaml"
                          ; "match", `String "\\`[[:alpha:]][[:word:]']*\\b"
                          ]
                      ; `Assoc
                          [ "comment", `String "empty list (can be used as a constructor)"
                          ; "name", `String "constant.language.list.ocaml"
                          ; "match", `String "\\[\\]"
                          ]
                      ] )
                ] )
          ] )
    ]
;;

let dune =
  `Assoc
    [ "name", `String "dune"
    ; "scopeName", `String "source.dune"
    ; "fileTypes", `List [ `String "dune"; `String "jbuild" ]
    ; ( "patterns"
      , `List
          [ `Assoc [ "include", `String "#comments" ]
          ; `Assoc
              [ "name", `String "meta.stanza.dune"
              ; ( "begin"
                , `String
                    "\\([[:space:]]*(library|rule|executable|executables|rule|ocamllex|ocamlyacc|menhir|install|alias|copy_files|copy_files#|jbuild_version|include)[[:space:]]"
                )
              ; "end", `String "\\)"
              ; ( "beginCaptures"
                , `Assoc [ "1", `Assoc [ "name", `String "meta.class.stanza.dune" ] ] )
              ; "patterns", `List [ `Assoc [ "include", `String "$self" ] ]
              ]
          ; `Assoc
              [ "name", `String "meta.stanza.library.field.dune"
              ; ( "begin"
                , `String
                    "\\([[:space:]]*(name|public_name|synopsis|install_c_headers|ppx_runtime_libraries|c_flags|cxx_flags|c_names|cxx_names|library_flags|c_library_flags|virtual_deps|modes|kind|wrapped|optional|self_build_stubs_archive|no_dynlink|ppx\\.driver)[[:space:]]"
                )
              ; "end", `String "\\)"
              ; ( "beginCaptures"
                , `Assoc [ "1", `Assoc [ "name", `String "keyword.other.dune" ] ] )
              ; "patterns", `List [ `Assoc [ "include", `String "$self" ] ]
              ]
          ; `Assoc
              [ "name", `String "meta.stanza.rule.dune"
              ; ( "begin"
                , `String "\\([[:space:]]*(targets|deps|locks|loc|mode|action)[[:space:]]"
                )
              ; ( "beginCaptures"
                , `Assoc [ "1", `Assoc [ "name", `String "keyword.other.dune" ] ] )
              ; "end", `String "\\)"
              ; "patterns", `List [ `Assoc [ "include", `String "$self" ] ]
              ]
          ; `Assoc
              [ "name", `String "meta.mono-sexp.dune"
              ; "match", `String "\\([[:space:]]*(fallback|optional)[[:space:]]*\\)"
              ; ( "captures"
                , `Assoc [ "1", `Assoc [ "name", `String "keyword.other.dune" ] ] )
              ]
          ; `Assoc
              [ "name", `String "meta.stanza.rule.action.dune"
              ; ( "begin"
                , `String
                    "\\([[:space:]]*(run|chdir|setenv|with-stdout-to|with-stderr-to|with-outputs-to|ignore-stdout|ignore-stderr|ignore-outputs|progn|echo|cat|copy|copy#|system|bash|write-file|diff|diff\\?)[[:space:]]"
                )
              ; "end", `String "\\)"
              ; ( "beginCaptures"
                , `Assoc
                    [ "1", `Assoc [ "name", `String "entity.name.function.action.dune" ] ]
                )
              ; "patterns", `List [ `Assoc [ "include", `String "$self" ] ]
              ]
          ; `Assoc
              [ "name", `String "meta.stanza.install.dune"
              ; "begin", `String "\\([[:space:]]*(section)[[:space:]]"
              ; "end", `String "\\)"
              ; ( "beginCaptures"
                , `Assoc [ "1", `Assoc [ "name", `String "keyword.other.dune" ] ] )
              ; ( "patterns"
                , `List
                    [ `Assoc
                        [ "name", `String "constant.language.rule.mode.dune"
                        ; ( "match"
                          , `String
                              "\\b(lib|libexec|bin|sbin|toplevel|share|share_root|etc|doc|stublibs|man|misc)\\b"
                          )
                        ]
                    ] )
              ]
          ; `Assoc
              [ "name", `String "meta.stanza.install.dune"
              ; "begin", `String "\\([[:space:]]*(files)[[:space:]]"
              ; "end", `String "\\)"
              ; ( "beginCaptures"
                , `Assoc [ "1", `Assoc [ "name", `String "keyword.other.dune" ] ] )
              ; "patterns", `List [ `Assoc [ "include", `String "$self" ] ]
              ]
          ; `Assoc
              [ "name", `String "meta.library.kind.dune"
              ; ( "begin"
                , `String "\\([[:space:]]*(normal|ppx_deriver|ppx_rewriter)[[:space:]]" )
              ; "end", `String "\\)"
              ; ( "beginCaptures"
                , `Assoc
                    [ "1", `Assoc [ "name", `String "constant.language.rule.mode.dune" ] ]
                )
              ]
          ; `Assoc
              [ "name", `String "meta.stanza.executables.dune"
              ; ( "begin"
                , `String
                    "\\([[:space:]]*(name|link_executables|link_flags|modes)[[:space:]]" )
              ; "end", `String "\\)"
              ; ( "beginCaptures"
                , `Assoc [ "1", `Assoc [ "name", `String "keyword.other.dune" ] ] )
              ; "patterns", `List [ `Assoc [ "include", `String "$self" ] ]
              ]
          ; `Assoc
              [ "name", `String "meta.stanza.lib-or-exec.buildable.dune"
              ; ( "begin"
                , `String
                    "\\([[:space:]]*(preprocess|preprocessor_deps|lint|modules|modules_without_implementation|libraries|flags|ocamlc_flags|ocamlopt_flags|js_of_ocaml|allow_overlapping_dependencies|per_module)[[:space:]]"
                )
              ; "end", `String "\\)"
              ; ( "beginCaptures"
                , `Assoc [ "1", `Assoc [ "name", `String "keyword.other.dune" ] ] )
              ; "patterns", `List [ `Assoc [ "include", `String "$self" ] ]
              ]
          ; `Assoc
              [ "name", `String "meta.stanza.lib-or-exec.buildable.preprocess.dune"
              ; "begin", `String "\\([[:space:]]*(no_preprocessing|action|pps)[[:space:]]"
              ; "end", `String "\\)"
              ; ( "beginCaptures"
                , `Assoc [ "1", `Assoc [ "name", `String "keyword.other.dune" ] ] )
              ; "patterns", `List [ `Assoc [ "include", `String "$self" ] ]
              ]
          ; `Assoc
              [ "name", `String "meta.stanza.lib-or-exec.buildable.preprocess_deps.dune"
              ; ( "begin"
                , `String
                    "\\([[:space:]]*(file|alias|alias_rec|glob_files|files_recursively_in)[[:space:]]"
                )
              ; "end", `String "\\)"
              ; ( "beginCaptures"
                , `Assoc [ "1", `Assoc [ "name", `String "keyword.other.dune" ] ] )
              ; "patterns", `List [ `Assoc [ "include", `String "$self" ] ]
              ]
          ; `Assoc
              [ "name", `String "meta.stanza.lib-or-exec.buildable.libraries.dune"
              ; "begin", `String "\\([[:space:]]*(select)[[:space:]]"
              ; "end", `String "\\)"
              ; ( "beginCaptures"
                , `Assoc [ "1", `Assoc [ "name", `String "keyword.other.dune" ] ] )
              ; "patterns", `List [ `Assoc [ "include", `String "$self" ] ]
              ]
          ; `Assoc
              [ "name", `String "constant.numeric.dune"; "match", `String "\\b\\d+\\b" ]
          ; `Assoc
              [ "name", `String "constant.language.dune"
              ; "match", `String "(true|false)"
              ]
          ; `Assoc
              [ "name", `String "keyword.other.dune"
              ; "match", `String "[[:space:]](as|from|->)[[:space:]]"
              ]
          ; `Assoc [ "name", `String "keyword.other.dune"; "match", `String "(\\!)" ]
          ; `Assoc
              [ "name", `String "constant.language.flag.dune"
              ; "match", `String "(:\\w+)\\b"
              ]
          ; `Assoc
              [ "name", `String "constant.language.rule.mode.dune"
              ; "match", `String "\\b(standard|fallback|promote|promote-until-then)\\b"
              ]
          ; `Assoc [ "include", `String "#string" ]
          ; `Assoc [ "include", `String "#variable" ]
          ; `Assoc [ "include", `String "#list" ]
          ; `Assoc [ "include", `String "#atom" ]
          ] )
    ; ( "repository"
      , `Assoc
          [ ( "comments"
            , `Assoc
                [ ( "patterns"
                  , `List
                      [ `Assoc
                          [ "name", `String "comment.block.dune"
                          ; "begin", `String "#\\|"
                          ; ( "beginCaptures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "name"
                                        , `String
                                            "punctuation.definition.comment.begin.dune" )
                                      ] )
                                ] )
                          ; "end", `String "\\|#"
                          ; ( "endCaptures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "name"
                                        , `String
                                            "punctuation.definition.comment.end.dune" )
                                      ] )
                                ] )
                          ; ( "patterns"
                            , `List [ `Assoc [ "include", `String "#comments" ] ] )
                          ]
                      ; `Assoc
                          [ "name", `String "comment.sexp.dune"
                          ; "begin", `String "#;[[:space:]]*\\("
                          ; "end", `String "\\)"
                          ; ( "patterns"
                            , `List [ `Assoc [ "include", `String "#comment-inner" ] ] )
                          ]
                      ; `Assoc
                          [ "name", `String "comment.line.dune"; "match", `String ";.*$" ]
                      ] )
                ] )
          ; ( "comment-inner"
            , `Assoc
                [ ( "patterns"
                  , `List
                      [ `Assoc
                          [ "name", `String "comment.sexp.inner.dune"
                          ; "begin", `String "\\("
                          ; "end", `String "\\)"
                          ; ( "patterns"
                            , `List [ `Assoc [ "include", `String "#comment-inner" ] ] )
                          ]
                      ] )
                ] )
          ; ( "string"
            , `Assoc
                [ ( "patterns"
                  , `List
                      [ `Assoc
                          [ "name", `String "string.quoted.double.dune"
                          ; "begin", `String "(?=[^\\\\])(\")"
                          ; ( "beginCaptures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ ( "name"
                                        , `String
                                            "punctuation.definition.string.begin.dune" )
                                      ] )
                                ] )
                          ; "end", `String "(\")"
                          ; ( "endCaptures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.definition.string.end.dune"
                                        )
                                      ] )
                                ] )
                          ; ( "patterns"
                            , `List
                                [ `Assoc
                                    [ ( "name"
                                      , `String "constant.character.string.escape.dune" )
                                    ; "match", `String "\\\\\""
                                    ]
                                ; `Assoc [ "include", `String "#variable" ]
                                ] )
                          ]
                      ] )
                ] )
          ; ( "variable"
            , `Assoc
                [ ( "patterns"
                  , `List
                      [ `Assoc
                          [ "name", `String "variable.other.dune"
                          ; "match", `String "\\${[^}]*}"
                          ]
                      ] )
                ] )
          ; ( "list"
            , `Assoc
                [ ( "patterns"
                  , `List
                      [ `Assoc
                          [ "name", `String "meta.list.dune"
                          ; "begin", `String "(\\()"
                          ; "end", `String "(\\))"
                          ; ( "captures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ "name", `String "entity.tag.list.parenthesis.dune"
                                      ] )
                                ] )
                          ; ( "comment"
                            , `String "ok, for this one, I didn't know what to choose" )
                          ; "patterns", `List [ `Assoc [ "include", `String "$self" ] ]
                          ]
                      ] )
                ] )
          ; ( "atom"
            , `Assoc
                [ ( "patterns"
                  , `List
                      [ `Assoc
                          [ "name", `String "meta.atom.dune"
                          ; "match", `String "\\b[^[[:space:]]]+\\b"
                          ]
                      ] )
                ] )
          ] )
    ]
;;

let shell =
  `Assoc
    [ ( "fileTypes"
      , `List
          [ `String "sh"
          ; `String "bash"
          ; `String "zsh"
          ; `String "bashrc"
          ; `String "bash_profile"
          ; `String "bash_login"
          ; `String "profile"
          ; `String "bash_logout"
          ; `String ".textmate_init"
          ] )
    ; ( "firstLineMatch"
      , `String "^#!.*\\b(bash|zsh|sh|tcsh)|^#.*-\\*-.*\\bshell-script\\b.*-\\*-" )
    ; ( "repository"
      , `Assoc
          [ ( "keyword"
            , `Assoc
                [ ( "patterns"
                  , `List
                      [ `Assoc
                          [ ( "match"
                            , `String
                                "(?<=^|;|&|\\s)(?:if|then|else|elif|fi|for|in|do|done|select|case|continue|esac|while|until|return|coproc)(?=\\s|;|&|$)"
                            )
                          ; "name", `String "keyword.control.shell"
                          ]
                      ; `Assoc
                          [ ( "match"
                            , `String
                                "(?<=^|;|&|\\s)(?:export|declare|typeset|local|readonly)(?=\\s|;|&|$)"
                            )
                          ; "name", `String "storage.modifier.shell"
                          ]
                      ] )
                ] )
          ; ( "function-definition"
            , `Assoc
                [ ( "patterns"
                  , `List
                      [ `Assoc
                          [ ( "begin"
                            , `String
                                "(?<=^|;|&)\\s*(function)\\s+([^\\s<>;'\"\\\\|$&()]+)(?:\\s*(\\(\\)))?"
                            )
                          ; ( "endCaptures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.definition.function.shell"
                                        )
                                      ] )
                                ] )
                          ; "end", `String ";|&|\\n"
                          ; "patterns", `List [ `Assoc [ "include", `String "$self" ] ]
                          ; "name", `String "meta.function.shell"
                          ; ( "beginCaptures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ "name", `String "storage.type.function.shell" ] )
                                ; ( "2"
                                  , `Assoc
                                      [ "name", `String "entity.name.function.shell" ] )
                                ; ( "3"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.definition.arguments.shell"
                                        )
                                      ] )
                                ] )
                          ]
                      ; `Assoc
                          [ ( "begin"
                            , `String "(?<=^|;|&)\\s*([^\\s<>;'\"\\\\|$&()]+)\\s*(\\(\\))"
                            )
                          ; ( "endCaptures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.definition.function.shell"
                                        )
                                      ] )
                                ] )
                          ; "end", `String ";|&|\\n"
                          ; "patterns", `List [ `Assoc [ "include", `String "$self" ] ]
                          ; "name", `String "meta.function.shell"
                          ; ( "beginCaptures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ "name", `String "entity.name.function.shell" ] )
                                ; ( "2"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.definition.arguments.shell"
                                        )
                                      ] )
                                ] )
                          ]
                      ] )
                ] )
          ; ( "herestring"
            , `Assoc
                [ ( "patterns"
                  , `List
                      [ `Assoc
                          [ "match", `String "(<<<)\\s*((')[^']*('))"
                          ; "name", `String "meta.herestring.shell"
                          ; ( "captures"
                            , `Assoc
                                [ ( "3"
                                  , `Assoc
                                      [ ( "name"
                                        , `String
                                            "punctuation.definition.string.begin.shell" )
                                      ] )
                                ; ( "1"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "keyword.operator.herestring.shell" )
                                      ] )
                                ; ( "4"
                                  , `Assoc
                                      [ ( "name"
                                        , `String
                                            "punctuation.definition.string.end.shell" )
                                      ] )
                                ; ( "2"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "string.quoted.single.herestring.shell"
                                        )
                                      ] )
                                ] )
                          ]
                      ; `Assoc
                          [ "match", `String "(<<<)\\s*((\")(\\\\(\"|\\\\)|[^\"])*(\"))"
                          ; "name", `String "meta.herestring.shell"
                          ; ( "captures"
                            , `Assoc
                                [ ( "3"
                                  , `Assoc
                                      [ ( "name"
                                        , `String
                                            "punctuation.definition.string.begin.shell" )
                                      ] )
                                ; ( "1"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "keyword.operator.herestring.shell" )
                                      ] )
                                ; ( "6"
                                  , `Assoc
                                      [ ( "name"
                                        , `String
                                            "punctuation.definition.string.end.shell" )
                                      ] )
                                ; ( "2"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "string.quoted.double.herestring.shell"
                                        )
                                      ] )
                                ] )
                          ]
                      ; `Assoc
                          [ "match", `String "(<<<)\\s*(([^\\s\\\\]|\\\\.)+)"
                          ; "name", `String "meta.herestring.shell"
                          ; ( "captures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "keyword.operator.herestring.shell" )
                                      ] )
                                ; ( "2"
                                  , `Assoc
                                      [ "name", `String "string.unquoted.herestring.shell"
                                      ] )
                                ] )
                          ]
                      ] )
                ] )
          ; ( "pathname"
            , `Assoc
                [ ( "patterns"
                  , `List
                      [ `Assoc
                          [ "match", `String "(?<=\\s|:|=|^)~"
                          ; "name", `String "keyword.operator.tilde.shell"
                          ]
                      ; `Assoc
                          [ "match", `String "\\*|\\?"
                          ; "name", `String "keyword.operator.glob.shell"
                          ]
                      ; `Assoc
                          [ "begin", `String "([?*+@!])(\\()"
                          ; ( "endCaptures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.definition.extglob.shell" )
                                      ] )
                                ] )
                          ; "end", `String "(\\))"
                          ; "patterns", `List [ `Assoc [ "include", `String "$self" ] ]
                          ; "name", `String "meta.structure.extglob.shell"
                          ; ( "beginCaptures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ "name", `String "keyword.operator.extglob.shell" ]
                                  )
                                ; ( "2"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.definition.extglob.shell" )
                                      ] )
                                ] )
                          ]
                      ] )
                ] )
          ; ( "pipeline"
            , `Assoc
                [ ( "patterns"
                  , `List
                      [ `Assoc
                          [ "match", `String "(?<=^|;|&|\\s)(time)(?=\\s|;|&|$)"
                          ; "name", `String "keyword.other.shell"
                          ]
                      ; `Assoc
                          [ "match", `String "[|!]"
                          ; "name", `String "keyword.operator.pipe.shell"
                          ]
                      ] )
                ] )
          ; ( "compound-command"
            , `Assoc
                [ ( "patterns"
                  , `List
                      [ `Assoc
                          [ "begin", `String "(\\[{2})"
                          ; "end", `String "(\\]{2})"
                          ; ( "patterns"
                            , `List
                                [ `Assoc [ "include", `String "#logical-expression" ]
                                ; `Assoc [ "include", `String "$self" ]
                                ] )
                          ; "name", `String "meta.scope.logical-expression.shell"
                          ; ( "captures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ ( "name"
                                        , `String
                                            "punctuation.definition.logical-expression.shell"
                                        )
                                      ] )
                                ] )
                          ]
                      ; `Assoc
                          [ "begin", `String "(\\({2})"
                          ; ( "endCaptures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "name"
                                        , `String
                                            "punctuation.definition.string.end.shell" )
                                      ] )
                                ] )
                          ; "end", `String "(\\){2})"
                          ; "patterns", `List [ `Assoc [ "include", `String "#math" ] ]
                          ; "name", `String "string.other.math.shell"
                          ; ( "beginCaptures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "name"
                                        , `String
                                            "punctuation.definition.string.begin.shell" )
                                      ] )
                                ] )
                          ]
                      ; `Assoc
                          [ "begin", `String "(\\()"
                          ; "end", `String "(\\))"
                          ; "patterns", `List [ `Assoc [ "include", `String "$self" ] ]
                          ; "name", `String "meta.scope.subshell.shell"
                          ; ( "captures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.definition.subshell.shell"
                                        )
                                      ] )
                                ] )
                          ]
                      ; `Assoc
                          [ "begin", `String "(?<=\\s|^)(\\{)(?=\\s|$)"
                          ; "end", `String "(?<=^|;)\\s*(\\})"
                          ; "patterns", `List [ `Assoc [ "include", `String "$self" ] ]
                          ; "name", `String "meta.scope.group.shell"
                          ; ( "captures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.definition.group.shell" )
                                      ] )
                                ] )
                          ]
                      ] )
                ] )
          ; ( "lines"
            , `Assoc
                [ ( "patterns"
                  , `List
                      [ `Assoc
                          [ "match", `String "\\\\\\n"
                          ; "name", `String "constant.character.escape.newline.shell"
                          ]
                      ] )
                ] )
          ; ( "heredoc"
            , `Assoc
                [ ( "patterns"
                  , `List
                      [ `Assoc
                          [ "end", `String "^\\t*(RUBY)(?=\\s|;|&|$)"
                          ; "begin", `String "(<<)-\\s*(\"|'|)(RUBY)\\2"
                          ; ( "beginCaptures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ "name", `String "keyword.operator.heredoc.shell" ]
                                  )
                                ; ( "3"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "keyword.control.heredoc-token.shell" )
                                      ] )
                                ] )
                          ; "contentName", `String "source.ruby.embedded.shell"
                          ; ( "patterns"
                            , `List [ `Assoc [ "include", `String "source.ruby" ] ] )
                          ; ( "captures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.definition.string.shell" )
                                      ] )
                                ] )
                          ; ( "endCaptures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "keyword.control.heredoc-token.shell" )
                                      ] )
                                ] )
                          ; "name", `String "string.unquoted.heredoc.no-indent.ruby.shell"
                          ]
                      ; `Assoc
                          [ "end", `String "^(RUBY)(?=\\s|;|&|$)"
                          ; "begin", `String "(<<)\\s*(\"|'|)(RUBY)\\2"
                          ; ( "beginCaptures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ "name", `String "keyword.operator.heredoc.shell" ]
                                  )
                                ; ( "3"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "keyword.control.heredoc-token.shell" )
                                      ] )
                                ] )
                          ; "contentName", `String "source.ruby.embedded.shell"
                          ; ( "patterns"
                            , `List [ `Assoc [ "include", `String "source.ruby" ] ] )
                          ; ( "captures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.definition.string.shell" )
                                      ] )
                                ] )
                          ; ( "endCaptures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "keyword.control.heredoc-token.shell" )
                                      ] )
                                ] )
                          ; "name", `String "string.unquoted.heredoc.ruby.shell"
                          ]
                      ; `Assoc
                          [ "end", `String "^\\t*(PYTHON)(?=\\s|;|&|$)"
                          ; "begin", `String "(<<)-\\s*(\"|'|)(PYTHON)\\2"
                          ; ( "beginCaptures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ "name", `String "keyword.operator.heredoc.shell" ]
                                  )
                                ; ( "3"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "keyword.control.heredoc-token.shell" )
                                      ] )
                                ] )
                          ; "contentName", `String "source.python.embedded.shell"
                          ; ( "patterns"
                            , `List [ `Assoc [ "include", `String "source.python" ] ] )
                          ; ( "captures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.definition.string.shell" )
                                      ] )
                                ] )
                          ; ( "endCaptures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "keyword.control.heredoc-token.shell" )
                                      ] )
                                ] )
                          ; ( "name"
                            , `String "string.unquoted.heredoc.no-indent.python.shell" )
                          ]
                      ; `Assoc
                          [ "end", `String "^(PYTHON)(?=\\s|;|&|$)"
                          ; "begin", `String "(<<)\\s*(\"|'|)(PYTHON)\\2"
                          ; ( "beginCaptures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ "name", `String "keyword.operator.heredoc.shell" ]
                                  )
                                ; ( "3"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "keyword.control.heredoc-token.shell" )
                                      ] )
                                ] )
                          ; "contentName", `String "source.python.embedded.shell"
                          ; ( "patterns"
                            , `List [ `Assoc [ "include", `String "source.python" ] ] )
                          ; ( "captures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.definition.string.shell" )
                                      ] )
                                ] )
                          ; ( "endCaptures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "keyword.control.heredoc-token.shell" )
                                      ] )
                                ] )
                          ; "name", `String "string.unquoted.heredoc.python.shell"
                          ]
                      ; `Assoc
                          [ "end", `String "^\\t*(APPLESCRIPT)(?=\\s|;|&|$)"
                          ; "begin", `String "(<<)-\\s*(\"|'|)(APPLESCRIPT)\\2"
                          ; ( "beginCaptures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ "name", `String "keyword.operator.heredoc.shell" ]
                                  )
                                ; ( "3"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "keyword.control.heredoc-token.shell" )
                                      ] )
                                ] )
                          ; "contentName", `String "source.applescript.embedded.shell"
                          ; ( "patterns"
                            , `List [ `Assoc [ "include", `String "source.applescript" ] ]
                            )
                          ; ( "captures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.definition.string.shell" )
                                      ] )
                                ] )
                          ; ( "endCaptures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "keyword.control.heredoc-token.shell" )
                                      ] )
                                ] )
                          ; ( "name"
                            , `String
                                "string.unquoted.heredoc.no-indent.applescript.shell" )
                          ]
                      ; `Assoc
                          [ "end", `String "^(APPLESCRIPT)(?=\\s|;|&|$)"
                          ; "begin", `String "(<<)\\s*(\"|'|)(APPLESCRIPT)\\2"
                          ; ( "beginCaptures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ "name", `String "keyword.operator.heredoc.shell" ]
                                  )
                                ; ( "3"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "keyword.control.heredoc-token.shell" )
                                      ] )
                                ] )
                          ; "contentName", `String "source.applescript.embedded.shell"
                          ; ( "patterns"
                            , `List [ `Assoc [ "include", `String "source.applescript" ] ]
                            )
                          ; ( "captures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.definition.string.shell" )
                                      ] )
                                ] )
                          ; ( "endCaptures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "keyword.control.heredoc-token.shell" )
                                      ] )
                                ] )
                          ; "name", `String "string.unquoted.heredoc.applescript.shell"
                          ]
                      ; `Assoc
                          [ "end", `String "^\\t*(HTML)(?=\\s|;|&|$)"
                          ; "begin", `String "(<<)-\\s*(\"|'|)(HTML)\\2"
                          ; ( "beginCaptures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ "name", `String "keyword.operator.heredoc.shell" ]
                                  )
                                ; ( "3"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "keyword.control.heredoc-token.shell" )
                                      ] )
                                ] )
                          ; "contentName", `String "text.html.embedded.shell"
                          ; ( "patterns"
                            , `List [ `Assoc [ "include", `String "text.html.basic" ] ] )
                          ; ( "captures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.definition.string.shell" )
                                      ] )
                                ] )
                          ; ( "endCaptures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "keyword.control.heredoc-token.shell" )
                                      ] )
                                ] )
                          ; "name", `String "string.unquoted.heredoc.no-indent.html.shell"
                          ]
                      ; `Assoc
                          [ "end", `String "^(HTML)(?=\\s|;|&|$)"
                          ; "begin", `String "(<<)\\s*(\"|'|)(HTML)\\2"
                          ; ( "beginCaptures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ "name", `String "keyword.operator.heredoc.shell" ]
                                  )
                                ; ( "3"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "keyword.control.heredoc-token.shell" )
                                      ] )
                                ] )
                          ; "contentName", `String "text.html.embedded.shell"
                          ; ( "patterns"
                            , `List [ `Assoc [ "include", `String "text.html.basic" ] ] )
                          ; ( "captures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.definition.string.shell" )
                                      ] )
                                ] )
                          ; ( "endCaptures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "keyword.control.heredoc-token.shell" )
                                      ] )
                                ] )
                          ; "name", `String "string.unquoted.heredoc.html.shell"
                          ]
                      ; `Assoc
                          [ "end", `String "^\\t*(MARKDOWN)(?=\\s|;|&|$)"
                          ; "begin", `String "(<<)-\\s*(\"|'|)(MARKDOWN)\\2"
                          ; ( "beginCaptures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ "name", `String "keyword.operator.heredoc.shell" ]
                                  )
                                ; ( "3"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "keyword.control.heredoc-token.shell" )
                                      ] )
                                ] )
                          ; "contentName", `String "text.html.markdown.embedded.shell"
                          ; ( "patterns"
                            , `List [ `Assoc [ "include", `String "text.html.markdown" ] ]
                            )
                          ; ( "captures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.definition.string.shell" )
                                      ] )
                                ] )
                          ; ( "endCaptures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "keyword.control.heredoc-token.shell" )
                                      ] )
                                ] )
                          ; ( "name"
                            , `String "string.unquoted.heredoc.no-indent.markdown.shell" )
                          ]
                      ; `Assoc
                          [ "end", `String "^(MARKDOWN)(?=\\s|;|&|$)"
                          ; "begin", `String "(<<)\\s*(\"|'|)(MARKDOWN)\\2"
                          ; ( "beginCaptures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ "name", `String "keyword.operator.heredoc.shell" ]
                                  )
                                ; ( "3"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "keyword.control.heredoc-token.shell" )
                                      ] )
                                ] )
                          ; "contentName", `String "text.html.markdown.embedded.shell"
                          ; ( "patterns"
                            , `List [ `Assoc [ "include", `String "text.html.markdown" ] ]
                            )
                          ; ( "captures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.definition.string.shell" )
                                      ] )
                                ] )
                          ; ( "endCaptures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "keyword.control.heredoc-token.shell" )
                                      ] )
                                ] )
                          ; "name", `String "string.unquoted.heredoc.markdown.shell"
                          ]
                      ; `Assoc
                          [ "end", `String "^\\t*(TEXTILE)(?=\\s|;|&|$)"
                          ; "begin", `String "(<<)-\\s*(\"|'|)(TEXTILE)\\2"
                          ; ( "beginCaptures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ "name", `String "keyword.operator.heredoc.shell" ]
                                  )
                                ; ( "3"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "keyword.control.heredoc-token.shell" )
                                      ] )
                                ] )
                          ; "contentName", `String "text.html.textile.embedded.shell"
                          ; ( "patterns"
                            , `List [ `Assoc [ "include", `String "text.html.textile" ] ]
                            )
                          ; ( "captures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.definition.string.shell" )
                                      ] )
                                ] )
                          ; ( "endCaptures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "keyword.control.heredoc-token.shell" )
                                      ] )
                                ] )
                          ; ( "name"
                            , `String "string.unquoted.heredoc.no-indent.textile.shell" )
                          ]
                      ; `Assoc
                          [ "end", `String "^(TEXTILE)(?=\\s|;|&|$)"
                          ; "begin", `String "(<<)\\s*(\"|'|)(TEXTILE)\\2"
                          ; ( "beginCaptures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ "name", `String "keyword.operator.heredoc.shell" ]
                                  )
                                ; ( "3"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "keyword.control.heredoc-token.shell" )
                                      ] )
                                ] )
                          ; "contentName", `String "text.html.textile.embedded.shell"
                          ; ( "patterns"
                            , `List [ `Assoc [ "include", `String "text.html.textile" ] ]
                            )
                          ; ( "captures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.definition.string.shell" )
                                      ] )
                                ] )
                          ; ( "endCaptures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "keyword.control.heredoc-token.shell" )
                                      ] )
                                ] )
                          ; "name", `String "string.unquoted.heredoc.textile.shell"
                          ]
                      ; `Assoc
                          [ "begin", `String "(<<)-\\s*(\"|'|)\\\\?(\\w+)\\2"
                          ; ( "endCaptures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "keyword.control.heredoc-token.shell" )
                                      ] )
                                ] )
                          ; "end", `String "^\\t*(\\3)(?=\\s|;|&|$)"
                          ; "name", `String "string.unquoted.heredoc.no-indent.shell"
                          ; ( "beginCaptures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ "name", `String "keyword.operator.heredoc.shell" ]
                                  )
                                ; ( "3"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "keyword.control.heredoc-token.shell" )
                                      ] )
                                ] )
                          ; ( "captures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.definition.string.shell" )
                                      ] )
                                ] )
                          ]
                      ; `Assoc
                          [ "begin", `String "(<<)\\s*(\"|'|)\\\\?(\\w+)\\2"
                          ; ( "endCaptures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "keyword.control.heredoc-token.shell" )
                                      ] )
                                ] )
                          ; "end", `String "^(\\3)(?=\\s|;|&|$)"
                          ; "name", `String "string.unquoted.heredoc.shell"
                          ; ( "beginCaptures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ "name", `String "keyword.operator.heredoc.shell" ]
                                  )
                                ; ( "3"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "keyword.control.heredoc-token.shell" )
                                      ] )
                                ] )
                          ; ( "captures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.definition.string.shell" )
                                      ] )
                                ] )
                          ]
                      ] )
                ] )
          ; ( "string"
            , `Assoc
                [ ( "patterns"
                  , `List
                      [ `Assoc
                          [ "match", `String "\\\\."
                          ; "name", `String "constant.character.escape.shell"
                          ]
                      ; `Assoc
                          [ "begin", `String "'"
                          ; ( "endCaptures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "name"
                                        , `String
                                            "punctuation.definition.string.end.shell" )
                                      ] )
                                ] )
                          ; "end", `String "'"
                          ; "name", `String "string.quoted.single.shell"
                          ; ( "beginCaptures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "name"
                                        , `String
                                            "punctuation.definition.string.begin.shell" )
                                      ] )
                                ] )
                          ]
                      ; `Assoc
                          [ "begin", `String "\\$?\""
                          ; ( "endCaptures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "name"
                                        , `String
                                            "punctuation.definition.string.end.shell" )
                                      ] )
                                ] )
                          ; "end", `String "\""
                          ; ( "patterns"
                            , `List
                                [ `Assoc
                                    [ "match", `String "\\\\[\\$`\"\\\\\\n]"
                                    ; "name", `String "constant.character.escape.shell"
                                    ]
                                ; `Assoc [ "include", `String "#variable" ]
                                ; `Assoc [ "include", `String "#interpolation" ]
                                ] )
                          ; "name", `String "string.quoted.double.shell"
                          ; ( "beginCaptures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "name"
                                        , `String
                                            "punctuation.definition.string.begin.shell" )
                                      ] )
                                ] )
                          ]
                      ; `Assoc
                          [ "begin", `String "\\$'"
                          ; ( "endCaptures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "name"
                                        , `String
                                            "punctuation.definition.string.end.shell" )
                                      ] )
                                ] )
                          ; "end", `String "'"
                          ; ( "patterns"
                            , `List
                                [ `Assoc
                                    [ "match", `String "\\\\(a|b|e|f|n|r|t|v|\\\\|')"
                                    ; ( "name"
                                      , `String "constant.character.escape.ansi-c.shell" )
                                    ]
                                ; `Assoc
                                    [ "match", `String "\\\\[0-9]{3}"
                                    ; ( "name"
                                      , `String "constant.character.escape.octal.shell" )
                                    ]
                                ; `Assoc
                                    [ "match", `String "\\\\x[0-9a-fA-F]{2}"
                                    ; ( "name"
                                      , `String "constant.character.escape.hex.shell" )
                                    ]
                                ; `Assoc
                                    [ "match", `String "\\\\c."
                                    ; ( "name"
                                      , `String
                                          "constant.character.escape.control-char.shell" )
                                    ]
                                ] )
                          ; "name", `String "string.quoted.single.dollar.shell"
                          ; ( "beginCaptures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "name"
                                        , `String
                                            "punctuation.definition.string.begin.shell" )
                                      ] )
                                ] )
                          ]
                      ] )
                ] )
          ; ( "logical-expression"
            , `Assoc
                [ ( "patterns"
                  , `List
                      [ `Assoc
                          [ "comment", `String "do we want a special rule for ( expr )?"
                          ; "match", `String "=[=~]?|!=?|<|>|&&|\\|\\|"
                          ; "name", `String "keyword.operator.logical.shell"
                          ]
                      ; `Assoc
                          [ ( "match"
                            , `String
                                "(?<!\\S)-(nt|ot|ef|eq|ne|l[te]|g[te]|[a-hknoprstuwxzOGLSN])"
                            )
                          ; "name", `String "keyword.operator.logical.shell"
                          ]
                      ] )
                ] )
          ; ( "comment"
            , `Assoc
                [ "begin", `String "(^[ \\t]+)?(?<!\\S)(?=#)(?!#\\{)"
                ; "end", `String "(?!\\G)"
                ; ( "patterns"
                  , `List
                      [ `Assoc
                          [ "begin", `String "^(#!)"
                          ; "end", `String "\\n"
                          ; "name", `String "comment.line.shebang.shell"
                          ; ( "beginCaptures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ ( "name"
                                        , `String
                                            "punctuation.definition.comment.line.shebang.shell"
                                        )
                                      ] )
                                ] )
                          ]
                      ; `Assoc
                          [ "begin", `String "#"
                          ; "end", `String "\\n"
                          ; "name", `String "comment.line.number-sign.shell"
                          ; ( "beginCaptures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.definition.comment.shell" )
                                      ] )
                                ] )
                          ]
                      ] )
                ; ( "beginCaptures"
                  , `Assoc
                      [ ( "1"
                        , `Assoc
                            [ ( "name"
                              , `String "punctuation.whitespace.comment.leading.shell" )
                            ] )
                      ] )
                ] )
          ; ( "support"
            , `Assoc
                [ ( "patterns"
                  , `List
                      [ `Assoc
                          [ "match", `String "(?<=^|;|&|\\s)(?::|\\.)(?=\\s|;|&|$)"
                          ; "name", `String "support.function.builtin.shell"
                          ]
                      ; `Assoc
                          [ ( "match"
                            , `String
                                "(?<=^|;|&|\\s)(?:alias|bg|bind|break|builtin|caller|cd|command|compgen|complete|dirs|disown|echo|enable|eval|exec|exit|false|fc|fg|getopts|hash|help|history|jobs|kill|let|logout|mapfile|popd|printf|pushd|pwd|read(array)?|readonly|set|shift|shopt|source|suspend|test|times|trap|true|type|ulimit|umask|unalias|unset|wait)(?=\\s|;|&|$)"
                            )
                          ; "name", `String "support.function.builtin.shell"
                          ]
                      ] )
                ] )
          ; ( "math"
            , `Assoc
                [ ( "patterns"
                  , `List
                      [ `Assoc [ "include", `String "#variable" ]
                      ; `Assoc
                          [ ( "match"
                            , `String
                                "\\+{1,2}|-{1,2}|!|~|\\*{1,2}|/|%|<[<=]?|>[>=]?|==|!=|\\^|\\|{1,2}|&{1,2}|\\?|\\:|,|=|[*/%+\\-&^|]=|<<=|>>="
                            )
                          ; "name", `String "keyword.operator.arithmetic.shell"
                          ]
                      ; `Assoc
                          [ "match", `String "0[xX]\\h+"
                          ; "name", `String "constant.numeric.hex.shell"
                          ]
                      ; `Assoc
                          [ "match", `String "0\\d+"
                          ; "name", `String "constant.numeric.octal.shell"
                          ]
                      ; `Assoc
                          [ "match", `String "\\d{1,2}#[0-9a-zA-Z@_]+"
                          ; "name", `String "constant.numeric.other.shell"
                          ]
                      ; `Assoc
                          [ "match", `String "\\d+"
                          ; "name", `String "constant.numeric.integer.shell"
                          ]
                      ] )
                ] )
          ; ( "variable"
            , `Assoc
                [ ( "patterns"
                  , `List
                      [ `Assoc
                          [ "match", `String "(\\$)[a-zA-Z_][a-zA-Z0-9_]*"
                          ; "name", `String "variable.other.normal.shell"
                          ; ( "captures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.definition.variable.shell"
                                        )
                                      ] )
                                ] )
                          ]
                      ; `Assoc
                          [ "match", `String "(\\$)[-*@#?$!0_]"
                          ; "name", `String "variable.other.special.shell"
                          ; ( "captures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.definition.variable.shell"
                                        )
                                      ] )
                                ] )
                          ]
                      ; `Assoc
                          [ "match", `String "(\\$)[1-9]"
                          ; "name", `String "variable.other.positional.shell"
                          ; ( "captures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.definition.variable.shell"
                                        )
                                      ] )
                                ] )
                          ]
                      ; `Assoc
                          [ "begin", `String "\\$\\{"
                          ; "end", `String "\\}"
                          ; ( "patterns"
                            , `List
                                [ `Assoc
                                    [ "match", `String "!|:[-=?+]?|\\*|@|#{1,2}|%{1,2}|/"
                                    ; "name", `String "keyword.operator.expansion.shell"
                                    ]
                                ; `Assoc
                                    [ "match", `String "(\\[)([^\\]]+)(\\])"
                                    ; ( "captures"
                                      , `Assoc
                                          [ ( "1"
                                            , `Assoc
                                                [ ( "name"
                                                  , `String
                                                      "punctuation.section.array.shell" )
                                                ] )
                                          ; ( "3"
                                            , `Assoc
                                                [ ( "name"
                                                  , `String
                                                      "punctuation.section.array.shell" )
                                                ] )
                                          ] )
                                    ]
                                ; `Assoc [ "include", `String "#string" ]
                                ; `Assoc [ "include", `String "#variable" ]
                                ; `Assoc [ "include", `String "#interpolation" ]
                                ] )
                          ; "name", `String "variable.other.bracket.shell"
                          ; ( "captures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.definition.variable.shell"
                                        )
                                      ] )
                                ] )
                          ]
                      ] )
                ] )
          ; ( "list"
            , `Assoc
                [ ( "patterns"
                  , `List
                      [ `Assoc
                          [ "match", `String ";|&&|&|\\|\\|"
                          ; "name", `String "keyword.operator.list.shell"
                          ]
                      ] )
                ] )
          ; ( "redirection"
            , `Assoc
                [ ( "patterns"
                  , `List
                      [ `Assoc
                          [ "begin", `String "[><]\\("
                          ; ( "endCaptures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "name"
                                        , `String
                                            "punctuation.definition.string.end.shell" )
                                      ] )
                                ] )
                          ; "end", `String "\\)"
                          ; "patterns", `List [ `Assoc [ "include", `String "$self" ] ]
                          ; ( "name"
                            , `String "string.interpolated.process-substitution.shell" )
                          ; ( "beginCaptures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "name"
                                        , `String
                                            "punctuation.definition.string.begin.shell" )
                                      ] )
                                ] )
                          ]
                      ; `Assoc
                          [ ( "comment"
                            , `String
                                "valid: &>word >&word >word [n]>&[n] [n]<word [n]>word \
                                 [n]>>word [n]<&word (last one is duplicate)" )
                          ; "match", `String "&>|\\d*>&\\d*|\\d*(>>|>|<)|\\d*<&|\\d*<>"
                          ; "name", `String "keyword.operator.redirect.shell"
                          ]
                      ] )
                ] )
          ; ( "interpolation"
            , `Assoc
                [ ( "patterns"
                  , `List
                      [ `Assoc
                          [ "begin", `String "\\$\\({2}"
                          ; ( "endCaptures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "name"
                                        , `String
                                            "punctuation.definition.string.end.shell" )
                                      ] )
                                ] )
                          ; "end", `String "\\){2}"
                          ; "patterns", `List [ `Assoc [ "include", `String "#math" ] ]
                          ; "name", `String "string.other.math.shell"
                          ; ( "beginCaptures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "name"
                                        , `String
                                            "punctuation.definition.string.begin.shell" )
                                      ] )
                                ] )
                          ]
                      ; `Assoc
                          [ "begin", `String "`"
                          ; ( "endCaptures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "name"
                                        , `String
                                            "punctuation.definition.string.end.shell" )
                                      ] )
                                ] )
                          ; "end", `String "`"
                          ; ( "patterns"
                            , `List
                                [ `Assoc
                                    [ "match", `String "\\\\[`\\\\$]"
                                    ; "name", `String "constant.character.escape.shell"
                                    ]
                                ; `Assoc
                                    [ "begin", `String "(?<=^|;|&|\\s|`)(#)(?!\\{)"
                                    ; "end", `String "(?=`)|\\n"
                                    ; "name", `String "comment.line.number-sign.shell"
                                    ; ( "beginCaptures"
                                      , `Assoc
                                          [ ( "1"
                                            , `Assoc
                                                [ ( "name"
                                                  , `String
                                                      "punctuation.definition.comment.shell"
                                                  )
                                                ] )
                                          ] )
                                    ]
                                ; `Assoc [ "include", `String "$self" ]
                                ] )
                          ; "name", `String "string.interpolated.backtick.shell"
                          ; ( "beginCaptures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "name"
                                        , `String
                                            "punctuation.definition.string.begin.shell" )
                                      ] )
                                ] )
                          ]
                      ; `Assoc
                          [ "begin", `String "\\$\\("
                          ; ( "endCaptures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "name"
                                        , `String
                                            "punctuation.definition.string.end.shell" )
                                      ] )
                                ] )
                          ; "end", `String "\\)"
                          ; ( "patterns"
                            , `List
                                [ `Assoc
                                    [ "begin", `String "(?<=^|;|&|\\s|\\()(#)(?!\\{)"
                                    ; "end", `String "(?=\\))|\\n"
                                    ; "name", `String "comment.line.number-sign.shell"
                                    ; ( "beginCaptures"
                                      , `Assoc
                                          [ ( "1"
                                            , `Assoc
                                                [ ( "name"
                                                  , `String
                                                      "punctuation.definition.comment.shell"
                                                  )
                                                ] )
                                          ] )
                                    ]
                                ; `Assoc [ "include", `String "$self" ]
                                ] )
                          ; "name", `String "string.interpolated.dollar.shell"
                          ; ( "beginCaptures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "name"
                                        , `String
                                            "punctuation.definition.string.begin.shell" )
                                      ] )
                                ] )
                          ]
                      ] )
                ] )
          ; ( "loop"
            , `Assoc
                [ ( "patterns"
                  , `List
                      [ `Assoc
                          [ "begin", `String "(?<=^|;|&|\\s)(for)\\s+(?=\\({2})"
                          ; "end", `String "(?<=^|;|&|\\s)(done)(?=\\s|;|&|$|\\))"
                          ; "patterns", `List [ `Assoc [ "include", `String "$self" ] ]
                          ; "name", `String "meta.scope.for-loop.shell"
                          ; ( "captures"
                            , `Assoc
                                [ "1", `Assoc [ "name", `String "keyword.control.shell" ]
                                ] )
                          ]
                      ; `Assoc
                          [ ( "begin"
                            , `String "(?<=^|;|&|\\s)(for)\\s+([^\\s\\\\]+)(?=\\s|;|&|$)"
                            )
                          ; ( "endCaptures"
                            , `Assoc
                                [ "1", `Assoc [ "name", `String "keyword.control.shell" ]
                                ] )
                          ; "end", `String "(?<=^|;|&|\\s)(done)(?=\\s|;|&|$|\\))"
                          ; "patterns", `List [ `Assoc [ "include", `String "$self" ] ]
                          ; "name", `String "meta.scope.for-in-loop.shell"
                          ; ( "beginCaptures"
                            , `Assoc
                                [ "1", `Assoc [ "name", `String "keyword.control.shell" ]
                                ; ( "2"
                                  , `Assoc [ "name", `String "variable.other.loop.shell" ]
                                  )
                                ] )
                          ]
                      ; `Assoc
                          [ "begin", `String "(?<=^|;|&|\\s)(while|until)(?=\\s|;|&|$)"
                          ; "end", `String "(?<=^|;|&|\\s)(done)(?=\\s|;|&|$|\\))"
                          ; "patterns", `List [ `Assoc [ "include", `String "$self" ] ]
                          ; "name", `String "meta.scope.while-loop.shell"
                          ; ( "captures"
                            , `Assoc
                                [ "1", `Assoc [ "name", `String "keyword.control.shell" ]
                                ] )
                          ]
                      ; `Assoc
                          [ ( "begin"
                            , `String
                                "(?<=^|;|&|\\s)(select)\\s+([^\\s\\\\]+)(?=\\s|;|&|$)" )
                          ; ( "endCaptures"
                            , `Assoc
                                [ "1", `Assoc [ "name", `String "keyword.control.shell" ]
                                ] )
                          ; "end", `String "(?<=^|;|&|\\s)(done)(?=\\s|;|&|$|\\))"
                          ; "patterns", `List [ `Assoc [ "include", `String "$self" ] ]
                          ; "name", `String "meta.scope.select-block.shell"
                          ; ( "beginCaptures"
                            , `Assoc
                                [ "1", `Assoc [ "name", `String "keyword.control.shell" ]
                                ; ( "2"
                                  , `Assoc [ "name", `String "variable.other.loop.shell" ]
                                  )
                                ] )
                          ]
                      ; `Assoc
                          [ "begin", `String "(?<=^|;|&|\\s)(case)(?=\\s|;|&|$)"
                          ; "end", `String "(?<=^|;|&|\\s)(esac)(?=\\s|;|&|$|\\))"
                          ; ( "patterns"
                            , `List
                                [ `Assoc
                                    [ "begin", `String "(?<=^|;|&|\\s)(?:in)(?=\\s|;|&|$)"
                                    ; ( "end"
                                      , `String
                                          "(?<=^|;|&|\\s)(?=(?:esac)(?:\\s|;|&|$|\\)))" )
                                    ; ( "patterns"
                                      , `List
                                          [ `Assoc [ "include", `String "#comment" ]
                                          ; `Assoc [ "include", `String "#case-clause" ]
                                          ; `Assoc [ "include", `String "$self" ]
                                          ] )
                                    ; "name", `String "meta.scope.case-body.shell"
                                    ; ( "beginCaptures"
                                      , `Assoc
                                          [ ( "1"
                                            , `Assoc
                                                [ "name", `String "keyword.control.shell"
                                                ] )
                                          ] )
                                    ]
                                ; `Assoc [ "include", `String "$self" ]
                                ] )
                          ; "name", `String "meta.scope.case-block.shell"
                          ; ( "captures"
                            , `Assoc
                                [ "1", `Assoc [ "name", `String "keyword.control.shell" ]
                                ] )
                          ]
                      ; `Assoc
                          [ "end", `String "(?<=^|;|&|\\s)(fi)(?=\\s|;|&|$|\\))"
                          ; "begin", `String "(^|(?<=[&;|]))\\s*(if)(?=\\s|;|&|$)"
                          ; ( "beginCaptures"
                            , `Assoc
                                [ "2", `Assoc [ "name", `String "keyword.control.shell" ]
                                ] )
                          ; "patterns", `List [ `Assoc [ "include", `String "$self" ] ]
                          ; ( "comment"
                            , `String
                                "Restrict match to avoid matching in lines like `dd \
                                 if=/dev/sda1 \226\128\166`" )
                          ; ( "endCaptures"
                            , `Assoc
                                [ "1", `Assoc [ "name", `String "keyword.control.shell" ]
                                ] )
                          ; "name", `String "meta.scope.if-block.shell"
                          ]
                      ] )
                ] )
          ; ( "case-clause"
            , `Assoc
                [ ( "patterns"
                  , `List
                      [ `Assoc
                          [ "begin", `String "(?=\\S)"
                          ; ( "endCaptures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "name"
                                        , `String
                                            "punctuation.terminator.case-clause.shell" )
                                      ] )
                                ] )
                          ; "end", `String ";;"
                          ; ( "patterns"
                            , `List
                                [ `Assoc
                                    [ "begin", `String "(\\(|(?=\\S))"
                                    ; "end", `String "\\)"
                                    ; ( "patterns"
                                      , `List
                                          [ `Assoc
                                              [ "match", `String "\\|"
                                              ; ( "name"
                                                , `String
                                                    "punctuation.separator.pipe-sign.shell"
                                                )
                                              ]
                                          ; `Assoc [ "include", `String "#string" ]
                                          ; `Assoc [ "include", `String "#variable" ]
                                          ; `Assoc [ "include", `String "#interpolation" ]
                                          ; `Assoc [ "include", `String "#pathname" ]
                                          ] )
                                    ; "name", `String "meta.scope.case-pattern.shell"
                                    ; ( "captures"
                                      , `Assoc
                                          [ ( "0"
                                            , `Assoc
                                                [ ( "name"
                                                  , `String
                                                      "punctuation.definition.case-pattern.shell"
                                                  )
                                                ] )
                                          ] )
                                    ]
                                ; `Assoc
                                    [ "begin", `String "(?<=\\))"
                                    ; "end", `String "(?=;;)"
                                    ; ( "patterns"
                                      , `List [ `Assoc [ "include", `String "$self" ] ] )
                                    ; "name", `String "meta.scope.case-clause-body.shell"
                                    ]
                                ] )
                          ; "name", `String "meta.scope.case-clause.shell"
                          ]
                      ] )
                ] )
          ] )
    ; "keyEquivalent", `String "^~S"
    ; "uuid", `String "DDEEA3ED-6B1C-11D9-8B10-000D93589AF6"
    ; ( "patterns"
      , `List
          [ `Assoc [ "include", `String "#comment" ]
          ; `Assoc [ "include", `String "#pipeline" ]
          ; `Assoc [ "include", `String "#list" ]
          ; `Assoc [ "include", `String "#compound-command" ]
          ; `Assoc [ "include", `String "#loop" ]
          ; `Assoc [ "include", `String "#string" ]
          ; `Assoc [ "include", `String "#function-definition" ]
          ; `Assoc [ "include", `String "#variable" ]
          ; `Assoc [ "include", `String "#interpolation" ]
          ; `Assoc [ "include", `String "#heredoc" ]
          ; `Assoc [ "include", `String "#herestring" ]
          ; `Assoc [ "include", `String "#redirection" ]
          ; `Assoc [ "include", `String "#pathname" ]
          ; `Assoc [ "include", `String "#keyword" ]
          ; `Assoc [ "include", `String "#support" ]
          ; `Assoc [ "include", `String "#lines" ]
          ] )
    ; "scopeName", `String "source.shell"
    ]
;;

let opam =
  `Assoc
    [ "name", `String "opam"
    ; "scopeName", `String "source.ocaml.opam"
    ; "fileTypes", `List [ `String "opam" ]
    ; ( "patterns"
      , `List
          [ `Assoc [ "include", `String "#comments" ]
          ; `Assoc [ "include", `String "#fields" ]
          ; `Assoc [ "include", `String "#values" ]
          ] )
    ; ( "repository"
      , `Assoc
          [ ( "comments"
            , `Assoc
                [ ( "patterns"
                  , `List
                      [ `Assoc
                          [ "comment", `String "block comment"
                          ; "name", `String "comment.block.opam"
                          ; "begin", `String "\\(\\*"
                          ; "end", `String "\\*\\)"
                          ]
                      ; `Assoc
                          [ "comment", `String "line comment"
                          ; "name", `String "comment.line.opam"
                          ; "begin", `String "#"
                          ; "end", `String "$"
                          ]
                      ] )
                ] )
          ; ( "fields"
            , `Assoc
                [ "comment", `String "labeled field"
                ; "match", `String "^([[:word:]-]*[[:alpha:]][[:word:]-]*)(:)"
                ; ( "captures"
                  , `Assoc
                      [ "1", `Assoc [ "name", `String "entity.name.tag.opam" ]
                      ; "2", `Assoc [ "name", `String "keyword.operator.opam" ]
                      ] )
                ] )
          ; ( "values"
            , `Assoc
                [ ( "patterns"
                  , `List
                      [ `Assoc
                          [ "comment", `String "boolean literal"
                          ; "name", `String "constant.language.opam"
                          ; "match", `String "\\b(true|false)\\b"
                          ]
                      ; `Assoc
                          [ "comment", `String "integer literal"
                          ; "name", `String "constant.numeric.decimal.opam"
                          ; "match", `String "(\\b|\\-?)[[:digit:]]+\\b"
                          ]
                      ; `Assoc
                          [ "comment", `String "double-quote string literal"
                          ; "name", `String "string.quoted.double.opam"
                          ; "begin", `String "\""
                          ; "end", `String "\""
                          ; ( "patterns"
                            , `List [ `Assoc [ "include", `String "#string-elements" ] ] )
                          ]
                      ; `Assoc
                          [ "comment", `String "triple-double-quote string literal"
                          ; "name", `String "string.quoted.triple-double.opam"
                          ; "begin", `String "\"\"\""
                          ; "end", `String "\"\"\""
                          ; ( "patterns"
                            , `List [ `Assoc [ "include", `String "#string-elements" ] ] )
                          ]
                      ; `Assoc
                          [ "comment", `String "operator"
                          ; "name", `String "keyword.operator.opam"
                          ; "match", `String "[!=<>\\|&?:]+"
                          ]
                      ; `Assoc
                          [ "comment", `String "identifier"
                          ; "match", `String "\\b([[:word:]+-]+)\\b"
                          ; "name", `String "variable.parameter.opam"
                          ]
                      ] )
                ] )
          ; ( "string-elements"
            , `Assoc
                [ ( "patterns"
                  , `List
                      [ `Assoc
                          [ "comment", `String "escaped backslash"
                          ; "name", `String "constant.character.escape.opam"
                          ; "match", `String "\\\\\\\\"
                          ]
                      ; `Assoc
                          [ "comment", `String "escaped quote or whitespace"
                          ; "name", `String "constant.character.escape.opam"
                          ; "match", `String "\\\\[\"ntbr\\n]"
                          ]
                      ; `Assoc
                          [ "comment", `String "character from decimal ASCII code"
                          ; "name", `String "constant.character.escape.opam"
                          ; "match", `String "\\\\[[:digit:]]{3}"
                          ]
                      ; `Assoc
                          [ "comment", `String "character from hexadecimal ASCII code"
                          ; "name", `String "constant.character.escape.opam"
                          ; "match", `String "\\\\x[[:xdigit:]]{2}"
                          ]
                      ; `Assoc
                          [ "comment", `String "variable interpolation"
                          ; "name", `String "constant.variable.opam"
                          ; "begin", `String "%\\{"
                          ; "end", `String "}\\%"
                          ]
                      ; `Assoc
                          [ "comment", `String "unknown escape sequence"
                          ; "name", `String "invalid.illegal.unknown-escape.opam"
                          ; "match", `String "\\\\."
                          ]
                      ] )
                ] )
          ] )
    ]
;;

let diff =
  `Assoc
    [ "fileTypes", `List [ `String "patch"; `String "diff"; `String "rej" ]
    ; ( "firstLineMatch"
      , `String
          "(?x)^\n\
           \t\t(===\\ modified\\ file\n\
           \t\t|==== \\s* // .+ \\s - \\s .+ \\s+ ====\n\
           \t\t|Index:\\ \n\
           \t\t|---\\ [^%\\n]\n\
           \t\t|\\*\\*\\*.*\\d{4}\\s*$\n\
           \t\t|\\d+(,\\d+)* (a|d|c) \\d+(,\\d+)* $\n\
           \t\t|diff\\ --git\\ \n\
           \t\t|commit\\ [0-9a-f]{40}$\n\
           \t\t)" )
    ; "keyEquivalent", `String "^~D"
    ; "name", `String "Diff"
    ; ( "patterns"
      , `List
          [ `Assoc
              [ ( "captures"
                , `Assoc
                    [ ( "1"
                      , `Assoc [ "name", `String "punctuation.definition.separator.diff" ]
                      )
                    ] )
              ; "match", `String "^((\\*{15})|(={67})|(-{3}))$\\n?"
              ; "name", `String "meta.separator.diff"
              ]
          ; `Assoc
              [ "match", `String "^\\d+(,\\d+)*(a|d|c)\\d+(,\\d+)*$\\n?"
              ; "name", `String "meta.diff.range.normal"
              ]
          ; `Assoc
              [ ( "captures"
                , `Assoc
                    [ "1", `Assoc [ "name", `String "punctuation.definition.range.diff" ]
                    ; "2", `Assoc [ "name", `String "meta.toc-list.line-number.diff" ]
                    ; "3", `Assoc [ "name", `String "punctuation.definition.range.diff" ]
                    ] )
              ; "match", `String "^(@@)\\s*(.+?)\\s*(@@)($\\n?)?"
              ; "name", `String "meta.diff.range.unified"
              ]
          ; `Assoc
              [ ( "captures"
                , `Assoc
                    [ "3", `Assoc [ "name", `String "punctuation.definition.range.diff" ]
                    ; "4", `Assoc [ "name", `String "punctuation.definition.range.diff" ]
                    ; "6", `Assoc [ "name", `String "punctuation.definition.range.diff" ]
                    ; "7", `Assoc [ "name", `String "punctuation.definition.range.diff" ]
                    ] )
              ; "match", `String "^(((\\-{3}) .+ (\\-{4}))|((\\*{3}) .+ (\\*{4})))$\\n?"
              ; "name", `String "meta.diff.range.context"
              ]
          ; `Assoc
              [ "match", `String "^diff --git a/.*$\\n?"
              ; "name", `String "meta.diff.header.git"
              ]
          ; `Assoc
              [ "match", `String "^diff (-|\\S+\\s+\\S+).*$\\n?"
              ; "name", `String "meta.diff.header.command"
              ]
          ; `Assoc
              [ ( "captures"
                , `Assoc
                    [ ( "4"
                      , `Assoc [ "name", `String "punctuation.definition.from-file.diff" ]
                      )
                    ; ( "6"
                      , `Assoc [ "name", `String "punctuation.definition.from-file.diff" ]
                      )
                    ; ( "7"
                      , `Assoc [ "name", `String "punctuation.definition.from-file.diff" ]
                      )
                    ] )
              ; "match", `String "(^(((-{3}) .+)|((\\*{3}) .+))$\\n?|^(={4}) .+(?= - ))"
              ; "name", `String "meta.diff.header.from-file"
              ]
          ; `Assoc
              [ ( "captures"
                , `Assoc
                    [ ( "2"
                      , `Assoc [ "name", `String "punctuation.definition.to-file.diff" ] )
                    ; ( "3"
                      , `Assoc [ "name", `String "punctuation.definition.to-file.diff" ] )
                    ; ( "4"
                      , `Assoc [ "name", `String "punctuation.definition.to-file.diff" ] )
                    ] )
              ; "match", `String "(^(\\+{3}) .+$\\n?| (-) .* (={4})$\\n?)"
              ; "name", `String "meta.diff.header.to-file"
              ]
          ; `Assoc
              [ ( "captures"
                , `Assoc
                    [ ( "3"
                      , `Assoc [ "name", `String "punctuation.definition.inserted.diff" ]
                      )
                    ; ( "6"
                      , `Assoc [ "name", `String "punctuation.definition.inserted.diff" ]
                      )
                    ] )
              ; "match", `String "^(((>)( .*)?)|((\\+).*))$\\n?"
              ; "name", `String "markup.inserted.diff"
              ]
          ; `Assoc
              [ ( "captures"
                , `Assoc
                    [ ( "1"
                      , `Assoc [ "name", `String "punctuation.definition.inserted.diff" ]
                      )
                    ] )
              ; "match", `String "^(!).*$\\n?"
              ; "name", `String "markup.changed.diff"
              ]
          ; `Assoc
              [ ( "captures"
                , `Assoc
                    [ ( "3"
                      , `Assoc [ "name", `String "punctuation.definition.deleted.diff" ] )
                    ; ( "6"
                      , `Assoc [ "name", `String "punctuation.definition.deleted.diff" ] )
                    ] )
              ; "match", `String "^(((<)( .*)?)|((-).*))$\\n?"
              ; "name", `String "markup.deleted.diff"
              ]
          ; `Assoc
              [ "begin", `String "^(#)"
              ; ( "captures"
                , `Assoc
                    [ ( "1"
                      , `Assoc [ "name", `String "punctuation.definition.comment.diff" ] )
                    ] )
              ; "comment", `String "Git produces unified diffs with embedded comments\""
              ; "end", `String "\\n"
              ; "name", `String "comment.line.number-sign.diff"
              ]
          ; `Assoc
              [ "match", `String "^index [0-9a-f]{7,40}\\.\\.[0-9a-f]{7,40}.*$\\n?"
              ; "name", `String "meta.diff.index.git"
              ]
          ; `Assoc
              [ ( "captures"
                , `Assoc
                    [ ( "1"
                      , `Assoc [ "name", `String "punctuation.separator.key-value.diff" ]
                      )
                    ; "2", `Assoc [ "name", `String "meta.toc-list.file-name.diff" ]
                    ] )
              ; "match", `String "^Index(:) (.+)$\\n?"
              ; "name", `String "meta.diff.index"
              ]
          ; `Assoc
              [ "match", `String "^Only in .*: .*$\\n?"
              ; "name", `String "meta.diff.only-in"
              ]
          ] )
    ; "scopeName", `String "source.diff"
    ; "uuid", `String "7E848FF4-708E-11D9-97B4-0011242E4184"
    ]
;;

let go =
  `Assoc
    [ ( "information_for_contributors"
      , `List
          [ `String
              "This file has been converted from \
               https://github.com/worlpaker/go-syntax/blob/master/syntaxes/go.tmLanguage.json"
          ; `String
              "If you want to provide a fix or improvement, please create a pull request \
               against the original repository."
          ; `String "Once accepted there, we are happy to receive an update request."
          ] )
    ; ( "version"
      , `String
          "https://github.com/worlpaker/go-syntax/commit/6e8421faf8f1445512825f63925e54a62106bcf1"
      )
    ; "name", `String "Go"
    ; "scopeName", `String "source.go"
    ; "patterns", `List [ `Assoc [ "include", `String "#statements" ] ]
    ; ( "repository"
      , `Assoc
          [ ( "statements"
            , `Assoc
                [ ( "patterns"
                  , `List
                      [ `Assoc [ "include", `String "#package_name" ]
                      ; `Assoc [ "include", `String "#import" ]
                      ; `Assoc [ "include", `String "#syntax_errors" ]
                      ; `Assoc [ "include", `String "#group-functions" ]
                      ; `Assoc [ "include", `String "#group-types" ]
                      ; `Assoc [ "include", `String "#group-variables" ]
                      ; `Assoc [ "include", `String "#hover" ]
                      ] )
                ] )
          ; ( "group-functions"
            , `Assoc
                [ "comment", `String "all statements related to functions"
                ; ( "patterns"
                  , `List
                      [ `Assoc [ "include", `String "#function_declaration" ]
                      ; `Assoc [ "include", `String "#functions_inline" ]
                      ; `Assoc [ "include", `String "#functions" ]
                      ; `Assoc [ "include", `String "#built_in_functions" ]
                      ; `Assoc [ "include", `String "#support_functions" ]
                      ] )
                ] )
          ; ( "group-types"
            , `Assoc
                [ "comment", `String "all statements related to types"
                ; ( "patterns"
                  , `List
                      [ `Assoc
                          [ "include", `String "#other_struct_interface_expressions" ]
                      ; `Assoc [ "include", `String "#type_assertion_inline" ]
                      ; `Assoc [ "include", `String "#struct_variables_types" ]
                      ; `Assoc [ "include", `String "#interface_variables_types" ]
                      ; `Assoc [ "include", `String "#single_type" ]
                      ; `Assoc [ "include", `String "#multi_types" ]
                      ; `Assoc [ "include", `String "#struct_interface_declaration" ]
                      ; `Assoc [ "include", `String "#double_parentheses_types" ]
                      ; `Assoc [ "include", `String "#switch_types" ]
                      ; `Assoc [ "include", `String "#type-declarations" ]
                      ] )
                ] )
          ; ( "group-variables"
            , `Assoc
                [ "comment", `String "all statements related to variables"
                ; ( "patterns"
                  , `List
                      [ `Assoc [ "include", `String "#const_assignment" ]
                      ; `Assoc [ "include", `String "#var_assignment" ]
                      ; `Assoc [ "include", `String "#variable_assignment" ]
                      ; `Assoc [ "include", `String "#label_loop_variables" ]
                      ; `Assoc [ "include", `String "#slice_index_variables" ]
                      ; `Assoc [ "include", `String "#property_variables" ]
                      ; `Assoc [ "include", `String "#switch_variables" ]
                      ; `Assoc [ "include", `String "#other_variables" ]
                      ] )
                ] )
          ; ( "type-declarations"
            , `Assoc
                [ "comment", `String "includes all type declarations"
                ; ( "patterns"
                  , `List
                      [ `Assoc [ "include", `String "#language_constants" ]
                      ; `Assoc [ "include", `String "#comments" ]
                      ; `Assoc [ "include", `String "#map_types" ]
                      ; `Assoc [ "include", `String "#brackets" ]
                      ; `Assoc [ "include", `String "#delimiters" ]
                      ; `Assoc [ "include", `String "#keywords" ]
                      ; `Assoc [ "include", `String "#operators" ]
                      ; `Assoc [ "include", `String "#runes" ]
                      ; `Assoc [ "include", `String "#storage_types" ]
                      ; `Assoc [ "include", `String "#raw_string_literals" ]
                      ; `Assoc [ "include", `String "#string_literals" ]
                      ; `Assoc [ "include", `String "#numeric_literals" ]
                      ; `Assoc [ "include", `String "#terminators" ]
                      ] )
                ] )
          ; ( "type-declarations-without-brackets"
            , `Assoc
                [ ( "comment"
                  , `String
                      "includes all type declarations without brackets (in some cases, \
                       brackets need to be captured manually)" )
                ; ( "patterns"
                  , `List
                      [ `Assoc [ "include", `String "#language_constants" ]
                      ; `Assoc [ "include", `String "#comments" ]
                      ; `Assoc [ "include", `String "#map_types" ]
                      ; `Assoc [ "include", `String "#delimiters" ]
                      ; `Assoc [ "include", `String "#keywords" ]
                      ; `Assoc [ "include", `String "#operators" ]
                      ; `Assoc [ "include", `String "#runes" ]
                      ; `Assoc [ "include", `String "#storage_types" ]
                      ; `Assoc [ "include", `String "#raw_string_literals" ]
                      ; `Assoc [ "include", `String "#string_literals" ]
                      ; `Assoc [ "include", `String "#numeric_literals" ]
                      ; `Assoc [ "include", `String "#terminators" ]
                      ] )
                ] )
          ; ( "parameter-variable-types"
            , `Assoc
                [ "comment", `String "function and generic parameter types"
                ; ( "patterns"
                  , `List
                      [ `Assoc
                          [ "match", `String "\\{"
                          ; ( "name"
                            , `String "punctuation.definition.begin.bracket.curly.go" )
                          ]
                      ; `Assoc
                          [ "match", `String "\\}"
                          ; "name", `String "punctuation.definition.end.bracket.curly.go"
                          ]
                      ; `Assoc
                          [ "begin", `String "([\\w\\.\\*]+)?(\\[)"
                          ; ( "beginCaptures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ ( "patterns"
                                        , `List
                                            [ `Assoc
                                                [ "include", `String "#type-declarations"
                                                ]
                                            ; `Assoc
                                                [ "match", `String "\\w+"
                                                ; "name", `String "entity.name.type.go"
                                                ]
                                            ] )
                                      ] )
                                ; ( "2"
                                  , `Assoc
                                      [ ( "name"
                                        , `String
                                            "punctuation.definition.begin.bracket.square.go"
                                        )
                                      ] )
                                ] )
                          ; "end", `String "\\]"
                          ; ( "endCaptures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "name"
                                        , `String
                                            "punctuation.definition.end.bracket.square.go"
                                        )
                                      ] )
                                ] )
                          ; ( "patterns"
                            , `List
                                [ `Assoc [ "include", `String "#generic_param_types" ] ] )
                          ]
                      ; `Assoc
                          [ "begin", `String "\\("
                          ; ( "beginCaptures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "name"
                                        , `String
                                            "punctuation.definition.begin.bracket.round.go"
                                        )
                                      ] )
                                ] )
                          ; "end", `String "\\)"
                          ; ( "endCaptures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "name"
                                        , `String
                                            "punctuation.definition.end.bracket.round.go"
                                        )
                                      ] )
                                ] )
                          ; ( "patterns"
                            , `List
                                [ `Assoc [ "include", `String "#function_param_types" ] ]
                            )
                          ]
                      ] )
                ] )
          ; ( "language_constants"
            , `Assoc
                [ "comment", `String "Language constants"
                ; "match", `String "\\b(?:(true|false)|(nil)|(iota))\\b"
                ; ( "captures"
                  , `Assoc
                      [ "1", `Assoc [ "name", `String "constant.language.boolean.go" ]
                      ; "2", `Assoc [ "name", `String "constant.language.null.go" ]
                      ; "3", `Assoc [ "name", `String "constant.language.iota.go" ]
                      ] )
                ] )
          ; ( "comments"
            , `Assoc
                [ ( "patterns"
                  , `List
                      [ `Assoc
                          [ "name", `String "comment.block.go"
                          ; "begin", `String "(\\/\\*)"
                          ; ( "beginCaptures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.definition.comment.go" )
                                      ] )
                                ] )
                          ; "end", `String "(\\*\\/)"
                          ; ( "endCaptures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.definition.comment.go" )
                                      ] )
                                ] )
                          ]
                      ; `Assoc
                          [ "name", `String "comment.line.double-slash.go"
                          ; "begin", `String "(\\/\\/)"
                          ; ( "beginCaptures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.definition.comment.go" )
                                      ] )
                                ] )
                          ; "end", `String "(?:\\n|$)"
                          ]
                      ] )
                ] )
          ; ( "map_types"
            , `Assoc
                [ "comment", `String "map types"
                ; "begin", `String "(\\bmap\\b)(\\[)"
                ; ( "beginCaptures"
                  , `Assoc
                      [ "1", `Assoc [ "name", `String "keyword.map.go" ]
                      ; ( "2"
                        , `Assoc
                            [ ( "name"
                              , `String "punctuation.definition.begin.bracket.square.go" )
                            ] )
                      ] )
                ; ( "end"
                  , `String
                      "(?:(\\])((?:(?:(?:[\\*\\[\\]]+)?(?:\\<\\-\\s*)?\\bchan\\b(?:\\s*\\<\\-)?\\s*)+)?(?!(?:[\\[\\]\\*]+)?\\b(?:func|struct|map)\\b)(?:[\\*\\[\\]]+)?(?:[\\w\\.]+)(?:\\[(?:(?:[\\w\\.\\*\\[\\]\\{\\}]+)(?:(?:\\,\\s*(?:[\\w\\.\\*\\[\\]\\{\\}]+))*))?\\])?)?)"
                  )
                ; ( "endCaptures"
                  , `Assoc
                      [ ( "1"
                        , `Assoc
                            [ ( "name"
                              , `String "punctuation.definition.end.bracket.square.go" )
                            ] )
                      ; ( "2"
                        , `Assoc
                            [ ( "patterns"
                              , `List
                                  [ `Assoc
                                      [ ( "include"
                                        , `String "#type-declarations-without-brackets" )
                                      ]
                                  ; `Assoc
                                      [ "match", `String "\\["
                                      ; ( "name"
                                        , `String
                                            "punctuation.definition.begin.bracket.square.go"
                                        )
                                      ]
                                  ; `Assoc
                                      [ "match", `String "\\]"
                                      ; ( "name"
                                        , `String
                                            "punctuation.definition.end.bracket.square.go"
                                        )
                                      ]
                                  ; `Assoc
                                      [ "match", `String "\\w+"
                                      ; "name", `String "entity.name.type.go"
                                      ]
                                  ] )
                            ] )
                      ] )
                ; ( "patterns"
                  , `List
                      [ `Assoc
                          [ "include", `String "#type-declarations-without-brackets" ]
                      ; `Assoc [ "include", `String "#parameter-variable-types" ]
                      ; `Assoc [ "include", `String "#functions" ]
                      ; `Assoc
                          [ "match", `String "\\["
                          ; ( "name"
                            , `String "punctuation.definition.begin.bracket.square.go" )
                          ]
                      ; `Assoc
                          [ "match", `String "\\]"
                          ; "name", `String "punctuation.definition.end.bracket.square.go"
                          ]
                      ; `Assoc
                          [ "match", `String "\\{"
                          ; ( "name"
                            , `String "punctuation.definition.begin.bracket.curly.go" )
                          ]
                      ; `Assoc
                          [ "match", `String "\\}"
                          ; "name", `String "punctuation.definition.end.bracket.curly.go"
                          ]
                      ; `Assoc
                          [ "match", `String "\\("
                          ; ( "name"
                            , `String "punctuation.definition.begin.bracket.round.go" )
                          ]
                      ; `Assoc
                          [ "match", `String "\\)"
                          ; "name", `String "punctuation.definition.end.bracket.round.go"
                          ]
                      ; `Assoc
                          [ "match", `String "\\w+"
                          ; "name", `String "entity.name.type.go"
                          ]
                      ] )
                ] )
          ; ( "brackets"
            , `Assoc
                [ ( "patterns"
                  , `List
                      [ `Assoc
                          [ "begin", `String "\\{"
                          ; ( "beginCaptures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "name"
                                        , `String
                                            "punctuation.definition.begin.bracket.curly.go"
                                        )
                                      ] )
                                ] )
                          ; "end", `String "\\}"
                          ; ( "endCaptures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "name"
                                        , `String
                                            "punctuation.definition.end.bracket.curly.go"
                                        )
                                      ] )
                                ] )
                          ; "patterns", `List [ `Assoc [ "include", `String "$self" ] ]
                          ]
                      ; `Assoc
                          [ "begin", `String "\\("
                          ; ( "beginCaptures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "name"
                                        , `String
                                            "punctuation.definition.begin.bracket.round.go"
                                        )
                                      ] )
                                ] )
                          ; "end", `String "\\)"
                          ; ( "endCaptures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "name"
                                        , `String
                                            "punctuation.definition.end.bracket.round.go"
                                        )
                                      ] )
                                ] )
                          ; "patterns", `List [ `Assoc [ "include", `String "$self" ] ]
                          ]
                      ; `Assoc
                          [ "begin", `String "\\["
                          ; ( "beginCaptures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "name"
                                        , `String
                                            "punctuation.definition.begin.bracket.square.go"
                                        )
                                      ] )
                                ] )
                          ; "end", `String "\\]"
                          ; ( "endCaptures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "name"
                                        , `String
                                            "punctuation.definition.end.bracket.square.go"
                                        )
                                      ] )
                                ] )
                          ; "patterns", `List [ `Assoc [ "include", `String "$self" ] ]
                          ]
                      ] )
                ] )
          ; ( "delimiters"
            , `Assoc
                [ ( "patterns"
                  , `List
                      [ `Assoc
                          [ "match", `String "\\,"
                          ; "name", `String "punctuation.other.comma.go"
                          ]
                      ; `Assoc
                          [ "match", `String "\\.(?!\\.\\.)"
                          ; "name", `String "punctuation.other.period.go"
                          ]
                      ; `Assoc
                          [ "match", `String ":(?!=)"
                          ; "name", `String "punctuation.other.colon.go"
                          ]
                      ] )
                ] )
          ; ( "keywords"
            , `Assoc
                [ ( "patterns"
                  , `List
                      [ `Assoc
                          [ "comment", `String "Flow control keywords"
                          ; ( "match"
                            , `String
                                "\\b(break|case|continue|default|defer|else|fallthrough|for|go|goto|if|range|return|select|switch)\\b"
                            )
                          ; "name", `String "keyword.control.go"
                          ]
                      ; `Assoc
                          [ "match", `String "\\bchan\\b"
                          ; "name", `String "keyword.channel.go"
                          ]
                      ; `Assoc
                          [ "match", `String "\\bconst\\b"
                          ; "name", `String "keyword.const.go"
                          ]
                      ; `Assoc
                          [ "match", `String "\\bvar\\b"
                          ; "name", `String "keyword.var.go"
                          ]
                      ; `Assoc
                          [ "match", `String "\\bfunc\\b"
                          ; "name", `String "keyword.function.go"
                          ]
                      ; `Assoc
                          [ "match", `String "\\binterface\\b"
                          ; "name", `String "keyword.interface.go"
                          ]
                      ; `Assoc
                          [ "match", `String "\\bmap\\b"
                          ; "name", `String "keyword.map.go"
                          ]
                      ; `Assoc
                          [ "match", `String "\\bstruct\\b"
                          ; "name", `String "keyword.struct.go"
                          ]
                      ; `Assoc
                          [ "match", `String "\\bimport\\b"
                          ; "name", `String "keyword.control.import.go"
                          ]
                      ; `Assoc
                          [ "match", `String "\\btype\\b"
                          ; "name", `String "keyword.type.go"
                          ]
                      ] )
                ] )
          ; ( "operators"
            , `Assoc
                [ "comment", `String "Note that the order here is very important!"
                ; ( "patterns"
                  , `List
                      [ `Assoc
                          [ ( "match"
                            , `String
                                "(?<!\\w)(?:\\*|\\&)+(?:(?!\\d)(?=(?:[\\w\\[\\]])|(?:\\<\\-)))"
                            )
                          ; "name", `String "keyword.operator.address.go"
                          ]
                      ; `Assoc
                          [ "match", `String "<\\-"
                          ; "name", `String "keyword.operator.channel.go"
                          ]
                      ; `Assoc
                          [ "match", `String "\\-\\-"
                          ; "name", `String "keyword.operator.decrement.go"
                          ]
                      ; `Assoc
                          [ "match", `String "\\+\\+"
                          ; "name", `String "keyword.operator.increment.go"
                          ]
                      ; `Assoc
                          [ "match", `String "(==|!=|<=|>=|<(?!<)|>(?!>))"
                          ; "name", `String "keyword.operator.comparison.go"
                          ]
                      ; `Assoc
                          [ "match", `String "(&&|\\|\\||!)"
                          ; "name", `String "keyword.operator.logical.go"
                          ]
                      ; `Assoc
                          [ ( "match"
                            , `String
                                "(=|\\+=|\\-=|\\|=|\\^=|\\*=|/=|:=|%=|<<=|>>=|&\\^=|&=)" )
                          ; "name", `String "keyword.operator.assignment.go"
                          ]
                      ; `Assoc
                          [ "match", `String "(\\+|\\-|\\*|/|%)"
                          ; "name", `String "keyword.operator.arithmetic.go"
                          ]
                      ; `Assoc
                          [ "match", `String "(&(?!\\^)|\\||\\^|&\\^|<<|>>|\\~)"
                          ; "name", `String "keyword.operator.arithmetic.bitwise.go"
                          ]
                      ; `Assoc
                          [ "match", `String "\\.\\.\\."
                          ; "name", `String "keyword.operator.ellipsis.go"
                          ]
                      ] )
                ] )
          ; ( "runes"
            , `Assoc
                [ ( "patterns"
                  , `List
                      [ `Assoc
                          [ "begin", `String "'"
                          ; ( "beginCaptures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.definition.string.begin.go"
                                        )
                                      ] )
                                ] )
                          ; "end", `String "'"
                          ; ( "endCaptures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.definition.string.end.go" )
                                      ] )
                                ] )
                          ; "name", `String "string.quoted.rune.go"
                          ; ( "patterns"
                            , `List
                                [ `Assoc
                                    [ ( "match"
                                      , `String
                                          "\\G(\\\\([0-7]{3}|[abfnrtv\\\\'\"]|x[0-9a-fA-F]{2}|u[0-9a-fA-F]{4}|U[0-9a-fA-F]{8})|.)(?=')"
                                      )
                                    ; "name", `String "constant.other.rune.go"
                                    ]
                                ; `Assoc
                                    [ "match", `String "[^']+"
                                    ; "name", `String "invalid.illegal.unknown-rune.go"
                                    ]
                                ] )
                          ]
                      ] )
                ] )
          ; ( "storage_types"
            , `Assoc
                [ ( "patterns"
                  , `List
                      [ `Assoc
                          [ "match", `String "\\bbool\\b"
                          ; "name", `String "storage.type.boolean.go"
                          ]
                      ; `Assoc
                          [ "match", `String "\\bbyte\\b"
                          ; "name", `String "storage.type.byte.go"
                          ]
                      ; `Assoc
                          [ "match", `String "\\berror\\b"
                          ; "name", `String "storage.type.error.go"
                          ]
                      ; `Assoc
                          [ ( "match"
                            , `String
                                "\\b(complex(64|128)|float(32|64)|u?int(8|16|32|64)?)\\b"
                            )
                          ; "name", `String "storage.type.numeric.go"
                          ]
                      ; `Assoc
                          [ "match", `String "\\brune\\b"
                          ; "name", `String "storage.type.rune.go"
                          ]
                      ; `Assoc
                          [ "match", `String "\\bstring\\b"
                          ; "name", `String "storage.type.string.go"
                          ]
                      ; `Assoc
                          [ "match", `String "\\buintptr\\b"
                          ; "name", `String "storage.type.uintptr.go"
                          ]
                      ; `Assoc
                          [ "match", `String "\\bany\\b"
                          ; "name", `String "entity.name.type.any.go"
                          ]
                      ; `Assoc
                          [ "match", `String "\\bcomparable\\b"
                          ; "name", `String "entity.name.type.comparable.go"
                          ]
                      ] )
                ] )
          ; ( "raw_string_literals"
            , `Assoc
                [ "comment", `String "Raw string literals"
                ; "begin", `String "`"
                ; ( "beginCaptures"
                  , `Assoc
                      [ ( "0"
                        , `Assoc
                            [ "name", `String "punctuation.definition.string.begin.go" ] )
                      ] )
                ; "end", `String "`"
                ; ( "endCaptures"
                  , `Assoc
                      [ ( "0"
                        , `Assoc
                            [ "name", `String "punctuation.definition.string.end.go" ] )
                      ] )
                ; "name", `String "string.quoted.raw.go"
                ; ( "patterns"
                  , `List [ `Assoc [ "include", `String "#string_placeholder" ] ] )
                ] )
          ; ( "string_literals"
            , `Assoc
                [ ( "patterns"
                  , `List
                      [ `Assoc
                          [ "comment", `String "Interpreted string literals"
                          ; "begin", `String "\""
                          ; ( "beginCaptures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.definition.string.begin.go"
                                        )
                                      ] )
                                ] )
                          ; "end", `String "\""
                          ; ( "endCaptures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.definition.string.end.go" )
                                      ] )
                                ] )
                          ; "name", `String "string.quoted.double.go"
                          ; ( "patterns"
                            , `List
                                [ `Assoc [ "include", `String "#string_escaped_char" ]
                                ; `Assoc [ "include", `String "#string_placeholder" ]
                                ] )
                          ]
                      ] )
                ] )
          ; ( "string_escaped_char"
            , `Assoc
                [ ( "patterns"
                  , `List
                      [ `Assoc
                          [ ( "match"
                            , `String
                                "\\\\([0-7]{3}|[abfnrtv\\\\'\"]|x[0-9a-fA-F]{2}|u[0-9a-fA-F]{4}|U[0-9a-fA-F]{8})"
                            )
                          ; "name", `String "constant.character.escape.go"
                          ]
                      ; `Assoc
                          [ "match", `String "\\\\[^0-7xuUabfnrtv\\'\"]"
                          ; "name", `String "invalid.illegal.unknown-escape.go"
                          ]
                      ] )
                ] )
          ; ( "string_placeholder"
            , `Assoc
                [ ( "patterns"
                  , `List
                      [ `Assoc
                          [ ( "match"
                            , `String
                                "%(\\[\\d+\\])?([\\+#\\-0\\x20]{,2}((\\d+|\\*)?(\\.?(\\d+|\\*|(\\[\\d+\\])\\*?)?(\\[\\d+\\])?)?))?[vT%tbcdoqxXUbeEfFgGspw]"
                            )
                          ; "name", `String "constant.other.placeholder.go"
                          ]
                      ] )
                ] )
          ; ( "numeric_literals"
            , `Assoc
                [ ( "match"
                  , `String "(?<!\\w)\\.?\\d(?:(?:[0-9a-zA-Z_\\.])|(?<=[eEpP])[+-])*" )
                ; ( "captures"
                  , `Assoc
                      [ ( "0"
                        , `Assoc
                            [ ( "patterns"
                              , `List
                                  [ `Assoc
                                      [ "begin", `String "(?=.)"
                                      ; "end", `String "(?:\\n|$)"
                                      ; ( "patterns"
                                        , `List
                                            [ `Assoc
                                                [ ( "match"
                                                  , `String
                                                      "(?:(?:(?:(?:(?:\\G(?=[0-9.])(?!0[xXbBoO])([0-9](?:[0-9]|((?<=[0-9a-fA-F])_(?=[0-9a-fA-F])))*)((?:(?<=[0-9])\\.|\\.(?=[0-9])))([0-9](?:[0-9]|((?<=[0-9a-fA-F])_(?=[0-9a-fA-F])))*)?(?:(?<!_)([eE])(\\+?)(\\-?)((?:[0-9](?:[0-9]|(?:(?<=[0-9a-fA-F])_(?=[0-9a-fA-F])))*)))?(i(?!\\w))?(?:\\n|$)|\\G(?=[0-9.])(?!0[xXbBoO])([0-9](?:[0-9]|((?<=[0-9a-fA-F])_(?=[0-9a-fA-F])))*)(?<!_)([eE])(\\+?)(\\-?)((?:[0-9](?:[0-9]|(?:(?<=[0-9a-fA-F])_(?=[0-9a-fA-F])))*))(i(?!\\w))?(?:\\n|$))|\\G((?:(?<=[0-9])\\.|\\.(?=[0-9])))([0-9](?:[0-9]|((?<=[0-9a-fA-F])_(?=[0-9a-fA-F])))*)(?:(?<!_)([eE])(\\+?)(\\-?)((?:[0-9](?:[0-9]|(?:(?<=[0-9a-fA-F])_(?=[0-9a-fA-F])))*)))?(i(?!\\w))?(?:\\n|$))|(\\G0[xX])_?([0-9a-fA-F](?:[0-9a-fA-F]|((?<=[0-9a-fA-F])_(?=[0-9a-fA-F])))*)((?:(?<=[0-9a-fA-F])\\.|\\.(?=[0-9a-fA-F])))([0-9a-fA-F](?:[0-9a-fA-F]|((?<=[0-9a-fA-F])_(?=[0-9a-fA-F])))*)?(?<!_)([pP])(\\+?)(\\-?)((?:[0-9](?:[0-9]|(?:(?<=[0-9a-fA-F])_(?=[0-9a-fA-F])))*))(i(?!\\w))?(?:\\n|$))|(\\G0[xX])_?([0-9a-fA-F](?:[0-9a-fA-F]|((?<=[0-9a-fA-F])_(?=[0-9a-fA-F])))*)(?<!_)([pP])(\\+?)(\\-?)((?:[0-9](?:[0-9]|(?:(?<=[0-9a-fA-F])_(?=[0-9a-fA-F])))*))(i(?!\\w))?(?:\\n|$))|(\\G0[xX])((?:(?<=[0-9a-fA-F])\\.|\\.(?=[0-9a-fA-F])))([0-9a-fA-F](?:[0-9a-fA-F]|((?<=[0-9a-fA-F])_(?=[0-9a-fA-F])))*)(?<!_)([pP])(\\+?)(\\-?)((?:[0-9](?:[0-9]|(?:(?<=[0-9a-fA-F])_(?=[0-9a-fA-F])))*))(i(?!\\w))?(?:\\n|$))"
                                                  )
                                                ; ( "captures"
                                                  , `Assoc
                                                      [ ( "1"
                                                        , `Assoc
                                                            [ ( "name"
                                                              , `String
                                                                  "constant.numeric.decimal.go"
                                                              )
                                                            ; ( "patterns"
                                                              , `List
                                                                  [ `Assoc
                                                                      [ ( "match"
                                                                        , `String
                                                                            "(?<=[0-9a-fA-F])_(?=[0-9a-fA-F])"
                                                                        )
                                                                      ; ( "name"
                                                                        , `String
                                                                            "punctuation.separator.constant.numeric.go"
                                                                        )
                                                                      ]
                                                                  ] )
                                                            ] )
                                                      ; ( "2"
                                                        , `Assoc
                                                            [ ( "name"
                                                              , `String
                                                                  "punctuation.separator.constant.numeric.go"
                                                              )
                                                            ] )
                                                      ; ( "3"
                                                        , `Assoc
                                                            [ ( "name"
                                                              , `String
                                                                  "constant.numeric.decimal.point.go"
                                                              )
                                                            ] )
                                                      ; ( "4"
                                                        , `Assoc
                                                            [ ( "name"
                                                              , `String
                                                                  "constant.numeric.decimal.go"
                                                              )
                                                            ; ( "patterns"
                                                              , `List
                                                                  [ `Assoc
                                                                      [ ( "match"
                                                                        , `String
                                                                            "(?<=[0-9a-fA-F])_(?=[0-9a-fA-F])"
                                                                        )
                                                                      ; ( "name"
                                                                        , `String
                                                                            "punctuation.separator.constant.numeric.go"
                                                                        )
                                                                      ]
                                                                  ] )
                                                            ] )
                                                      ; ( "5"
                                                        , `Assoc
                                                            [ ( "name"
                                                              , `String
                                                                  "punctuation.separator.constant.numeric.go"
                                                              )
                                                            ] )
                                                      ; ( "6"
                                                        , `Assoc
                                                            [ ( "name"
                                                              , `String
                                                                  "keyword.other.unit.exponent.decimal.go"
                                                              )
                                                            ] )
                                                      ; ( "7"
                                                        , `Assoc
                                                            [ ( "name"
                                                              , `String
                                                                  "keyword.operator.plus.exponent.decimal.go"
                                                              )
                                                            ] )
                                                      ; ( "8"
                                                        , `Assoc
                                                            [ ( "name"
                                                              , `String
                                                                  "keyword.operator.minus.exponent.decimal.go"
                                                              )
                                                            ] )
                                                      ; ( "9"
                                                        , `Assoc
                                                            [ ( "name"
                                                              , `String
                                                                  "constant.numeric.exponent.decimal.go"
                                                              )
                                                            ; ( "patterns"
                                                              , `List
                                                                  [ `Assoc
                                                                      [ ( "match"
                                                                        , `String
                                                                            "(?<=[0-9a-fA-F])_(?=[0-9a-fA-F])"
                                                                        )
                                                                      ; ( "name"
                                                                        , `String
                                                                            "punctuation.separator.constant.numeric.go"
                                                                        )
                                                                      ]
                                                                  ] )
                                                            ] )
                                                      ; ( "10"
                                                        , `Assoc
                                                            [ ( "name"
                                                              , `String
                                                                  "keyword.other.unit.imaginary.go"
                                                              )
                                                            ] )
                                                      ; ( "11"
                                                        , `Assoc
                                                            [ ( "name"
                                                              , `String
                                                                  "constant.numeric.decimal.go"
                                                              )
                                                            ; ( "patterns"
                                                              , `List
                                                                  [ `Assoc
                                                                      [ ( "match"
                                                                        , `String
                                                                            "(?<=[0-9a-fA-F])_(?=[0-9a-fA-F])"
                                                                        )
                                                                      ; ( "name"
                                                                        , `String
                                                                            "punctuation.separator.constant.numeric.go"
                                                                        )
                                                                      ]
                                                                  ] )
                                                            ] )
                                                      ; ( "12"
                                                        , `Assoc
                                                            [ ( "name"
                                                              , `String
                                                                  "punctuation.separator.constant.numeric.go"
                                                              )
                                                            ] )
                                                      ; ( "13"
                                                        , `Assoc
                                                            [ ( "name"
                                                              , `String
                                                                  "keyword.other.unit.exponent.decimal.go"
                                                              )
                                                            ] )
                                                      ; ( "14"
                                                        , `Assoc
                                                            [ ( "name"
                                                              , `String
                                                                  "keyword.operator.plus.exponent.decimal.go"
                                                              )
                                                            ] )
                                                      ; ( "15"
                                                        , `Assoc
                                                            [ ( "name"
                                                              , `String
                                                                  "keyword.operator.minus.exponent.decimal.go"
                                                              )
                                                            ] )
                                                      ; ( "16"
                                                        , `Assoc
                                                            [ ( "name"
                                                              , `String
                                                                  "constant.numeric.exponent.decimal.go"
                                                              )
                                                            ; ( "patterns"
                                                              , `List
                                                                  [ `Assoc
                                                                      [ ( "match"
                                                                        , `String
                                                                            "(?<=[0-9a-fA-F])_(?=[0-9a-fA-F])"
                                                                        )
                                                                      ; ( "name"
                                                                        , `String
                                                                            "punctuation.separator.constant.numeric.go"
                                                                        )
                                                                      ]
                                                                  ] )
                                                            ] )
                                                      ; ( "17"
                                                        , `Assoc
                                                            [ ( "name"
                                                              , `String
                                                                  "keyword.other.unit.imaginary.go"
                                                              )
                                                            ] )
                                                      ; ( "18"
                                                        , `Assoc
                                                            [ ( "name"
                                                              , `String
                                                                  "constant.numeric.decimal.point.go"
                                                              )
                                                            ] )
                                                      ; ( "19"
                                                        , `Assoc
                                                            [ ( "name"
                                                              , `String
                                                                  "constant.numeric.decimal.go"
                                                              )
                                                            ; ( "patterns"
                                                              , `List
                                                                  [ `Assoc
                                                                      [ ( "match"
                                                                        , `String
                                                                            "(?<=[0-9a-fA-F])_(?=[0-9a-fA-F])"
                                                                        )
                                                                      ; ( "name"
                                                                        , `String
                                                                            "punctuation.separator.constant.numeric.go"
                                                                        )
                                                                      ]
                                                                  ] )
                                                            ] )
                                                      ; ( "20"
                                                        , `Assoc
                                                            [ ( "name"
                                                              , `String
                                                                  "punctuation.separator.constant.numeric.go"
                                                              )
                                                            ] )
                                                      ; ( "21"
                                                        , `Assoc
                                                            [ ( "name"
                                                              , `String
                                                                  "keyword.other.unit.exponent.decimal.go"
                                                              )
                                                            ] )
                                                      ; ( "22"
                                                        , `Assoc
                                                            [ ( "name"
                                                              , `String
                                                                  "keyword.operator.plus.exponent.decimal.go"
                                                              )
                                                            ] )
                                                      ; ( "23"
                                                        , `Assoc
                                                            [ ( "name"
                                                              , `String
                                                                  "keyword.operator.minus.exponent.decimal.go"
                                                              )
                                                            ] )
                                                      ; ( "24"
                                                        , `Assoc
                                                            [ ( "name"
                                                              , `String
                                                                  "constant.numeric.exponent.decimal.go"
                                                              )
                                                            ; ( "patterns"
                                                              , `List
                                                                  [ `Assoc
                                                                      [ ( "match"
                                                                        , `String
                                                                            "(?<=[0-9a-fA-F])_(?=[0-9a-fA-F])"
                                                                        )
                                                                      ; ( "name"
                                                                        , `String
                                                                            "punctuation.separator.constant.numeric.go"
                                                                        )
                                                                      ]
                                                                  ] )
                                                            ] )
                                                      ; ( "25"
                                                        , `Assoc
                                                            [ ( "name"
                                                              , `String
                                                                  "keyword.other.unit.imaginary.go"
                                                              )
                                                            ] )
                                                      ; ( "26"
                                                        , `Assoc
                                                            [ ( "name"
                                                              , `String
                                                                  "keyword.other.unit.hexadecimal.go"
                                                              )
                                                            ] )
                                                      ; ( "27"
                                                        , `Assoc
                                                            [ ( "name"
                                                              , `String
                                                                  "constant.numeric.hexadecimal.go"
                                                              )
                                                            ; ( "patterns"
                                                              , `List
                                                                  [ `Assoc
                                                                      [ ( "match"
                                                                        , `String
                                                                            "(?<=[0-9a-fA-F])_(?=[0-9a-fA-F])"
                                                                        )
                                                                      ; ( "name"
                                                                        , `String
                                                                            "punctuation.separator.constant.numeric.go"
                                                                        )
                                                                      ]
                                                                  ] )
                                                            ] )
                                                      ; ( "28"
                                                        , `Assoc
                                                            [ ( "name"
                                                              , `String
                                                                  "punctuation.separator.constant.numeric.go"
                                                              )
                                                            ] )
                                                      ; ( "29"
                                                        , `Assoc
                                                            [ ( "name"
                                                              , `String
                                                                  "constant.numeric.hexadecimal.go"
                                                              )
                                                            ] )
                                                      ; ( "30"
                                                        , `Assoc
                                                            [ ( "name"
                                                              , `String
                                                                  "constant.numeric.hexadecimal.go"
                                                              )
                                                            ; ( "patterns"
                                                              , `List
                                                                  [ `Assoc
                                                                      [ ( "match"
                                                                        , `String
                                                                            "(?<=[0-9a-fA-F])_(?=[0-9a-fA-F])"
                                                                        )
                                                                      ; ( "name"
                                                                        , `String
                                                                            "punctuation.separator.constant.numeric.go"
                                                                        )
                                                                      ]
                                                                  ] )
                                                            ] )
                                                      ; ( "31"
                                                        , `Assoc
                                                            [ ( "name"
                                                              , `String
                                                                  "punctuation.separator.constant.numeric.go"
                                                              )
                                                            ] )
                                                      ; ( "32"
                                                        , `Assoc
                                                            [ ( "name"
                                                              , `String
                                                                  "keyword.other.unit.exponent.hexadecimal.go"
                                                              )
                                                            ] )
                                                      ; ( "33"
                                                        , `Assoc
                                                            [ ( "name"
                                                              , `String
                                                                  "keyword.operator.plus.exponent.hexadecimal.go"
                                                              )
                                                            ] )
                                                      ; ( "34"
                                                        , `Assoc
                                                            [ ( "name"
                                                              , `String
                                                                  "keyword.operator.minus.exponent.hexadecimal.go"
                                                              )
                                                            ] )
                                                      ; ( "35"
                                                        , `Assoc
                                                            [ ( "name"
                                                              , `String
                                                                  "constant.numeric.exponent.hexadecimal.go"
                                                              )
                                                            ; ( "patterns"
                                                              , `List
                                                                  [ `Assoc
                                                                      [ ( "match"
                                                                        , `String
                                                                            "(?<=[0-9a-fA-F])_(?=[0-9a-fA-F])"
                                                                        )
                                                                      ; ( "name"
                                                                        , `String
                                                                            "punctuation.separator.constant.numeric.go"
                                                                        )
                                                                      ]
                                                                  ] )
                                                            ] )
                                                      ; ( "36"
                                                        , `Assoc
                                                            [ ( "name"
                                                              , `String
                                                                  "keyword.other.unit.imaginary.go"
                                                              )
                                                            ] )
                                                      ; ( "37"
                                                        , `Assoc
                                                            [ ( "name"
                                                              , `String
                                                                  "keyword.other.unit.hexadecimal.go"
                                                              )
                                                            ] )
                                                      ; ( "38"
                                                        , `Assoc
                                                            [ ( "name"
                                                              , `String
                                                                  "constant.numeric.hexadecimal.go"
                                                              )
                                                            ; ( "patterns"
                                                              , `List
                                                                  [ `Assoc
                                                                      [ ( "match"
                                                                        , `String
                                                                            "(?<=[0-9a-fA-F])_(?=[0-9a-fA-F])"
                                                                        )
                                                                      ; ( "name"
                                                                        , `String
                                                                            "punctuation.separator.constant.numeric.go"
                                                                        )
                                                                      ]
                                                                  ] )
                                                            ] )
                                                      ; ( "39"
                                                        , `Assoc
                                                            [ ( "name"
                                                              , `String
                                                                  "punctuation.separator.constant.numeric.go"
                                                              )
                                                            ] )
                                                      ; ( "40"
                                                        , `Assoc
                                                            [ ( "name"
                                                              , `String
                                                                  "keyword.other.unit.exponent.hexadecimal.go"
                                                              )
                                                            ] )
                                                      ; ( "41"
                                                        , `Assoc
                                                            [ ( "name"
                                                              , `String
                                                                  "keyword.operator.plus.exponent.hexadecimal.go"
                                                              )
                                                            ] )
                                                      ; ( "42"
                                                        , `Assoc
                                                            [ ( "name"
                                                              , `String
                                                                  "keyword.operator.minus.exponent.hexadecimal.go"
                                                              )
                                                            ] )
                                                      ; ( "43"
                                                        , `Assoc
                                                            [ ( "name"
                                                              , `String
                                                                  "constant.numeric.exponent.hexadecimal.go"
                                                              )
                                                            ; ( "patterns"
                                                              , `List
                                                                  [ `Assoc
                                                                      [ ( "match"
                                                                        , `String
                                                                            "(?<=[0-9a-fA-F])_(?=[0-9a-fA-F])"
                                                                        )
                                                                      ; ( "name"
                                                                        , `String
                                                                            "punctuation.separator.constant.numeric.go"
                                                                        )
                                                                      ]
                                                                  ] )
                                                            ] )
                                                      ; ( "44"
                                                        , `Assoc
                                                            [ ( "name"
                                                              , `String
                                                                  "keyword.other.unit.imaginary.go"
                                                              )
                                                            ] )
                                                      ; ( "45"
                                                        , `Assoc
                                                            [ ( "name"
                                                              , `String
                                                                  "keyword.other.unit.hexadecimal.go"
                                                              )
                                                            ] )
                                                      ; ( "46"
                                                        , `Assoc
                                                            [ ( "name"
                                                              , `String
                                                                  "constant.numeric.hexadecimal.go"
                                                              )
                                                            ] )
                                                      ; ( "47"
                                                        , `Assoc
                                                            [ ( "name"
                                                              , `String
                                                                  "constant.numeric.hexadecimal.go"
                                                              )
                                                            ; ( "patterns"
                                                              , `List
                                                                  [ `Assoc
                                                                      [ ( "match"
                                                                        , `String
                                                                            "(?<=[0-9a-fA-F])_(?=[0-9a-fA-F])"
                                                                        )
                                                                      ; ( "name"
                                                                        , `String
                                                                            "punctuation.separator.constant.numeric.go"
                                                                        )
                                                                      ]
                                                                  ] )
                                                            ] )
                                                      ; ( "48"
                                                        , `Assoc
                                                            [ ( "name"
                                                              , `String
                                                                  "punctuation.separator.constant.numeric.go"
                                                              )
                                                            ] )
                                                      ; ( "49"
                                                        , `Assoc
                                                            [ ( "name"
                                                              , `String
                                                                  "keyword.other.unit.exponent.hexadecimal.go"
                                                              )
                                                            ] )
                                                      ; ( "50"
                                                        , `Assoc
                                                            [ ( "name"
                                                              , `String
                                                                  "keyword.operator.plus.exponent.hexadecimal.go"
                                                              )
                                                            ] )
                                                      ; ( "51"
                                                        , `Assoc
                                                            [ ( "name"
                                                              , `String
                                                                  "keyword.operator.minus.exponent.hexadecimal.go"
                                                              )
                                                            ] )
                                                      ; ( "52"
                                                        , `Assoc
                                                            [ ( "name"
                                                              , `String
                                                                  "constant.numeric.exponent.hexadecimal.go"
                                                              )
                                                            ; ( "patterns"
                                                              , `List
                                                                  [ `Assoc
                                                                      [ ( "match"
                                                                        , `String
                                                                            "(?<=[0-9a-fA-F])_(?=[0-9a-fA-F])"
                                                                        )
                                                                      ; ( "name"
                                                                        , `String
                                                                            "punctuation.separator.constant.numeric.go"
                                                                        )
                                                                      ]
                                                                  ] )
                                                            ] )
                                                      ; ( "53"
                                                        , `Assoc
                                                            [ ( "name"
                                                              , `String
                                                                  "keyword.other.unit.imaginary.go"
                                                              )
                                                            ] )
                                                      ] )
                                                ]
                                            ; `Assoc
                                                [ ( "match"
                                                  , `String
                                                      "(?:(?:(?:\\G(?=[0-9.])(?!0[xXbBoO])([0-9](?:[0-9]|((?<=[0-9a-fA-F])_(?=[0-9a-fA-F])))*)(i(?!\\w))?(?:\\n|$)|(\\G0[bB])_?([01](?:[01]|((?<=[0-9a-fA-F])_(?=[0-9a-fA-F])))*)(i(?!\\w))?(?:\\n|$))|(\\G0[oO]?)_?((?:[0-7]|((?<=[0-9a-fA-F])_(?=[0-9a-fA-F])))+)(i(?!\\w))?(?:\\n|$))|(\\G0[xX])_?([0-9a-fA-F](?:[0-9a-fA-F]|((?<=[0-9a-fA-F])_(?=[0-9a-fA-F])))*)(i(?!\\w))?(?:\\n|$))"
                                                  )
                                                ; ( "captures"
                                                  , `Assoc
                                                      [ ( "1"
                                                        , `Assoc
                                                            [ ( "name"
                                                              , `String
                                                                  "constant.numeric.decimal.go"
                                                              )
                                                            ; ( "patterns"
                                                              , `List
                                                                  [ `Assoc
                                                                      [ ( "match"
                                                                        , `String
                                                                            "(?<=[0-9a-fA-F])_(?=[0-9a-fA-F])"
                                                                        )
                                                                      ; ( "name"
                                                                        , `String
                                                                            "punctuation.separator.constant.numeric.go"
                                                                        )
                                                                      ]
                                                                  ] )
                                                            ] )
                                                      ; ( "2"
                                                        , `Assoc
                                                            [ ( "name"
                                                              , `String
                                                                  "punctuation.separator.constant.numeric.go"
                                                              )
                                                            ] )
                                                      ; ( "3"
                                                        , `Assoc
                                                            [ ( "name"
                                                              , `String
                                                                  "keyword.other.unit.imaginary.go"
                                                              )
                                                            ] )
                                                      ; ( "4"
                                                        , `Assoc
                                                            [ ( "name"
                                                              , `String
                                                                  "keyword.other.unit.binary.go"
                                                              )
                                                            ] )
                                                      ; ( "5"
                                                        , `Assoc
                                                            [ ( "name"
                                                              , `String
                                                                  "constant.numeric.binary.go"
                                                              )
                                                            ; ( "patterns"
                                                              , `List
                                                                  [ `Assoc
                                                                      [ ( "match"
                                                                        , `String
                                                                            "(?<=[0-9a-fA-F])_(?=[0-9a-fA-F])"
                                                                        )
                                                                      ; ( "name"
                                                                        , `String
                                                                            "punctuation.separator.constant.numeric.go"
                                                                        )
                                                                      ]
                                                                  ] )
                                                            ] )
                                                      ; ( "6"
                                                        , `Assoc
                                                            [ ( "name"
                                                              , `String
                                                                  "punctuation.separator.constant.numeric.go"
                                                              )
                                                            ] )
                                                      ; ( "7"
                                                        , `Assoc
                                                            [ ( "name"
                                                              , `String
                                                                  "keyword.other.unit.imaginary.go"
                                                              )
                                                            ] )
                                                      ; ( "8"
                                                        , `Assoc
                                                            [ ( "name"
                                                              , `String
                                                                  "keyword.other.unit.octal.go"
                                                              )
                                                            ] )
                                                      ; ( "9"
                                                        , `Assoc
                                                            [ ( "name"
                                                              , `String
                                                                  "constant.numeric.octal.go"
                                                              )
                                                            ; ( "patterns"
                                                              , `List
                                                                  [ `Assoc
                                                                      [ ( "match"
                                                                        , `String
                                                                            "(?<=[0-9a-fA-F])_(?=[0-9a-fA-F])"
                                                                        )
                                                                      ; ( "name"
                                                                        , `String
                                                                            "punctuation.separator.constant.numeric.go"
                                                                        )
                                                                      ]
                                                                  ] )
                                                            ] )
                                                      ; ( "10"
                                                        , `Assoc
                                                            [ ( "name"
                                                              , `String
                                                                  "punctuation.separator.constant.numeric.go"
                                                              )
                                                            ] )
                                                      ; ( "11"
                                                        , `Assoc
                                                            [ ( "name"
                                                              , `String
                                                                  "keyword.other.unit.imaginary.go"
                                                              )
                                                            ] )
                                                      ; ( "12"
                                                        , `Assoc
                                                            [ ( "name"
                                                              , `String
                                                                  "keyword.other.unit.hexadecimal.go"
                                                              )
                                                            ] )
                                                      ; ( "13"
                                                        , `Assoc
                                                            [ ( "name"
                                                              , `String
                                                                  "constant.numeric.hexadecimal.go"
                                                              )
                                                            ; ( "patterns"
                                                              , `List
                                                                  [ `Assoc
                                                                      [ ( "match"
                                                                        , `String
                                                                            "(?<=[0-9a-fA-F])_(?=[0-9a-fA-F])"
                                                                        )
                                                                      ; ( "name"
                                                                        , `String
                                                                            "punctuation.separator.constant.numeric.go"
                                                                        )
                                                                      ]
                                                                  ] )
                                                            ] )
                                                      ; ( "14"
                                                        , `Assoc
                                                            [ ( "name"
                                                              , `String
                                                                  "punctuation.separator.constant.numeric.go"
                                                              )
                                                            ] )
                                                      ; ( "15"
                                                        , `Assoc
                                                            [ ( "name"
                                                              , `String
                                                                  "keyword.other.unit.imaginary.go"
                                                              )
                                                            ] )
                                                      ] )
                                                ]
                                            ; `Assoc
                                                [ ( "match"
                                                  , `String
                                                      "(?:(?:[0-9a-zA-Z_\\.])|(?<=[eEpP])[+-])+"
                                                  )
                                                ; ( "name"
                                                  , `String
                                                      "invalid.illegal.constant.numeric.go"
                                                  )
                                                ]
                                            ] )
                                      ]
                                  ] )
                            ] )
                      ] )
                ] )
          ; ( "terminators"
            , `Assoc
                [ "comment", `String "Terminators"
                ; "match", `String ";"
                ; "name", `String "punctuation.terminator.go"
                ] )
          ; ( "package_name"
            , `Assoc
                [ ( "patterns"
                  , `List
                      [ `Assoc
                          [ "comment", `String "package name"
                          ; "begin", `String "\\b(package)\\s+"
                          ; ( "beginCaptures"
                            , `Assoc
                                [ "1", `Assoc [ "name", `String "keyword.package.go" ] ] )
                          ; "end", `String "(?!\\G)"
                          ; ( "patterns"
                            , `List
                                [ `Assoc
                                    [ "match", `String "\\d\\w*"
                                    ; "name", `String "invalid.illegal.identifier.go"
                                    ]
                                ; `Assoc
                                    [ "match", `String "\\w+"
                                    ; "name", `String "entity.name.type.package.go"
                                    ]
                                ] )
                          ]
                      ] )
                ] )
          ; ( "import"
            , `Assoc
                [ "comment", `String "import"
                ; ( "patterns"
                  , `List
                      [ `Assoc
                          [ "comment", `String "import"
                          ; "begin", `String "\\b(import)\\s+"
                          ; ( "beginCaptures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc [ "name", `String "keyword.control.import.go" ]
                                  )
                                ] )
                          ; "end", `String "(?!\\G)"
                          ; "patterns", `List [ `Assoc [ "include", `String "#imports" ] ]
                          ]
                      ] )
                ] )
          ; ( "imports"
            , `Assoc
                [ "comment", `String "import package(s)"
                ; ( "patterns"
                  , `List
                      [ `Assoc
                          [ "match", `String "(\\s*[\\w\\.]+)?\\s*((\")([^\"]*)(\"))"
                          ; ( "captures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ ( "patterns"
                                        , `List
                                            [ `Assoc [ "include", `String "#delimiters" ]
                                            ; `Assoc
                                                [ "match", `String "\\w+"
                                                ; ( "name"
                                                  , `String "variable.other.import.go" )
                                                ]
                                            ] )
                                      ] )
                                ; ( "2"
                                  , `Assoc [ "name", `String "string.quoted.double.go" ] )
                                ; ( "3"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.definition.string.begin.go"
                                        )
                                      ] )
                                ; "4", `Assoc [ "name", `String "entity.name.import.go" ]
                                ; ( "5"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.definition.string.end.go" )
                                      ] )
                                ] )
                          ]
                      ; `Assoc
                          [ "begin", `String "\\("
                          ; ( "beginCaptures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "name"
                                        , `String
                                            "punctuation.definition.imports.begin.bracket.round.go"
                                        )
                                      ] )
                                ] )
                          ; "end", `String "\\)"
                          ; ( "endCaptures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "name"
                                        , `String
                                            "punctuation.definition.imports.end.bracket.round.go"
                                        )
                                      ] )
                                ] )
                          ; ( "patterns"
                            , `List
                                [ `Assoc [ "include", `String "#comments" ]
                                ; `Assoc [ "include", `String "#imports" ]
                                ] )
                          ]
                      ; `Assoc [ "include", `String "$self" ]
                      ] )
                ] )
          ; ( "function_declaration"
            , `Assoc
                [ "comment", `String "Function declarations"
                ; ( "begin"
                  , `String
                      "(?:^(\\bfunc\\b)(?:\\s*(\\([^\\)]+\\)\\s*)?(?:(\\w+)(?=\\(|\\[))?))"
                  )
                ; ( "beginCaptures"
                  , `Assoc
                      [ "1", `Assoc [ "name", `String "keyword.function.go" ]
                      ; ( "2"
                        , `Assoc
                            [ ( "patterns"
                              , `List
                                  [ `Assoc
                                      [ "begin", `String "\\("
                                      ; ( "beginCaptures"
                                        , `Assoc
                                            [ ( "0"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "punctuation.definition.begin.bracket.round.go"
                                                    )
                                                  ] )
                                            ] )
                                      ; "end", `String "\\)"
                                      ; ( "endCaptures"
                                        , `Assoc
                                            [ ( "0"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "punctuation.definition.end.bracket.round.go"
                                                    )
                                                  ] )
                                            ] )
                                      ; ( "patterns"
                                        , `List
                                            [ `Assoc
                                                [ ( "match"
                                                  , `String
                                                      "(?:(\\w+(?:\\s+))?((?:[\\w\\.\\*]+)(?:\\[(?:(?:(?:[\\w\\.\\*]+)(?:\\,\\s+)?)+)?\\])?))"
                                                  )
                                                ; ( "captures"
                                                  , `Assoc
                                                      [ ( "1"
                                                        , `Assoc
                                                            [ ( "name"
                                                              , `String
                                                                  "variable.parameter.go"
                                                              )
                                                            ] )
                                                      ; ( "2"
                                                        , `Assoc
                                                            [ ( "patterns"
                                                              , `List
                                                                  [ `Assoc
                                                                      [ ( "include"
                                                                        , `String
                                                                            "#type-declarations-without-brackets"
                                                                        )
                                                                      ]
                                                                  ; `Assoc
                                                                      [ ( "include"
                                                                        , `String
                                                                            "#parameter-variable-types"
                                                                        )
                                                                      ]
                                                                  ; `Assoc
                                                                      [ ( "match"
                                                                        , `String "\\w+" )
                                                                      ; ( "name"
                                                                        , `String
                                                                            "entity.name.type.go"
                                                                        )
                                                                      ]
                                                                  ] )
                                                            ] )
                                                      ] )
                                                ]
                                            ; `Assoc [ "include", `String "$self" ]
                                            ] )
                                      ]
                                  ] )
                            ] )
                      ; ( "3"
                        , `Assoc
                            [ ( "patterns"
                              , `List
                                  [ `Assoc
                                      [ "match", `String "\\d\\w*"
                                      ; "name", `String "invalid.illegal.identifier.go"
                                      ]
                                  ; `Assoc
                                      [ "match", `String "\\w+"
                                      ; "name", `String "entity.name.function.go"
                                      ]
                                  ] )
                            ] )
                      ] )
                ; ( "end"
                  , `String
                      "(?:(?<=\\))\\s*((?:(?:(?:[\\*\\[\\]]+)?(?:\\<\\-\\s*)?\\bchan\\b(?:\\s*\\<\\-)?\\s*)+)?(?!(?:[\\[\\]\\*]+)?(?:\\bstruct\\b|\\binterface\\b))[\\w\\.\\-\\*\\[\\]]+)?\\s*(?=\\{))"
                  )
                ; ( "endCaptures"
                  , `Assoc
                      [ ( "1"
                        , `Assoc
                            [ ( "patterns"
                              , `List
                                  [ `Assoc
                                      [ ( "include"
                                        , `String "#type-declarations-without-brackets" )
                                      ]
                                  ; `Assoc
                                      [ "include", `String "#parameter-variable-types" ]
                                  ; `Assoc
                                      [ "match", `String "\\w+"
                                      ; "name", `String "entity.name.type.go"
                                      ]
                                  ] )
                            ] )
                      ] )
                ; ( "patterns"
                  , `List
                      [ `Assoc
                          [ "begin", `String "\\("
                          ; ( "beginCaptures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "name"
                                        , `String
                                            "punctuation.definition.begin.bracket.round.go"
                                        )
                                      ] )
                                ] )
                          ; "end", `String "\\)"
                          ; ( "endCaptures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "name"
                                        , `String
                                            "punctuation.definition.end.bracket.round.go"
                                        )
                                      ] )
                                ] )
                          ; ( "patterns"
                            , `List
                                [ `Assoc [ "include", `String "#function_param_types" ] ]
                            )
                          ]
                      ; `Assoc
                          [ "begin", `String "([\\w\\.\\*]+)?(\\[)"
                          ; ( "beginCaptures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ ( "patterns"
                                        , `List
                                            [ `Assoc
                                                [ "include", `String "#type-declarations"
                                                ]
                                            ; `Assoc
                                                [ "match", `String "\\w+"
                                                ; "name", `String "entity.name.type.go"
                                                ]
                                            ] )
                                      ] )
                                ; ( "2"
                                  , `Assoc
                                      [ ( "name"
                                        , `String
                                            "punctuation.definition.begin.bracket.square.go"
                                        )
                                      ] )
                                ] )
                          ; "end", `String "\\]"
                          ; ( "endCaptures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "name"
                                        , `String
                                            "punctuation.definition.end.bracket.square.go"
                                        )
                                      ] )
                                ] )
                          ; ( "patterns"
                            , `List
                                [ `Assoc [ "include", `String "#generic_param_types" ] ] )
                          ]
                      ; `Assoc
                          [ ( "comment"
                            , `String
                                "single function as a type returned type(s) declaration" )
                          ; ( "match"
                            , `String
                                "(?:(?<=\\))(?:\\s*)((?:(?:\\s*(?:[\\*\\[\\]]+)?(?:\\<\\-\\s*)?\\bchan\\b(?:\\s*\\<\\-)?\\s*)+)?[\\w\\*\\.\\[\\]\\<\\>\\-]+(?:\\s*)(?:\\/(?:\\/|\\*).*)?)$)"
                            )
                          ; ( "captures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ ( "patterns"
                                        , `List
                                            [ `Assoc
                                                [ ( "include"
                                                  , `String
                                                      "#type-declarations-without-brackets"
                                                  )
                                                ]
                                            ; `Assoc
                                                [ ( "include"
                                                  , `String "#parameter-variable-types" )
                                                ]
                                            ; `Assoc
                                                [ "match", `String "\\w+"
                                                ; "name", `String "entity.name.type.go"
                                                ]
                                            ] )
                                      ] )
                                ] )
                          ]
                      ; `Assoc [ "include", `String "$self" ]
                      ] )
                ] )
          ; ( "function_param_types"
            , `Assoc
                [ "comment", `String "function parameter variables and types"
                ; ( "patterns"
                  , `List
                      [ `Assoc [ "include", `String "#struct_variables_types" ]
                      ; `Assoc [ "include", `String "#interface_variables_types" ]
                      ; `Assoc
                          [ "include", `String "#type-declarations-without-brackets" ]
                      ; `Assoc
                          [ "comment", `String "struct/interface type declaration"
                          ; ( "match"
                            , `String
                                "((?:(?:\\b\\w+\\,\\s*)+)?\\b\\w+)\\s+(?=(?:(?:\\s*(?:[\\*\\[\\]]+)?(?:\\<\\-\\s*)?\\bchan\\b(?:\\s*\\<\\-)?\\s*)+)?(?:[\\[\\]\\*]+)?\\b(?:struct|interface)\\b\\s*\\{)"
                            )
                          ; ( "captures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ ( "patterns"
                                        , `List
                                            [ `Assoc
                                                [ "include", `String "#type-declarations"
                                                ]
                                            ; `Assoc
                                                [ "match", `String "\\w+"
                                                ; "name", `String "variable.parameter.go"
                                                ]
                                            ] )
                                      ] )
                                ] )
                          ]
                      ; `Assoc
                          [ ( "comment"
                            , `String "multiple parameters one type -with multilines" )
                          ; ( "match"
                            , `String
                                "(?:(?:(?<=\\()|^\\s*)((?:(?:\\b\\w+\\,\\s*)+)(?:/(?:/|\\*).*)?)$)"
                            )
                          ; ( "captures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ ( "patterns"
                                        , `List
                                            [ `Assoc
                                                [ "include", `String "#type-declarations"
                                                ]
                                            ; `Assoc
                                                [ "match", `String "\\w+"
                                                ; "name", `String "variable.parameter.go"
                                                ]
                                            ] )
                                      ] )
                                ] )
                          ]
                      ; `Assoc
                          [ ( "comment"
                            , `String
                                "multiple params and types | multiple params one type | \
                                 one param one type" )
                          ; ( "match"
                            , `String
                                "(?:((?:(?:\\b\\w+\\,\\s*)+)?\\b\\w+)(?:\\s+)((?:(?:\\s*(?:[\\*\\[\\]]+)?(?:\\<\\-\\s*)?\\bchan\\b(?:\\s*\\<\\-)?\\s*)+)?(?:(?:(?:[\\w\\[\\]\\.\\*]+)?(?:(?:\\bfunc\\b\\((?:[^\\)]+)?\\))(?:(?:\\s*(?:[\\*\\[\\]]+)?(?:\\<\\-\\s*)?\\bchan\\b(?:\\s*\\<\\-)?\\s*)+)?(?:\\s*))+(?:(?:(?:[\\w\\*\\.\\[\\]]+)|(?:\\((?:[^\\)]+)?\\))))?)|(?:(?:[\\[\\]\\*]+)?[\\w\\*\\.]+(?:\\[(?:[^\\]]+)\\])?(?:[\\w\\.\\*]+)?)+)))"
                            )
                          ; ( "captures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ ( "patterns"
                                        , `List
                                            [ `Assoc [ "include", `String "#delimiters" ]
                                            ; `Assoc
                                                [ "match", `String "\\w+"
                                                ; "name", `String "variable.parameter.go"
                                                ]
                                            ] )
                                      ] )
                                ; ( "2"
                                  , `Assoc
                                      [ ( "patterns"
                                        , `List
                                            [ `Assoc
                                                [ ( "include"
                                                  , `String
                                                      "#type-declarations-without-brackets"
                                                  )
                                                ]
                                            ; `Assoc
                                                [ ( "include"
                                                  , `String "#parameter-variable-types" )
                                                ]
                                            ; `Assoc
                                                [ "match", `String "\\w+"
                                                ; "name", `String "entity.name.type.go"
                                                ]
                                            ] )
                                      ] )
                                ] )
                          ]
                      ; `Assoc
                          [ "begin", `String "([\\w\\.\\*]+)?(\\[)"
                          ; ( "beginCaptures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ ( "patterns"
                                        , `List
                                            [ `Assoc
                                                [ "include", `String "#type-declarations"
                                                ]
                                            ; `Assoc
                                                [ "match", `String "\\w+"
                                                ; "name", `String "entity.name.type.go"
                                                ]
                                            ] )
                                      ] )
                                ; ( "2"
                                  , `Assoc
                                      [ ( "name"
                                        , `String
                                            "punctuation.definition.begin.bracket.square.go"
                                        )
                                      ] )
                                ] )
                          ; "end", `String "\\]"
                          ; ( "endCaptures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "name"
                                        , `String
                                            "punctuation.definition.end.bracket.square.go"
                                        )
                                      ] )
                                ] )
                          ; ( "patterns"
                            , `List
                                [ `Assoc [ "include", `String "#generic_param_types" ] ] )
                          ]
                      ; `Assoc
                          [ "begin", `String "\\("
                          ; ( "beginCaptures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "name"
                                        , `String
                                            "punctuation.definition.begin.bracket.round.go"
                                        )
                                      ] )
                                ] )
                          ; "end", `String "\\)"
                          ; ( "endCaptures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "name"
                                        , `String
                                            "punctuation.definition.end.bracket.round.go"
                                        )
                                      ] )
                                ] )
                          ; ( "patterns"
                            , `List
                                [ `Assoc [ "include", `String "#function_param_types" ] ]
                            )
                          ]
                      ; `Assoc
                          [ "comment", `String "other types"
                          ; "match", `String "([\\w\\.]+)"
                          ; ( "captures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ ( "patterns"
                                        , `List
                                            [ `Assoc
                                                [ "include", `String "#type-declarations"
                                                ]
                                            ; `Assoc
                                                [ "match", `String "\\w+"
                                                ; "name", `String "entity.name.type.go"
                                                ]
                                            ] )
                                      ] )
                                ] )
                          ]
                      ; `Assoc [ "include", `String "$self" ]
                      ] )
                ] )
          ; ( "generic_param_types"
            , `Assoc
                [ "comment", `String "generic parameter variables and types"
                ; ( "patterns"
                  , `List
                      [ `Assoc [ "include", `String "#struct_variables_types" ]
                      ; `Assoc [ "include", `String "#interface_variables_types" ]
                      ; `Assoc
                          [ "include", `String "#type-declarations-without-brackets" ]
                      ; `Assoc
                          [ "comment", `String "struct/interface type declaration"
                          ; ( "match"
                            , `String
                                "((?:(?:\\b\\w+\\,\\s*)+)?\\b\\w+)\\s+(?=(?:(?:\\s*(?:[\\*\\[\\]]+)?(?:\\<\\-\\s*)?\\bchan\\b(?:\\s*\\<\\-)?\\s*)+)?(?:[\\[\\]\\*]+)?\\b(?:struct|interface)\\b\\s*\\{)"
                            )
                          ; ( "captures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ ( "patterns"
                                        , `List
                                            [ `Assoc
                                                [ "include", `String "#type-declarations"
                                                ]
                                            ; `Assoc
                                                [ "match", `String "\\w+"
                                                ; "name", `String "variable.parameter.go"
                                                ]
                                            ] )
                                      ] )
                                ] )
                          ]
                      ; `Assoc
                          [ ( "comment"
                            , `String "multiple parameters one type -with multilines" )
                          ; ( "match"
                            , `String
                                "(?:(?:(?<=\\()|^\\s*)((?:(?:\\b\\w+\\,\\s*)+)(?:/(?:/|\\*).*)?)$)"
                            )
                          ; ( "captures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ ( "patterns"
                                        , `List
                                            [ `Assoc
                                                [ "include", `String "#type-declarations"
                                                ]
                                            ; `Assoc
                                                [ "match", `String "\\w+"
                                                ; "name", `String "variable.parameter.go"
                                                ]
                                            ] )
                                      ] )
                                ] )
                          ]
                      ; `Assoc
                          [ ( "comment"
                            , `String
                                "multiple params and types | multiple types one param" )
                          ; ( "match"
                            , `String
                                "(?:((?:(?:\\b\\w+\\,\\s*)+)?\\b\\w+)(?:\\s+)((?:(?:\\s*(?:[\\*\\[\\]]+)?(?:\\<\\-\\s*)?\\bchan\\b(?:\\s*\\<\\-)?\\s*)+)?(?:(?:(?:[\\w\\[\\]\\.\\*]+)?(?:(?:\\bfunc\\b\\((?:[^\\)]+)?\\))(?:(?:\\s*(?:[\\*\\[\\]]+)?(?:\\<\\-\\s*)?\\bchan\\b(?:\\s*\\<\\-)?\\s*)+)?(?:\\s*))+(?:(?:(?:[\\w\\*\\.]+)|(?:\\((?:[^\\)]+)?\\))))?)|(?:(?:(?:[\\w\\*\\.\\~]+)|(?:\\[(?:(?:[\\w\\.\\*]+)?(?:\\[(?:[^\\]]+)?\\])?(?:\\,\\s+)?)+\\]))(?:[\\w\\.\\*]+)?)+)))"
                            )
                          ; ( "captures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ ( "patterns"
                                        , `List
                                            [ `Assoc [ "include", `String "#delimiters" ]
                                            ; `Assoc
                                                [ "match", `String "\\w+"
                                                ; "name", `String "variable.parameter.go"
                                                ]
                                            ] )
                                      ] )
                                ; ( "2"
                                  , `Assoc
                                      [ ( "patterns"
                                        , `List
                                            [ `Assoc
                                                [ ( "include"
                                                  , `String
                                                      "#type-declarations-without-brackets"
                                                  )
                                                ]
                                            ; `Assoc
                                                [ ( "include"
                                                  , `String "#parameter-variable-types" )
                                                ]
                                            ; `Assoc
                                                [ "match", `String "\\w+"
                                                ; "name", `String "entity.name.type.go"
                                                ]
                                            ] )
                                      ] )
                                ; ( "3"
                                  , `Assoc
                                      [ ( "patterns"
                                        , `List
                                            [ `Assoc
                                                [ "include", `String "#type-declarations"
                                                ]
                                            ; `Assoc
                                                [ "match", `String "\\w+"
                                                ; "name", `String "entity.name.type.go"
                                                ]
                                            ] )
                                      ] )
                                ] )
                          ]
                      ; `Assoc
                          [ "begin", `String "([\\w\\.\\*]+)?(\\[)"
                          ; ( "beginCaptures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ ( "patterns"
                                        , `List
                                            [ `Assoc
                                                [ "include", `String "#type-declarations"
                                                ]
                                            ; `Assoc
                                                [ "match", `String "\\w+"
                                                ; "name", `String "entity.name.type.go"
                                                ]
                                            ] )
                                      ] )
                                ; ( "2"
                                  , `Assoc
                                      [ ( "name"
                                        , `String
                                            "punctuation.definition.begin.bracket.square.go"
                                        )
                                      ] )
                                ] )
                          ; "end", `String "\\]"
                          ; ( "endCaptures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "name"
                                        , `String
                                            "punctuation.definition.end.bracket.square.go"
                                        )
                                      ] )
                                ] )
                          ; ( "patterns"
                            , `List
                                [ `Assoc [ "include", `String "#generic_param_types" ] ] )
                          ]
                      ; `Assoc
                          [ "begin", `String "\\("
                          ; ( "beginCaptures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "name"
                                        , `String
                                            "punctuation.definition.begin.bracket.round.go"
                                        )
                                      ] )
                                ] )
                          ; "end", `String "\\)"
                          ; ( "endCaptures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "name"
                                        , `String
                                            "punctuation.definition.end.bracket.round.go"
                                        )
                                      ] )
                                ] )
                          ; ( "patterns"
                            , `List
                                [ `Assoc [ "include", `String "#function_param_types" ] ]
                            )
                          ]
                      ; `Assoc
                          [ "comment", `String "other types"
                          ; "match", `String "\\b([\\w\\.]+)"
                          ; ( "captures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ ( "patterns"
                                        , `List
                                            [ `Assoc
                                                [ "include", `String "#type-declarations"
                                                ]
                                            ; `Assoc
                                                [ "match", `String "\\w+"
                                                ; "name", `String "entity.name.type.go"
                                                ]
                                            ] )
                                      ] )
                                ] )
                          ]
                      ; `Assoc [ "include", `String "$self" ]
                      ] )
                ] )
          ; ( "functions"
            , `Assoc
                [ "comment", `String "Functions"
                ; "begin", `String "(\\bfunc\\b)(?=\\()"
                ; ( "beginCaptures"
                  , `Assoc [ "1", `Assoc [ "name", `String "keyword.function.go" ] ] )
                ; ( "end"
                  , `String
                      "(?:(?<=\\))(\\s*(?:(?:[\\*\\[\\]]+)?(?:\\<\\-\\s*)?\\bchan\\b(?:\\s*\\<\\-)?\\s*)+)?((?:(?:\\s*(?:(?:[\\[\\]\\*]+)?[\\w\\.\\*]+)?(?:(?:\\[(?:(?:[\\w\\.\\*]+)?(?:\\[(?:[^\\]]+)?\\])?(?:\\,\\s+)?)+\\])|(?:\\((?:[^\\)]+)?\\)))?(?:[\\w\\.\\*]+)?)(?:\\s*)(?=\\{))|(?:\\s*(?:(?:(?:[\\[\\]\\*]+)?(?!\\bfunc\\b)(?:[\\w\\.\\*]+)(?:\\[(?:(?:[\\w\\.\\*]+)?(?:\\[(?:[^\\]]+)?\\])?(?:\\,\\s+)?)+\\])?(?:[\\w\\.\\*]+)?)|(?:\\((?:[^\\)]+)?\\)))))?)"
                  )
                ; ( "endCaptures"
                  , `Assoc
                      [ ( "1"
                        , `Assoc
                            [ ( "patterns"
                              , `List
                                  [ `Assoc [ "include", `String "#type-declarations" ] ] )
                            ] )
                      ; ( "2"
                        , `Assoc
                            [ ( "patterns"
                              , `List
                                  [ `Assoc
                                      [ ( "include"
                                        , `String "#type-declarations-without-brackets" )
                                      ]
                                  ; `Assoc
                                      [ "include", `String "#parameter-variable-types" ]
                                  ; `Assoc
                                      [ "match", `String "\\w+"
                                      ; "name", `String "entity.name.type.go"
                                      ]
                                  ] )
                            ] )
                      ] )
                ; ( "patterns"
                  , `List [ `Assoc [ "include", `String "#parameter-variable-types" ] ] )
                ] )
          ; ( "functions_inline"
            , `Assoc
                [ "comment", `String "functions in-line with multi return types"
                ; ( "match"
                  , `String
                      "(?:(\\bfunc\\b)((?:\\((?:[^/]*?)\\))(?:\\s+)(?:\\((?:[^/]*?)\\)))(?:\\s+)(?=\\{))"
                  )
                ; ( "captures"
                  , `Assoc
                      [ "1", `Assoc [ "name", `String "keyword.function.go" ]
                      ; ( "2"
                        , `Assoc
                            [ ( "patterns"
                              , `List
                                  [ `Assoc
                                      [ ( "include"
                                        , `String "#type-declarations-without-brackets" )
                                      ]
                                  ; `Assoc
                                      [ "begin", `String "\\("
                                      ; ( "beginCaptures"
                                        , `Assoc
                                            [ ( "0"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "punctuation.definition.begin.bracket.round.go"
                                                    )
                                                  ] )
                                            ] )
                                      ; "end", `String "\\)"
                                      ; ( "endCaptures"
                                        , `Assoc
                                            [ ( "0"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "punctuation.definition.end.bracket.round.go"
                                                    )
                                                  ] )
                                            ] )
                                      ; ( "patterns"
                                        , `List
                                            [ `Assoc
                                                [ ( "include"
                                                  , `String "#function_param_types" )
                                                ]
                                            ; `Assoc [ "include", `String "$self" ]
                                            ] )
                                      ]
                                  ; `Assoc
                                      [ "match", `String "\\["
                                      ; ( "name"
                                        , `String
                                            "punctuation.definition.begin.bracket.square.go"
                                        )
                                      ]
                                  ; `Assoc
                                      [ "match", `String "\\]"
                                      ; ( "name"
                                        , `String
                                            "punctuation.definition.end.bracket.square.go"
                                        )
                                      ]
                                  ; `Assoc
                                      [ "match", `String "\\{"
                                      ; ( "name"
                                        , `String
                                            "punctuation.definition.begin.bracket.curly.go"
                                        )
                                      ]
                                  ; `Assoc
                                      [ "match", `String "\\}"
                                      ; ( "name"
                                        , `String
                                            "punctuation.definition.end.bracket.curly.go"
                                        )
                                      ]
                                  ; `Assoc
                                      [ "match", `String "\\w+"
                                      ; "name", `String "entity.name.type.go"
                                      ]
                                  ] )
                            ] )
                      ] )
                ] )
          ; ( "support_functions"
            , `Assoc
                [ "comment", `String "Support Functions"
                ; ( "match"
                  , `String
                      "(?:(?:((?<=\\.)\\b\\w+)|(\\b\\w+))(?<brackets>\\[(?:[^\\[\\]]|\\g<brackets>)*\\])?(?=\\())"
                  )
                ; ( "captures"
                  , `Assoc
                      [ "1", `Assoc [ "name", `String "entity.name.function.support.go" ]
                      ; ( "2"
                        , `Assoc
                            [ ( "patterns"
                              , `List
                                  [ `Assoc [ "include", `String "#type-declarations" ]
                                  ; `Assoc
                                      [ "match", `String "\\d\\w*"
                                      ; "name", `String "invalid.illegal.identifier.go"
                                      ]
                                  ; `Assoc
                                      [ "match", `String "\\w+"
                                      ; "name", `String "entity.name.function.support.go"
                                      ]
                                  ] )
                            ] )
                      ; ( "3"
                        , `Assoc
                            [ ( "patterns"
                              , `List
                                  [ `Assoc
                                      [ ( "include"
                                        , `String "#type-declarations-without-brackets" )
                                      ]
                                  ; `Assoc
                                      [ "match", `String "\\["
                                      ; ( "name"
                                        , `String
                                            "punctuation.definition.begin.bracket.square.go"
                                        )
                                      ]
                                  ; `Assoc
                                      [ "match", `String "\\]"
                                      ; ( "name"
                                        , `String
                                            "punctuation.definition.end.bracket.square.go"
                                        )
                                      ]
                                  ; `Assoc
                                      [ "match", `String "\\{"
                                      ; ( "name"
                                        , `String
                                            "punctuation.definition.begin.bracket.curly.go"
                                        )
                                      ]
                                  ; `Assoc
                                      [ "match", `String "\\}"
                                      ; ( "name"
                                        , `String
                                            "punctuation.definition.end.bracket.curly.go"
                                        )
                                      ]
                                  ; `Assoc
                                      [ "match", `String "\\w+"
                                      ; "name", `String "entity.name.type.go"
                                      ]
                                  ] )
                            ] )
                      ] )
                ] )
          ; ( "other_struct_interface_expressions"
            , `Assoc
                [ ( "comment"
                  , `String
                      "struct and interface expression in-line (before curly bracket)" )
                ; ( "patterns"
                  , `List
                      [ `Assoc
                          [ ( "comment"
                            , `String
                                "after control variables must be added exactly here, do \
                                 not move it! (changing may not affect tests, so be \
                                 careful!)" )
                          ; "include", `String "#after_control_variables"
                          ]
                      ; `Assoc
                          [ ( "comment"
                            , `String
                                "uses a named group to recursively match generic type \
                                 with nested brackets, like 'Foo[A[B, C]]{}'" )
                          ; ( "match"
                            , `String
                                "\\b(?!struct\\b|interface\\b)([\\w\\.]+)(?<brackets>\\[(?:[^\\[\\]]|\\g<brackets>)*\\])?(?=\\{)"
                            )
                          ; ( "captures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ ( "patterns"
                                        , `List
                                            [ `Assoc
                                                [ "include", `String "#type-declarations"
                                                ]
                                            ; `Assoc
                                                [ "match", `String "\\w+"
                                                ; "name", `String "entity.name.type.go"
                                                ]
                                            ] )
                                      ] )
                                ; ( "2"
                                  , `Assoc
                                      [ ( "patterns"
                                        , `List
                                            [ `Assoc
                                                [ ( "include"
                                                  , `String
                                                      "#type-declarations-without-brackets"
                                                  )
                                                ]
                                            ; `Assoc
                                                [ "match", `String "\\["
                                                ; ( "name"
                                                  , `String
                                                      "punctuation.definition.begin.bracket.square.go"
                                                  )
                                                ]
                                            ; `Assoc
                                                [ "match", `String "\\]"
                                                ; ( "name"
                                                  , `String
                                                      "punctuation.definition.end.bracket.square.go"
                                                  )
                                                ]
                                            ; `Assoc
                                                [ "match", `String "\\{"
                                                ; ( "name"
                                                  , `String
                                                      "punctuation.definition.begin.bracket.curly.go"
                                                  )
                                                ]
                                            ; `Assoc
                                                [ "match", `String "\\}"
                                                ; ( "name"
                                                  , `String
                                                      "punctuation.definition.end.bracket.curly.go"
                                                  )
                                                ]
                                            ; `Assoc
                                                [ "match", `String "\\w+"
                                                ; "name", `String "entity.name.type.go"
                                                ]
                                            ] )
                                      ] )
                                ] )
                          ]
                      ] )
                ] )
          ; ( "type_assertion_inline"
            , `Assoc
                [ ( "comment"
                  , `String
                      "struct/interface types in-line (type assertion) | switch type \
                       keyword" )
                ; ( "match"
                  , `String
                      "(?:(?<=\\.\\()(?:(\\btype\\b)|((?:(?:\\s*(?:[\\*\\[\\]]+)?(?:\\<\\-\\s*)?\\bchan\\b(?:\\s*\\<\\-)?\\s*)+)?(?:[\\[\\]\\*]+)?(?:[\\w\\.]+)(?:\\[(?:(?:[\\w\\.\\*\\[\\]\\{\\}]+)(?:(?:\\,\\s*(?:[\\w\\.\\*\\[\\]\\{\\}]+))*))?\\])?))(?=\\)))"
                  )
                ; ( "captures"
                  , `Assoc
                      [ "1", `Assoc [ "name", `String "keyword.type.go" ]
                      ; ( "2"
                        , `Assoc
                            [ ( "patterns"
                              , `List
                                  [ `Assoc
                                      [ ( "include"
                                        , `String "#type-declarations-without-brackets" )
                                      ]
                                  ; `Assoc
                                      [ "match", `String "\\("
                                      ; ( "name"
                                        , `String
                                            "punctuation.definition.begin.bracket.round.go"
                                        )
                                      ]
                                  ; `Assoc
                                      [ "match", `String "\\)"
                                      ; ( "name"
                                        , `String
                                            "punctuation.definition.end.bracket.round.go"
                                        )
                                      ]
                                  ; `Assoc
                                      [ "match", `String "\\["
                                      ; ( "name"
                                        , `String
                                            "punctuation.definition.begin.bracket.square.go"
                                        )
                                      ]
                                  ; `Assoc
                                      [ "match", `String "\\]"
                                      ; ( "name"
                                        , `String
                                            "punctuation.definition.end.bracket.square.go"
                                        )
                                      ]
                                  ; `Assoc
                                      [ "match", `String "\\{"
                                      ; ( "name"
                                        , `String
                                            "punctuation.definition.begin.bracket.curly.go"
                                        )
                                      ]
                                  ; `Assoc
                                      [ "match", `String "\\}"
                                      ; ( "name"
                                        , `String
                                            "punctuation.definition.end.bracket.curly.go"
                                        )
                                      ]
                                  ; `Assoc
                                      [ "match", `String "\\w+"
                                      ; "name", `String "entity.name.type.go"
                                      ]
                                  ] )
                            ] )
                      ] )
                ] )
          ; ( "struct_variables_types"
            , `Assoc
                [ "comment", `String "Struct variable type"
                ; "begin", `String "(\\bstruct\\b)\\s*(\\{)"
                ; ( "beginCaptures"
                  , `Assoc
                      [ "1", `Assoc [ "name", `String "keyword.struct.go" ]
                      ; ( "2"
                        , `Assoc
                            [ ( "name"
                              , `String "punctuation.definition.begin.bracket.curly.go" )
                            ] )
                      ] )
                ; ( "patterns"
                  , `List
                      [ `Assoc [ "include", `String "#struct_variables_types_fields" ]
                      ; `Assoc [ "include", `String "$self" ]
                      ] )
                ; "end", `String "\\}"
                ; ( "endCaptures"
                  , `Assoc
                      [ ( "0"
                        , `Assoc
                            [ ( "name"
                              , `String "punctuation.definition.end.bracket.curly.go" )
                            ] )
                      ] )
                ] )
          ; ( "struct_variables_types_fields"
            , `Assoc
                [ "comment", `String "Struct variable type fields"
                ; ( "patterns"
                  , `List
                      [ `Assoc
                          [ "include", `String "#struct_variable_types_fields_multi" ]
                      ; `Assoc
                          [ "comment", `String "one line - single type"
                          ; ( "match"
                            , `String
                                "(?:(?<=\\{)\\s*((?:(?:\\s*(?:[\\*\\[\\]]+)?(?:\\<\\-\\s*)?\\bchan\\b(?:\\s*\\<\\-)?\\s*)+)?(?:[\\w\\.\\*\\[\\]]+))\\s*(?=\\}))"
                            )
                          ; ( "captures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ ( "patterns"
                                        , `List
                                            [ `Assoc
                                                [ "include", `String "#type-declarations"
                                                ]
                                            ; `Assoc
                                                [ "match", `String "\\w+"
                                                ; "name", `String "entity.name.type.go"
                                                ]
                                            ] )
                                      ] )
                                ] )
                          ]
                      ; `Assoc
                          [ "comment", `String "one line - property variables and types"
                          ; ( "match"
                            , `String
                                "(?:(?<=\\{)\\s*((?:(?:\\w+\\,\\s*)+)?(?:\\w+\\s+))((?:(?:\\s*(?:[\\*\\[\\]]+)?(?:\\<\\-\\s*)?\\bchan\\b(?:\\s*\\<\\-)?\\s*)+)?(?:[\\w\\.\\*\\[\\]]+))\\s*(?=\\}))"
                            )
                          ; ( "captures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ ( "patterns"
                                        , `List
                                            [ `Assoc
                                                [ "include", `String "#type-declarations"
                                                ]
                                            ; `Assoc
                                                [ "match", `String "\\w+"
                                                ; ( "name"
                                                  , `String "variable.other.property.go" )
                                                ]
                                            ] )
                                      ] )
                                ; ( "2"
                                  , `Assoc
                                      [ ( "patterns"
                                        , `List
                                            [ `Assoc
                                                [ "include", `String "#type-declarations"
                                                ]
                                            ; `Assoc
                                                [ "match", `String "\\w+"
                                                ; "name", `String "entity.name.type.go"
                                                ]
                                            ] )
                                      ] )
                                ] )
                          ]
                      ; `Assoc
                          [ ( "comment"
                            , `String
                                "one line with semicolon(;) without formatting gofmt - \
                                 single type | property variables and types" )
                          ; ( "match"
                            , `String
                                "(?:(?<=\\{)((?:\\s*(?:(?:(?:\\w+\\,\\s*)+)?(?:\\w+\\s+))?(?:(?:(?:\\s*(?:[\\*\\[\\]]+)?(?:\\<\\-\\s*)?\\bchan\\b(?:\\s*\\<\\-)?\\s*)+)?(?:[^\\s/]+)(?:\\;)?))+)\\s*(?=\\}))"
                            )
                          ; ( "captures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ ( "patterns"
                                        , `List
                                            [ `Assoc
                                                [ ( "match"
                                                  , `String
                                                      "(?:((?:(?:\\w+\\,\\s*)+)?(?:\\w+\\s+))?((?:(?:\\s*(?:[\\*\\[\\]]+)?(?:\\<\\-\\s*)?\\bchan\\b(?:\\s*\\<\\-)?\\s*)+)?(?:[^\\s/]+)(?:\\;)?))"
                                                  )
                                                ; ( "captures"
                                                  , `Assoc
                                                      [ ( "1"
                                                        , `Assoc
                                                            [ ( "patterns"
                                                              , `List
                                                                  [ `Assoc
                                                                      [ ( "include"
                                                                        , `String
                                                                            "#type-declarations"
                                                                        )
                                                                      ]
                                                                  ; `Assoc
                                                                      [ ( "match"
                                                                        , `String "\\w+" )
                                                                      ; ( "name"
                                                                        , `String
                                                                            "variable.other.property.go"
                                                                        )
                                                                      ]
                                                                  ] )
                                                            ] )
                                                      ; ( "2"
                                                        , `Assoc
                                                            [ ( "patterns"
                                                              , `List
                                                                  [ `Assoc
                                                                      [ ( "include"
                                                                        , `String
                                                                            "#type-declarations"
                                                                        )
                                                                      ]
                                                                  ; `Assoc
                                                                      [ ( "match"
                                                                        , `String "\\w+" )
                                                                      ; ( "name"
                                                                        , `String
                                                                            "entity.name.type.go"
                                                                        )
                                                                      ]
                                                                  ] )
                                                            ] )
                                                      ] )
                                                ]
                                            ] )
                                      ] )
                                ] )
                          ]
                      ; `Assoc
                          [ "comment", `String "one type only"
                          ; ( "match"
                            , `String
                                "(?:((?:(?:\\s*(?:[\\*\\[\\]]+)?(?:\\<\\-\\s*)?\\bchan\\b(?:\\s*\\<\\-)?\\s*)+)?(?:[\\w\\.\\*]+)\\s*)(?:(?=\\`|\\/|\")|$))"
                            )
                          ; ( "captures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ ( "patterns"
                                        , `List
                                            [ `Assoc
                                                [ "include", `String "#type-declarations"
                                                ]
                                            ; `Assoc
                                                [ "match", `String "\\w+"
                                                ; "name", `String "entity.name.type.go"
                                                ]
                                            ] )
                                      ] )
                                ] )
                          ]
                      ; `Assoc
                          [ "comment", `String "property variables and types"
                          ; ( "match"
                            , `String "(\\b\\w+(?:\\s*\\,\\s*\\b\\w+)*)\\s*([^\\`\"\\/]+)"
                            )
                          ; ( "captures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ ( "patterns"
                                        , `List
                                            [ `Assoc
                                                [ "include", `String "#type-declarations"
                                                ]
                                            ; `Assoc
                                                [ "match", `String "\\w+"
                                                ; ( "name"
                                                  , `String "variable.other.property.go" )
                                                ]
                                            ] )
                                      ] )
                                ; ( "2"
                                  , `Assoc
                                      [ ( "patterns"
                                        , `List
                                            [ `Assoc
                                                [ ( "include"
                                                  , `String
                                                      "#type-declarations-without-brackets"
                                                  )
                                                ]
                                            ; `Assoc
                                                [ ( "include"
                                                  , `String "#parameter-variable-types" )
                                                ]
                                            ; `Assoc
                                                [ "match", `String "\\w+"
                                                ; "name", `String "entity.name.type.go"
                                                ]
                                            ] )
                                      ] )
                                ] )
                          ]
                      ] )
                ] )
          ; ( "struct_variable_types_fields_multi"
            , `Assoc
                [ "comment", `String "struct variable and type fields with multi lines"
                ; ( "patterns"
                  , `List
                      [ `Assoc
                          [ "comment", `String "struct in struct types"
                          ; ( "begin"
                            , `String
                                "(?:((?:\\b\\w+(?:\\,\\s*\\b\\w+)*)(?:(?:\\s*(?:[\\*\\[\\]]+)?(?:\\<\\-\\s*)?\\bchan\\b(?:\\s*\\<\\-)?\\s*)+)?(?:\\s*)(?:[\\[\\]\\*]+)?)(\\bstruct\\b)(?:\\s*)(\\{))"
                            )
                          ; ( "beginCaptures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ ( "patterns"
                                        , `List
                                            [ `Assoc
                                                [ "include", `String "#type-declarations"
                                                ]
                                            ; `Assoc
                                                [ "match", `String "\\w+"
                                                ; ( "name"
                                                  , `String "variable.other.property.go" )
                                                ]
                                            ] )
                                      ] )
                                ; "2", `Assoc [ "name", `String "keyword.struct.go" ]
                                ; ( "3"
                                  , `Assoc
                                      [ ( "name"
                                        , `String
                                            "punctuation.definition.begin.bracket.curly.go"
                                        )
                                      ] )
                                ] )
                          ; "end", `String "\\}"
                          ; ( "endCaptures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "name"
                                        , `String
                                            "punctuation.definition.end.bracket.curly.go"
                                        )
                                      ] )
                                ] )
                          ; ( "patterns"
                            , `List
                                [ `Assoc
                                    [ "include", `String "#struct_variables_types_fields"
                                    ]
                                ; `Assoc [ "include", `String "$self" ]
                                ] )
                          ]
                      ; `Assoc
                          [ "comment", `String "interface in struct types"
                          ; ( "begin"
                            , `String
                                "(?:((?:\\b\\w+(?:\\,\\s*\\b\\w+)*)(?:(?:\\s*(?:[\\*\\[\\]]+)?(?:\\<\\-\\s*)?\\bchan\\b(?:\\s*\\<\\-)?\\s*)+)?(?:\\s*)(?:[\\[\\]\\*]+)?)(\\binterface\\b)(?:\\s*)(\\{))"
                            )
                          ; ( "beginCaptures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ ( "patterns"
                                        , `List
                                            [ `Assoc
                                                [ "include", `String "#type-declarations"
                                                ]
                                            ; `Assoc
                                                [ "match", `String "\\w+"
                                                ; ( "name"
                                                  , `String "variable.other.property.go" )
                                                ]
                                            ] )
                                      ] )
                                ; "2", `Assoc [ "name", `String "keyword.interface.go" ]
                                ; ( "3"
                                  , `Assoc
                                      [ ( "name"
                                        , `String
                                            "punctuation.definition.begin.bracket.curly.go"
                                        )
                                      ] )
                                ] )
                          ; "end", `String "\\}"
                          ; ( "endCaptures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "name"
                                        , `String
                                            "punctuation.definition.end.bracket.curly.go"
                                        )
                                      ] )
                                ] )
                          ; ( "patterns"
                            , `List
                                [ `Assoc
                                    [ ( "include"
                                      , `String "#interface_variables_types_field" )
                                    ]
                                ; `Assoc [ "include", `String "$self" ]
                                ] )
                          ]
                      ; `Assoc
                          [ "comment", `String "function in struct types"
                          ; ( "begin"
                            , `String
                                "(?:((?:\\b\\w+(?:\\,\\s*\\b\\w+)*)(?:(?:\\s*(?:[\\*\\[\\]]+)?(?:\\<\\-\\s*)?\\bchan\\b(?:\\s*\\<\\-)?\\s*)+)?(?:\\s*)(?:[\\[\\]\\*]+)?)(\\bfunc\\b)(?:\\s*)(\\())"
                            )
                          ; ( "beginCaptures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ ( "patterns"
                                        , `List
                                            [ `Assoc
                                                [ "include", `String "#type-declarations"
                                                ]
                                            ; `Assoc
                                                [ "match", `String "\\w+"
                                                ; ( "name"
                                                  , `String "variable.other.property.go" )
                                                ]
                                            ] )
                                      ] )
                                ; "2", `Assoc [ "name", `String "keyword.function.go" ]
                                ; ( "3"
                                  , `Assoc
                                      [ ( "name"
                                        , `String
                                            "punctuation.definition.begin.bracket.round.go"
                                        )
                                      ] )
                                ] )
                          ; "end", `String "\\)"
                          ; ( "endCaptures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "name"
                                        , `String
                                            "punctuation.definition.end.bracket.round.go"
                                        )
                                      ] )
                                ] )
                          ; ( "patterns"
                            , `List
                                [ `Assoc [ "include", `String "#function_param_types" ]
                                ; `Assoc [ "include", `String "$self" ]
                                ] )
                          ]
                      ; `Assoc [ "include", `String "#parameter-variable-types" ]
                      ] )
                ] )
          ; ( "interface_variables_types"
            , `Assoc
                [ "comment", `String "interface variable types"
                ; "begin", `String "(\\binterface\\b)\\s*(\\{)"
                ; ( "beginCaptures"
                  , `Assoc
                      [ "1", `Assoc [ "name", `String "keyword.interface.go" ]
                      ; ( "2"
                        , `Assoc
                            [ ( "name"
                              , `String "punctuation.definition.begin.bracket.curly.go" )
                            ] )
                      ] )
                ; ( "patterns"
                  , `List
                      [ `Assoc [ "include", `String "#interface_variables_types_field" ]
                      ; `Assoc [ "include", `String "$self" ]
                      ] )
                ; "end", `String "\\}"
                ; ( "endCaptures"
                  , `Assoc
                      [ ( "0"
                        , `Assoc
                            [ ( "name"
                              , `String "punctuation.definition.end.bracket.curly.go" )
                            ] )
                      ] )
                ] )
          ; ( "interface_variables_types_field"
            , `Assoc
                [ "comment", `String "interface variable type fields"
                ; ( "patterns"
                  , `List
                      [ `Assoc [ "include", `String "#support_functions" ]
                      ; `Assoc
                          [ "include", `String "#type-declarations-without-brackets" ]
                      ; `Assoc
                          [ "begin", `String "([\\w\\.\\*]+)?(\\[)"
                          ; ( "beginCaptures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ ( "patterns"
                                        , `List
                                            [ `Assoc
                                                [ "include", `String "#type-declarations"
                                                ]
                                            ; `Assoc
                                                [ "match", `String "\\w+"
                                                ; "name", `String "entity.name.type.go"
                                                ]
                                            ] )
                                      ] )
                                ; ( "2"
                                  , `Assoc
                                      [ ( "name"
                                        , `String
                                            "punctuation.definition.begin.bracket.square.go"
                                        )
                                      ] )
                                ] )
                          ; "end", `String "\\]"
                          ; ( "endCaptures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "name"
                                        , `String
                                            "punctuation.definition.end.bracket.square.go"
                                        )
                                      ] )
                                ] )
                          ; ( "patterns"
                            , `List
                                [ `Assoc [ "include", `String "#generic_param_types" ] ] )
                          ]
                      ; `Assoc
                          [ "begin", `String "\\("
                          ; ( "beginCaptures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "name"
                                        , `String
                                            "punctuation.definition.begin.bracket.round.go"
                                        )
                                      ] )
                                ] )
                          ; "end", `String "\\)"
                          ; ( "endCaptures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "name"
                                        , `String
                                            "punctuation.definition.end.bracket.round.go"
                                        )
                                      ] )
                                ] )
                          ; ( "patterns"
                            , `List
                                [ `Assoc [ "include", `String "#function_param_types" ] ]
                            )
                          ]
                      ; `Assoc
                          [ "comment", `String "other types"
                          ; "match", `String "([\\w\\.]+)"
                          ; ( "captures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ ( "patterns"
                                        , `List
                                            [ `Assoc
                                                [ "include", `String "#type-declarations"
                                                ]
                                            ; `Assoc
                                                [ "match", `String "\\w+"
                                                ; "name", `String "entity.name.type.go"
                                                ]
                                            ] )
                                      ] )
                                ] )
                          ]
                      ] )
                ] )
          ; ( "single_type"
            , `Assoc
                [ ( "patterns"
                  , `List
                      [ `Assoc
                          [ "comment", `String "single type declaration"
                          ; ( "match"
                            , `String
                                "(?:(?:^\\s*)(\\btype\\b)(?:\\s*)([\\w\\.\\*]+)(?:\\s+)(?!(?:\\=\\s*)?(?:[\\[\\]\\*]+)?\\b(?:struct|interface)\\b)([\\s\\S]+))"
                            )
                          ; ( "captures"
                            , `Assoc
                                [ "1", `Assoc [ "name", `String "keyword.type.go" ]
                                ; ( "2"
                                  , `Assoc
                                      [ ( "patterns"
                                        , `List
                                            [ `Assoc
                                                [ "include", `String "#type-declarations"
                                                ]
                                            ; `Assoc
                                                [ "match", `String "\\w+"
                                                ; "name", `String "entity.name.type.go"
                                                ]
                                            ] )
                                      ] )
                                ; ( "3"
                                  , `Assoc
                                      [ ( "patterns"
                                        , `List
                                            [ `Assoc
                                                [ "begin", `String "\\("
                                                ; ( "beginCaptures"
                                                  , `Assoc
                                                      [ ( "0"
                                                        , `Assoc
                                                            [ ( "name"
                                                              , `String
                                                                  "punctuation.definition.begin.bracket.round.go"
                                                              )
                                                            ] )
                                                      ] )
                                                ; "end", `String "\\)"
                                                ; ( "endCaptures"
                                                  , `Assoc
                                                      [ ( "0"
                                                        , `Assoc
                                                            [ ( "name"
                                                              , `String
                                                                  "punctuation.definition.end.bracket.round.go"
                                                              )
                                                            ] )
                                                      ] )
                                                ; ( "patterns"
                                                  , `List
                                                      [ `Assoc
                                                          [ ( "include"
                                                            , `String
                                                                "#function_param_types" )
                                                          ]
                                                      ; `Assoc
                                                          [ "include", `String "$self" ]
                                                      ] )
                                                ]
                                            ; `Assoc
                                                [ "include", `String "#type-declarations"
                                                ]
                                            ; `Assoc
                                                [ "include", `String "#generic_types" ]
                                            ; `Assoc
                                                [ "match", `String "\\w+"
                                                ; "name", `String "entity.name.type.go"
                                                ]
                                            ] )
                                      ] )
                                ] )
                          ]
                      ; `Assoc
                          [ "comment", `String "single type declaration with generics"
                          ; ( "begin"
                            , `String
                                "(?:(?:^|\\s+)(\\btype\\b)(?:\\s*)([\\w\\.\\*]+)(?=\\[))"
                            )
                          ; ( "beginCaptures"
                            , `Assoc
                                [ "1", `Assoc [ "name", `String "keyword.type.go" ]
                                ; ( "2"
                                  , `Assoc
                                      [ ( "patterns"
                                        , `List
                                            [ `Assoc
                                                [ ( "include"
                                                  , `String
                                                      "#type-declarations-without-brackets"
                                                  )
                                                ]
                                            ; `Assoc
                                                [ "match", `String "\\w+"
                                                ; "name", `String "entity.name.type.go"
                                                ]
                                            ] )
                                      ] )
                                ] )
                          ; ( "end"
                            , `String
                                "(?:(?<=\\])((?:\\s+)(?:\\=\\s*)?(?:(?:(?:[\\*\\[\\]]+)?(?:\\<\\-\\s*)?\\bchan\\b(?:\\s*\\<\\-)?\\s*)+)?(?:(?!(?:[\\[\\]\\*]+)?(?:\\bstruct\\b|\\binterface\\b|\\bfunc\\b))[\\w\\.\\-\\*\\[\\]]+(?:\\,\\s*[\\w\\.\\[\\]\\*]+)*))?)"
                            )
                          ; ( "endCaptures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ ( "patterns"
                                        , `List
                                            [ `Assoc
                                                [ ( "include"
                                                  , `String
                                                      "#type-declarations-without-brackets"
                                                  )
                                                ]
                                            ; `Assoc
                                                [ "match", `String "\\["
                                                ; ( "name"
                                                  , `String
                                                      "punctuation.definition.begin.bracket.square.go"
                                                  )
                                                ]
                                            ; `Assoc
                                                [ "match", `String "\\]"
                                                ; ( "name"
                                                  , `String
                                                      "punctuation.definition.end.bracket.square.go"
                                                  )
                                                ]
                                            ; `Assoc
                                                [ "match", `String "\\w+"
                                                ; "name", `String "entity.name.type.go"
                                                ]
                                            ] )
                                      ] )
                                ] )
                          ; ( "patterns"
                            , `List
                                [ `Assoc [ "include", `String "#struct_variables_types" ]
                                ; `Assoc
                                    [ ( "include"
                                      , `String "#type-declarations-without-brackets" )
                                    ]
                                ; `Assoc
                                    [ "include", `String "#parameter-variable-types" ]
                                ; `Assoc
                                    [ "match", `String "\\["
                                    ; ( "name"
                                      , `String
                                          "punctuation.definition.begin.bracket.square.go"
                                      )
                                    ]
                                ; `Assoc
                                    [ "match", `String "\\]"
                                    ; ( "name"
                                      , `String
                                          "punctuation.definition.end.bracket.square.go" )
                                    ]
                                ; `Assoc
                                    [ "match", `String "\\{"
                                    ; ( "name"
                                      , `String
                                          "punctuation.definition.begin.bracket.curly.go"
                                      )
                                    ]
                                ; `Assoc
                                    [ "match", `String "\\}"
                                    ; ( "name"
                                      , `String
                                          "punctuation.definition.end.bracket.curly.go" )
                                    ]
                                ; `Assoc
                                    [ "match", `String "\\("
                                    ; ( "name"
                                      , `String
                                          "punctuation.definition.begin.bracket.round.go"
                                      )
                                    ]
                                ; `Assoc
                                    [ "match", `String "\\)"
                                    ; ( "name"
                                      , `String
                                          "punctuation.definition.end.bracket.round.go" )
                                    ]
                                ; `Assoc
                                    [ "match", `String "\\w+"
                                    ; "name", `String "entity.name.type.go"
                                    ]
                                ] )
                          ]
                      ] )
                ] )
          ; ( "multi_types"
            , `Assoc
                [ "comment", `String "multi type declaration"
                ; "begin", `String "(\\btype\\b)\\s*(\\()"
                ; ( "beginCaptures"
                  , `Assoc
                      [ "1", `Assoc [ "name", `String "keyword.type.go" ]
                      ; ( "2"
                        , `Assoc
                            [ ( "name"
                              , `String "punctuation.definition.begin.bracket.round.go" )
                            ] )
                      ] )
                ; ( "patterns"
                  , `List
                      [ `Assoc [ "include", `String "#struct_variables_types" ]
                      ; `Assoc [ "include", `String "#interface_variables_types" ]
                      ; `Assoc
                          [ "include", `String "#type-declarations-without-brackets" ]
                      ; `Assoc [ "include", `String "#parameter-variable-types" ]
                      ; `Assoc
                          [ "match", `String "\\w+"
                          ; "name", `String "entity.name.type.go"
                          ]
                      ] )
                ; "end", `String "\\)"
                ; ( "endCaptures"
                  , `Assoc
                      [ ( "0"
                        , `Assoc
                            [ ( "name"
                              , `String "punctuation.definition.end.bracket.round.go" )
                            ] )
                      ] )
                ] )
          ; ( "after_control_variables"
            , `Assoc
                [ ( "comment"
                  , `String
                      "After control variables, to not highlight as a struct/interface \
                       (before formatting with gofmt)" )
                ; ( "match"
                  , `String
                      "(?:(?<=\\brange\\b|\\;|\\bif\\b|\\bfor\\b|\\<|\\>|\\<\\=|\\>\\=|\\=\\=|\\!\\=|\\w(?:\\+|/|\\-|\\*|\\%)|\\w(?:\\+|/|\\-|\\*|\\%)\\=|\\|\\||\\&\\&)(?:\\s*)((?![\\[\\]]+)[[:alnum:]\\-\\_\\!\\.\\[\\]\\<\\>\\=\\*/\\+\\%\\:]+)(?:\\s*)(?=\\{))"
                  )
                ; ( "captures"
                  , `Assoc
                      [ ( "1"
                        , `Assoc
                            [ ( "patterns"
                              , `List
                                  [ `Assoc
                                      [ ( "include"
                                        , `String "#type-declarations-without-brackets" )
                                      ]
                                  ; `Assoc
                                      [ "match", `String "\\["
                                      ; ( "name"
                                        , `String
                                            "punctuation.definition.begin.bracket.square.go"
                                        )
                                      ]
                                  ; `Assoc
                                      [ "match", `String "\\]"
                                      ; ( "name"
                                        , `String
                                            "punctuation.definition.end.bracket.square.go"
                                        )
                                      ]
                                  ; `Assoc
                                      [ "match", `String "\\w+"
                                      ; "name", `String "variable.other.go"
                                      ]
                                  ] )
                            ] )
                      ] )
                ] )
          ; ( "syntax_errors"
            , `Assoc
                [ ( "patterns"
                  , `List
                      [ `Assoc
                          [ "comment", `String "Syntax error using slices"
                          ; "match", `String "\\[\\](\\s+)"
                          ; ( "captures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc [ "name", `String "invalid.illegal.slice.go" ]
                                  )
                                ] )
                          ]
                      ; `Assoc
                          [ "comment", `String "Syntax error numeric literals"
                          ; "match", `String "\\b0[0-7]*[89]\\d*\\b"
                          ; "name", `String "invalid.illegal.numeric.go"
                          ]
                      ] )
                ] )
          ; ( "built_in_functions"
            , `Assoc
                [ "comment", `String "Built-in functions"
                ; ( "patterns"
                  , `List
                      [ `Assoc
                          [ ( "match"
                            , `String
                                "\\b(append|cap|close|complex|copy|delete|imag|len|panic|print|println|real|recover|min|max|clear)\\b(?=\\()"
                            )
                          ; "name", `String "entity.name.function.support.builtin.go"
                          ]
                      ; `Assoc
                          [ "comment", `String "new keyword"
                          ; "begin", `String "(\\bnew\\b)(\\()"
                          ; ( "beginCaptures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ ( "name"
                                        , `String
                                            "entity.name.function.support.builtin.go" )
                                      ] )
                                ; ( "2"
                                  , `Assoc
                                      [ ( "name"
                                        , `String
                                            "punctuation.definition.begin.bracket.round.go"
                                        )
                                      ] )
                                ] )
                          ; "end", `String "\\)"
                          ; ( "endCaptures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "name"
                                        , `String
                                            "punctuation.definition.end.bracket.round.go"
                                        )
                                      ] )
                                ] )
                          ; ( "patterns"
                            , `List
                                [ `Assoc [ "include", `String "#functions" ]
                                ; `Assoc [ "include", `String "#struct_variables_types" ]
                                ; `Assoc [ "include", `String "#support_functions" ]
                                ; `Assoc [ "include", `String "#type-declarations" ]
                                ; `Assoc [ "include", `String "#generic_types" ]
                                ; `Assoc
                                    [ "match", `String "\\w+"
                                    ; "name", `String "entity.name.type.go"
                                    ]
                                ; `Assoc [ "include", `String "$self" ]
                                ] )
                          ]
                      ; `Assoc
                          [ "comment", `String "make keyword"
                          ; ( "begin"
                            , `String
                                "(?:(\\bmake\\b)(?:(\\()((?:(?:(?:[\\*\\[\\]]+)?(?:\\<\\-\\s*)?\\bchan\\b(?:\\s*\\<\\-)?\\s*)+(?:\\([^\\)]+\\))?)?(?:[\\[\\]\\*]+)?(?:(?!\\bmap\\b)(?:[\\w\\.]+))?(\\[(?:(?:[\\S]+)(?:(?:\\,\\s*(?:[\\S]+))*))?\\])?(?:\\,)?)?))"
                            )
                          ; ( "beginCaptures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ ( "name"
                                        , `String
                                            "entity.name.function.support.builtin.go" )
                                      ] )
                                ; ( "2"
                                  , `Assoc
                                      [ ( "name"
                                        , `String
                                            "punctuation.definition.begin.bracket.round.go"
                                        )
                                      ] )
                                ; ( "3"
                                  , `Assoc
                                      [ ( "patterns"
                                        , `List
                                            [ `Assoc
                                                [ ( "include"
                                                  , `String
                                                      "#type-declarations-without-brackets"
                                                  )
                                                ]
                                            ; `Assoc
                                                [ ( "include"
                                                  , `String "#parameter-variable-types" )
                                                ]
                                            ; `Assoc
                                                [ "match", `String "\\w+"
                                                ; "name", `String "entity.name.type.go"
                                                ]
                                            ] )
                                      ] )
                                ] )
                          ; "end", `String "\\)"
                          ; ( "endCaptures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "name"
                                        , `String
                                            "punctuation.definition.end.bracket.round.go"
                                        )
                                      ] )
                                ] )
                          ; "patterns", `List [ `Assoc [ "include", `String "$self" ] ]
                          ]
                      ] )
                ] )
          ; ( "struct_interface_declaration"
            , `Assoc
                [ ( "comment"
                  , `String
                      "struct, interface type declarations (related to: \
                       struct_variables_types, interface_variables_types)" )
                ; "match", `String "(?:(?:^\\s*)(\\btype\\b)(?:\\s*)([\\w\\.]+))"
                ; ( "captures"
                  , `Assoc
                      [ "1", `Assoc [ "name", `String "keyword.type.go" ]
                      ; ( "2"
                        , `Assoc
                            [ ( "patterns"
                              , `List
                                  [ `Assoc [ "include", `String "#type-declarations" ]
                                  ; `Assoc
                                      [ "match", `String "\\w+"
                                      ; "name", `String "entity.name.type.go"
                                      ]
                                  ] )
                            ] )
                      ] )
                ] )
          ; ( "switch_types"
            , `Assoc
                [ ( "comment"
                  , `String
                      "switch type assertions, only highlights types after case keyword" )
                ; ( "begin"
                  , `String
                      "(?<=\\bswitch\\b)(?:\\s*)(?:(\\w+\\s*\\:\\=)?\\s*([\\w\\.\\*\\(\\)\\[\\]\\+/\\-\\%\\<\\>\\|\\&]+))(\\.\\(\\btype\\b\\)\\s*)(\\{)"
                  )
                ; ( "beginCaptures"
                  , `Assoc
                      [ ( "1"
                        , `Assoc
                            [ ( "patterns"
                              , `List
                                  [ `Assoc [ "include", `String "#operators" ]
                                  ; `Assoc
                                      [ "match", `String "\\w+"
                                      ; "name", `String "variable.other.assignment.go"
                                      ]
                                  ] )
                            ] )
                      ; ( "2"
                        , `Assoc
                            [ ( "patterns"
                              , `List
                                  [ `Assoc [ "include", `String "#support_functions" ]
                                  ; `Assoc [ "include", `String "#type-declarations" ]
                                  ; `Assoc
                                      [ "match", `String "\\w+"
                                      ; "name", `String "variable.other.go"
                                      ]
                                  ] )
                            ] )
                      ; ( "3"
                        , `Assoc
                            [ ( "patterns"
                              , `List
                                  [ `Assoc [ "include", `String "#delimiters" ]
                                  ; `Assoc [ "include", `String "#brackets" ]
                                  ; `Assoc
                                      [ "match", `String "\\btype\\b"
                                      ; "name", `String "keyword.type.go"
                                      ]
                                  ] )
                            ] )
                      ; ( "4"
                        , `Assoc
                            [ ( "name"
                              , `String "punctuation.definition.begin.bracket.curly.go" )
                            ] )
                      ] )
                ; "end", `String "\\}"
                ; ( "endCaptures"
                  , `Assoc
                      [ ( "0"
                        , `Assoc
                            [ ( "name"
                              , `String "punctuation.definition.end.bracket.curly.go" )
                            ] )
                      ] )
                ; ( "patterns"
                  , `List
                      [ `Assoc
                          [ "comment", `String "types after case keyword with single line"
                          ; ( "match"
                            , `String
                                "(?:^\\s*(\\bcase\\b))(?:\\s+)([\\w\\.\\,\\*\\=\\<\\>\\!\\s]+)(:)(\\s*/(?:/|\\*)\\s*.*)?$"
                            )
                          ; ( "captures"
                            , `Assoc
                                [ "1", `Assoc [ "name", `String "keyword.control.go" ]
                                ; ( "2"
                                  , `Assoc
                                      [ ( "patterns"
                                        , `List
                                            [ `Assoc
                                                [ "include", `String "#type-declarations"
                                                ]
                                            ; `Assoc
                                                [ "match", `String "\\w+"
                                                ; "name", `String "entity.name.type.go"
                                                ]
                                            ] )
                                      ] )
                                ; ( "3"
                                  , `Assoc
                                      [ "name", `String "punctuation.other.colon.go" ] )
                                ; ( "4"
                                  , `Assoc
                                      [ ( "patterns"
                                        , `List
                                            [ `Assoc [ "include", `String "#comments" ] ]
                                        )
                                      ] )
                                ] )
                          ]
                      ; `Assoc
                          [ "comment", `String "types after case keyword with multi lines"
                          ; "begin", `String "\\bcase\\b"
                          ; ( "beginCaptures"
                            , `Assoc
                                [ "0", `Assoc [ "name", `String "keyword.control.go" ] ] )
                          ; "end", `String "\\:"
                          ; ( "endCaptures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ "name", `String "punctuation.other.colon.go" ] )
                                ] )
                          ; ( "patterns"
                            , `List
                                [ `Assoc [ "include", `String "#type-declarations" ]
                                ; `Assoc
                                    [ "match", `String "\\w+"
                                    ; "name", `String "entity.name.type.go"
                                    ]
                                ] )
                          ]
                      ; `Assoc [ "include", `String "$self" ]
                      ] )
                ] )
          ; ( "switch_variables"
            , `Assoc
                [ ( "comment"
                  , `String
                      "variables after case control keyword in switch/select expression, \
                       to not scope them as property variables" )
                ; ( "patterns"
                  , `List
                      [ `Assoc
                          [ "comment", `String "single line"
                          ; ( "match"
                            , `String
                                "(?:(?:^\\s*(\\bcase\\b))(?:\\s+)([\\s\\S]+(?:\\:)\\s*(?:/(?:/|\\*).*)?)$)"
                            )
                          ; ( "captures"
                            , `Assoc
                                [ "1", `Assoc [ "name", `String "keyword.control.go" ]
                                ; ( "2"
                                  , `Assoc
                                      [ ( "patterns"
                                        , `List
                                            [ `Assoc
                                                [ "include", `String "#type-declarations"
                                                ]
                                            ; `Assoc
                                                [ "include", `String "#support_functions"
                                                ]
                                            ; `Assoc
                                                [ ( "include"
                                                  , `String "#variable_assignment" )
                                                ]
                                            ; `Assoc
                                                [ "match", `String "\\w+"
                                                ; "name", `String "variable.other.go"
                                                ]
                                            ] )
                                      ] )
                                ] )
                          ]
                      ; `Assoc
                          [ "comment", `String "multi lines"
                          ; ( "begin"
                            , `String
                                "(?<=\\bswitch\\b)(?:\\s*)((?:[\\w\\.]+(?:\\s*(?:[\\:\\=\\!\\,\\+/\\-\\%\\<\\>\\|\\&]+)\\s*[\\w\\.]+)*\\s*(?:[\\:\\=\\!\\,\\+/\\-\\%\\<\\>\\|\\&]+))?(?:\\s*(?:[\\w\\.\\*\\(\\)\\[\\]\\+/\\-\\%\\<\\>\\|\\&]+)?\\s*(?:\\;\\s*(?:[\\w\\.\\*\\(\\)\\[\\]\\+/\\-\\%\\<\\>\\|\\&]+)\\s*)?))(\\{)"
                            )
                          ; ( "beginCaptures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ ( "patterns"
                                        , `List
                                            [ `Assoc
                                                [ "include", `String "#support_functions"
                                                ]
                                            ; `Assoc
                                                [ "include", `String "#type-declarations"
                                                ]
                                            ; `Assoc
                                                [ ( "include"
                                                  , `String "#variable_assignment" )
                                                ]
                                            ; `Assoc
                                                [ "match", `String "\\w+"
                                                ; "name", `String "variable.other.go"
                                                ]
                                            ] )
                                      ] )
                                ; ( "2"
                                  , `Assoc
                                      [ ( "name"
                                        , `String
                                            "punctuation.definition.begin.bracket.curly.go"
                                        )
                                      ] )
                                ] )
                          ; "end", `String "\\}"
                          ; ( "endCaptures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "name"
                                        , `String
                                            "punctuation.definition.end.bracket.curly.go"
                                        )
                                      ] )
                                ] )
                          ; ( "patterns"
                            , `List
                                [ `Assoc
                                    [ "begin", `String "\\bcase\\b"
                                    ; ( "beginCaptures"
                                      , `Assoc
                                          [ ( "0"
                                            , `Assoc
                                                [ "name", `String "keyword.control.go" ] )
                                          ] )
                                    ; "end", `String "\\:"
                                    ; ( "endCaptures"
                                      , `Assoc
                                          [ ( "0"
                                            , `Assoc
                                                [ ( "name"
                                                  , `String "punctuation.other.colon.go" )
                                                ] )
                                          ] )
                                    ; ( "patterns"
                                      , `List
                                          [ `Assoc
                                              [ "include", `String "#support_functions" ]
                                          ; `Assoc
                                              [ "include", `String "#type-declarations" ]
                                          ; `Assoc
                                              [ "include", `String "#variable_assignment"
                                              ]
                                          ; `Assoc
                                              [ "match", `String "\\w+"
                                              ; "name", `String "variable.other.go"
                                              ]
                                          ] )
                                    ]
                                ; `Assoc [ "include", `String "$self" ]
                                ] )
                          ]
                      ] )
                ] )
          ; ( "var_assignment"
            , `Assoc
                [ "comment", `String "variable assignment with var keyword"
                ; ( "patterns"
                  , `List
                      [ `Assoc
                          [ "comment", `String "single assignment"
                          ; ( "match"
                            , `String
                                "(?:(?<=\\bvar\\b)(?:\\s*)(\\b[\\w\\.]+(?:\\,\\s*[\\w\\.]+)*)(?:\\s*)((?:(?:(?:[\\*\\[\\]]+)?(?:\\<\\-\\s*)?\\bchan\\b(?:\\s*\\<\\-)?\\s*)+(?:\\([^\\)]+\\))?)?(?!(?:[\\[\\]\\*]+)?\\b(?:struct|func|map)\\b)(?:[\\w\\.\\[\\]\\*]+(?:\\,\\s*[\\w\\.\\[\\]\\*]+)*)?(?:\\s*)(?:\\=)?)?)"
                            )
                          ; ( "captures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ ( "patterns"
                                        , `List
                                            [ `Assoc [ "include", `String "#delimiters" ]
                                            ; `Assoc
                                                [ "match", `String "\\w+"
                                                ; ( "name"
                                                  , `String "variable.other.assignment.go"
                                                  )
                                                ]
                                            ] )
                                      ] )
                                ; ( "2"
                                  , `Assoc
                                      [ ( "patterns"
                                        , `List
                                            [ `Assoc
                                                [ ( "include"
                                                  , `String
                                                      "#type-declarations-without-brackets"
                                                  )
                                                ]
                                            ; `Assoc
                                                [ "include", `String "#generic_types" ]
                                            ; `Assoc
                                                [ "match", `String "\\("
                                                ; ( "name"
                                                  , `String
                                                      "punctuation.definition.begin.bracket.round.go"
                                                  )
                                                ]
                                            ; `Assoc
                                                [ "match", `String "\\)"
                                                ; ( "name"
                                                  , `String
                                                      "punctuation.definition.end.bracket.round.go"
                                                  )
                                                ]
                                            ; `Assoc
                                                [ "match", `String "\\["
                                                ; ( "name"
                                                  , `String
                                                      "punctuation.definition.begin.bracket.square.go"
                                                  )
                                                ]
                                            ; `Assoc
                                                [ "match", `String "\\]"
                                                ; ( "name"
                                                  , `String
                                                      "punctuation.definition.end.bracket.square.go"
                                                  )
                                                ]
                                            ; `Assoc
                                                [ "match", `String "\\w+"
                                                ; "name", `String "entity.name.type.go"
                                                ]
                                            ] )
                                      ] )
                                ] )
                          ]
                      ; `Assoc
                          [ "comment", `String "multi assignment"
                          ; "begin", `String "(?:(?<=\\bvar\\b)(?:\\s*)(\\())"
                          ; ( "beginCaptures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ ( "name"
                                        , `String
                                            "punctuation.definition.begin.bracket.round.go"
                                        )
                                      ] )
                                ] )
                          ; "end", `String "\\)"
                          ; ( "endCaptures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "name"
                                        , `String
                                            "punctuation.definition.end.bracket.round.go"
                                        )
                                      ] )
                                ] )
                          ; ( "patterns"
                            , `List
                                [ `Assoc
                                    [ ( "match"
                                      , `String
                                          "(?:(?:^\\s*)(\\b[\\w\\.]+(?:\\,\\s*[\\w\\.]+)*)(?:\\s*)((?:(?:(?:[\\*\\[\\]]+)?(?:\\<\\-\\s*)?\\bchan\\b(?:\\s*\\<\\-)?\\s*)+(?:\\([^\\)]+\\))?)?(?!(?:[\\[\\]\\*]+)?\\b(?:struct|func|map)\\b)(?:[\\w\\.\\[\\]\\*]+(?:\\,\\s*[\\w\\.\\[\\]\\*]+)*)?(?:\\s*)(?:\\=)?)?)"
                                      )
                                    ; ( "captures"
                                      , `Assoc
                                          [ ( "1"
                                            , `Assoc
                                                [ ( "patterns"
                                                  , `List
                                                      [ `Assoc
                                                          [ ( "include"
                                                            , `String "#delimiters" )
                                                          ]
                                                      ; `Assoc
                                                          [ "match", `String "\\w+"
                                                          ; ( "name"
                                                            , `String
                                                                "variable.other.assignment.go"
                                                            )
                                                          ]
                                                      ] )
                                                ] )
                                          ; ( "2"
                                            , `Assoc
                                                [ ( "patterns"
                                                  , `List
                                                      [ `Assoc
                                                          [ ( "include"
                                                            , `String
                                                                "#type-declarations-without-brackets"
                                                            )
                                                          ]
                                                      ; `Assoc
                                                          [ ( "include"
                                                            , `String "#generic_types" )
                                                          ]
                                                      ; `Assoc
                                                          [ "match", `String "\\("
                                                          ; ( "name"
                                                            , `String
                                                                "punctuation.definition.begin.bracket.round.go"
                                                            )
                                                          ]
                                                      ; `Assoc
                                                          [ "match", `String "\\)"
                                                          ; ( "name"
                                                            , `String
                                                                "punctuation.definition.end.bracket.round.go"
                                                            )
                                                          ]
                                                      ; `Assoc
                                                          [ "match", `String "\\["
                                                          ; ( "name"
                                                            , `String
                                                                "punctuation.definition.begin.bracket.square.go"
                                                            )
                                                          ]
                                                      ; `Assoc
                                                          [ "match", `String "\\]"
                                                          ; ( "name"
                                                            , `String
                                                                "punctuation.definition.end.bracket.square.go"
                                                            )
                                                          ]
                                                      ; `Assoc
                                                          [ "match", `String "\\w+"
                                                          ; ( "name"
                                                            , `String
                                                                "entity.name.type.go" )
                                                          ]
                                                      ] )
                                                ] )
                                          ] )
                                    ]
                                ; `Assoc [ "include", `String "$self" ]
                                ] )
                          ]
                      ] )
                ] )
          ; ( "const_assignment"
            , `Assoc
                [ "comment", `String "constant assignment with const keyword"
                ; ( "patterns"
                  , `List
                      [ `Assoc
                          [ "comment", `String "single assignment"
                          ; ( "match"
                            , `String
                                "(?:(?<=\\bconst\\b)(?:\\s*)(\\b[\\w\\.]+(?:\\,\\s*[\\w\\.]+)*)(?:\\s*)((?:(?:(?:[\\*\\[\\]]+)?(?:\\<\\-\\s*)?\\bchan\\b(?:\\s*\\<\\-)?\\s*)+(?:\\([^\\)]+\\))?)?(?!(?:[\\[\\]\\*]+)?\\b(?:struct|func|map)\\b)(?:[\\w\\.\\[\\]\\*]+(?:\\,\\s*[\\w\\.\\[\\]\\*]+)*)?(?:\\s*)(?:\\=)?)?)"
                            )
                          ; ( "captures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ ( "patterns"
                                        , `List
                                            [ `Assoc [ "include", `String "#delimiters" ]
                                            ; `Assoc
                                                [ "match", `String "\\w+"
                                                ; ( "name"
                                                  , `String "variable.other.constant.go" )
                                                ]
                                            ] )
                                      ] )
                                ; ( "2"
                                  , `Assoc
                                      [ ( "patterns"
                                        , `List
                                            [ `Assoc
                                                [ ( "include"
                                                  , `String
                                                      "#type-declarations-without-brackets"
                                                  )
                                                ]
                                            ; `Assoc
                                                [ "include", `String "#generic_types" ]
                                            ; `Assoc
                                                [ "match", `String "\\("
                                                ; ( "name"
                                                  , `String
                                                      "punctuation.definition.begin.bracket.round.go"
                                                  )
                                                ]
                                            ; `Assoc
                                                [ "match", `String "\\)"
                                                ; ( "name"
                                                  , `String
                                                      "punctuation.definition.end.bracket.round.go"
                                                  )
                                                ]
                                            ; `Assoc
                                                [ "match", `String "\\["
                                                ; ( "name"
                                                  , `String
                                                      "punctuation.definition.begin.bracket.square.go"
                                                  )
                                                ]
                                            ; `Assoc
                                                [ "match", `String "\\]"
                                                ; ( "name"
                                                  , `String
                                                      "punctuation.definition.end.bracket.square.go"
                                                  )
                                                ]
                                            ; `Assoc
                                                [ "match", `String "\\w+"
                                                ; "name", `String "entity.name.type.go"
                                                ]
                                            ] )
                                      ] )
                                ] )
                          ]
                      ; `Assoc
                          [ "comment", `String "multi assignment"
                          ; "begin", `String "(?:(?<=\\bconst\\b)(?:\\s*)(\\())"
                          ; ( "beginCaptures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ ( "name"
                                        , `String
                                            "punctuation.definition.begin.bracket.round.go"
                                        )
                                      ] )
                                ] )
                          ; "end", `String "\\)"
                          ; ( "endCaptures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "name"
                                        , `String
                                            "punctuation.definition.end.bracket.round.go"
                                        )
                                      ] )
                                ] )
                          ; ( "patterns"
                            , `List
                                [ `Assoc
                                    [ ( "match"
                                      , `String
                                          "(?:(?:^\\s*)(\\b[\\w\\.]+(?:\\,\\s*[\\w\\.]+)*)(?:\\s*)((?:(?:(?:[\\*\\[\\]]+)?(?:\\<\\-\\s*)?\\bchan\\b(?:\\s*\\<\\-)?\\s*)+(?:\\([^\\)]+\\))?)?(?!(?:[\\[\\]\\*]+)?\\b(?:struct|func|map)\\b)(?:[\\w\\.\\[\\]\\*]+(?:\\,\\s*[\\w\\.\\[\\]\\*]+)*)?(?:\\s*)(?:\\=)?)?)"
                                      )
                                    ; ( "captures"
                                      , `Assoc
                                          [ ( "1"
                                            , `Assoc
                                                [ ( "patterns"
                                                  , `List
                                                      [ `Assoc
                                                          [ ( "include"
                                                            , `String "#delimiters" )
                                                          ]
                                                      ; `Assoc
                                                          [ "match", `String "\\w+"
                                                          ; ( "name"
                                                            , `String
                                                                "variable.other.constant.go"
                                                            )
                                                          ]
                                                      ] )
                                                ] )
                                          ; ( "2"
                                            , `Assoc
                                                [ ( "patterns"
                                                  , `List
                                                      [ `Assoc
                                                          [ ( "include"
                                                            , `String
                                                                "#type-declarations-without-brackets"
                                                            )
                                                          ]
                                                      ; `Assoc
                                                          [ ( "include"
                                                            , `String "#generic_types" )
                                                          ]
                                                      ; `Assoc
                                                          [ "match", `String "\\("
                                                          ; ( "name"
                                                            , `String
                                                                "punctuation.definition.begin.bracket.round.go"
                                                            )
                                                          ]
                                                      ; `Assoc
                                                          [ "match", `String "\\)"
                                                          ; ( "name"
                                                            , `String
                                                                "punctuation.definition.end.bracket.round.go"
                                                            )
                                                          ]
                                                      ; `Assoc
                                                          [ "match", `String "\\["
                                                          ; ( "name"
                                                            , `String
                                                                "punctuation.definition.begin.bracket.square.go"
                                                            )
                                                          ]
                                                      ; `Assoc
                                                          [ "match", `String "\\]"
                                                          ; ( "name"
                                                            , `String
                                                                "punctuation.definition.end.bracket.square.go"
                                                            )
                                                          ]
                                                      ; `Assoc
                                                          [ "match", `String "\\w+"
                                                          ; ( "name"
                                                            , `String
                                                                "entity.name.type.go" )
                                                          ]
                                                      ] )
                                                ] )
                                          ] )
                                    ]
                                ; `Assoc [ "include", `String "$self" ]
                                ] )
                          ]
                      ] )
                ] )
          ; ( "variable_assignment"
            , `Assoc
                [ "comment", `String "variable assignment"
                ; ( "patterns"
                  , `List
                      [ `Assoc
                          [ "comment", `String "variable assignment with :="
                          ; "match", `String "\\b\\w+(?:\\,\\s*\\w+)*(?=\\s*:=)"
                          ; ( "captures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "patterns"
                                        , `List
                                            [ `Assoc [ "include", `String "#delimiters" ]
                                            ; `Assoc
                                                [ "match", `String "\\d\\w*"
                                                ; ( "name"
                                                  , `String
                                                      "invalid.illegal.identifier.go" )
                                                ]
                                            ; `Assoc
                                                [ "match", `String "\\w+"
                                                ; ( "name"
                                                  , `String "variable.other.assignment.go"
                                                  )
                                                ]
                                            ] )
                                      ] )
                                ] )
                          ]
                      ; `Assoc
                          [ "comment", `String "variable assignment with ="
                          ; ( "match"
                            , `String
                                "\\b[\\w\\.\\*]+(?:\\,\\s*[\\w\\.\\*]+)*(?=\\s*=(?!=))" )
                          ; ( "captures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "patterns"
                                        , `List
                                            [ `Assoc [ "include", `String "#delimiters" ]
                                            ; `Assoc [ "include", `String "#operators" ]
                                            ; `Assoc
                                                [ "match", `String "\\d\\w*"
                                                ; ( "name"
                                                  , `String
                                                      "invalid.illegal.identifier.go" )
                                                ]
                                            ; `Assoc
                                                [ "match", `String "\\w+"
                                                ; ( "name"
                                                  , `String "variable.other.assignment.go"
                                                  )
                                                ]
                                            ] )
                                      ] )
                                ] )
                          ]
                      ] )
                ] )
          ; ( "generic_types"
            , `Assoc
                [ "comment", `String "Generic support for all types"
                ; "match", `String "(?:([\\w\\.\\*]+)(\\[(?:[^\\]]+)?\\]))"
                ; ( "captures"
                  , `Assoc
                      [ ( "1"
                        , `Assoc
                            [ ( "patterns"
                              , `List
                                  [ `Assoc [ "include", `String "#type-declarations" ]
                                  ; `Assoc
                                      [ "match", `String "\\w+"
                                      ; "name", `String "entity.name.type.go"
                                      ]
                                  ] )
                            ] )
                      ; ( "2"
                        , `Assoc
                            [ ( "patterns"
                              , `List
                                  [ `Assoc
                                      [ "include", `String "#parameter-variable-types" ]
                                  ] )
                            ] )
                      ] )
                ] )
          ; ( "slice_index_variables"
            , `Assoc
                [ ( "comment"
                  , `String
                      "slice index and capacity variables, to not scope them as property \
                       variables" )
                ; ( "match"
                  , `String
                      "(?<=\\w\\[)((?:(?:\\b[\\w\\.\\*\\+/\\-\\%\\<\\>\\|\\&]+\\:)|(?:\\:\\b[\\w\\.\\*\\+/\\-\\%\\<\\>\\|\\&]+))(?:\\b[\\w\\.\\*\\+/\\-\\%\\<\\>\\|\\&]+)?(?:\\:\\b[\\w\\.\\*\\+/\\-\\%\\<\\>\\|\\&]+)?)(?=\\])"
                  )
                ; ( "captures"
                  , `Assoc
                      [ ( "1"
                        , `Assoc
                            [ ( "patterns"
                              , `List
                                  [ `Assoc [ "include", `String "#type-declarations" ]
                                  ; `Assoc
                                      [ "match", `String "\\w+"
                                      ; "name", `String "variable.other.go"
                                      ]
                                  ] )
                            ] )
                      ] )
                ] )
          ; ( "property_variables"
            , `Assoc
                [ "comment", `String "Property variables in struct"
                ; "match", `String "((?:\\b[\\w\\.]+)(?:\\:(?!\\=)))"
                ; ( "captures"
                  , `Assoc
                      [ ( "1"
                        , `Assoc
                            [ ( "patterns"
                              , `List
                                  [ `Assoc [ "include", `String "#type-declarations" ]
                                  ; `Assoc
                                      [ "match", `String "\\w+"
                                      ; "name", `String "variable.other.property.go"
                                      ]
                                  ] )
                            ] )
                      ] )
                ] )
          ; ( "label_loop_variables"
            , `Assoc
                [ "comment", `String "labeled loop variable name"
                ; ( "match"
                  , `String
                      "((?:^\\s*\\w+:\\s*$)|(?:^\\s*(?:\\bbreak\\b|\\bgoto\\b|\\bcontinue\\b)\\s+\\w+(?:\\s*/(?:/|\\*)\\s*.*)?$))"
                  )
                ; ( "captures"
                  , `Assoc
                      [ ( "1"
                        , `Assoc
                            [ ( "patterns"
                              , `List
                                  [ `Assoc [ "include", `String "#type-declarations" ]
                                  ; `Assoc
                                      [ "match", `String "\\w+"
                                      ; "name", `String "variable.other.label.go"
                                      ]
                                  ] )
                            ] )
                      ] )
                ] )
          ; ( "double_parentheses_types"
            , `Assoc
                [ "comment", `String "double parentheses types"
                ; ( "match"
                  , `String
                      "(?:(?<!\\w)(\\((?:[\\[\\]\\*]+)?(?:[\\w\\.]+)(?:\\[(?:(?:[\\w\\.\\*\\[\\]\\{\\}]+)(?:(?:\\,\\s*(?:[\\w\\.\\*\\[\\]\\{\\}]+))*))?\\])?\\))(?=\\())"
                  )
                ; ( "captures"
                  , `Assoc
                      [ ( "1"
                        , `Assoc
                            [ ( "patterns"
                              , `List
                                  [ `Assoc
                                      [ ( "include"
                                        , `String "#type-declarations-without-brackets" )
                                      ]
                                  ; `Assoc
                                      [ "match", `String "\\("
                                      ; ( "name"
                                        , `String
                                            "punctuation.definition.begin.bracket.round.go"
                                        )
                                      ]
                                  ; `Assoc
                                      [ "match", `String "\\)"
                                      ; ( "name"
                                        , `String
                                            "punctuation.definition.end.bracket.round.go"
                                        )
                                      ]
                                  ; `Assoc
                                      [ "match", `String "\\["
                                      ; ( "name"
                                        , `String
                                            "punctuation.definition.begin.bracket.square.go"
                                        )
                                      ]
                                  ; `Assoc
                                      [ "match", `String "\\]"
                                      ; ( "name"
                                        , `String
                                            "punctuation.definition.end.bracket.square.go"
                                        )
                                      ]
                                  ; `Assoc
                                      [ "match", `String "\\{"
                                      ; ( "name"
                                        , `String
                                            "punctuation.definition.begin.bracket.curly.go"
                                        )
                                      ]
                                  ; `Assoc
                                      [ "match", `String "\\}"
                                      ; ( "name"
                                        , `String
                                            "punctuation.definition.end.bracket.curly.go"
                                        )
                                      ]
                                  ; `Assoc
                                      [ "match", `String "\\w+"
                                      ; "name", `String "entity.name.type.go"
                                      ]
                                  ] )
                            ] )
                      ] )
                ] )
          ; ( "hover"
            , `Assoc
                [ "comment", `String "hovering with the mouse"
                ; ( "patterns"
                  , `List
                      [ `Assoc
                          [ ( "comment"
                            , `String
                                "struct field property and types when hovering with the \
                                 mouse" )
                          ; ( "match"
                            , `String
                                "(?:(?<=^\\bfield\\b)\\s+([\\w\\*\\.]+)\\s+([\\s\\S]+))" )
                          ; ( "captures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ ( "patterns"
                                        , `List
                                            [ `Assoc
                                                [ "include", `String "#type-declarations"
                                                ]
                                            ; `Assoc
                                                [ "match", `String "\\w+"
                                                ; ( "name"
                                                  , `String "variable.other.property.go" )
                                                ]
                                            ] )
                                      ] )
                                ; ( "2"
                                  , `Assoc
                                      [ ( "patterns"
                                        , `List
                                            [ `Assoc
                                                [ ( "match"
                                                  , `String "\\binvalid\\b\\s+\\btype\\b"
                                                  )
                                                ; "name", `String "invalid.field.go"
                                                ]
                                            ; `Assoc
                                                [ ( "include"
                                                  , `String
                                                      "#type-declarations-without-brackets"
                                                  )
                                                ]
                                            ; `Assoc
                                                [ ( "include"
                                                  , `String "#parameter-variable-types" )
                                                ]
                                            ; `Assoc
                                                [ "match", `String "\\w+"
                                                ; "name", `String "entity.name.type.go"
                                                ]
                                            ] )
                                      ] )
                                ] )
                          ]
                      ; `Assoc
                          [ "comment", `String "return types when hovering with the mouse"
                          ; "match", `String "(?:(?<=^\\breturns\\b)\\s+([\\s\\S]+))"
                          ; ( "captures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ ( "patterns"
                                        , `List
                                            [ `Assoc
                                                [ ( "include"
                                                  , `String
                                                      "#type-declarations-without-brackets"
                                                  )
                                                ]
                                            ; `Assoc
                                                [ ( "include"
                                                  , `String "#parameter-variable-types" )
                                                ]
                                            ; `Assoc
                                                [ "match", `String "\\w+"
                                                ; "name", `String "entity.name.type.go"
                                                ]
                                            ] )
                                      ] )
                                ] )
                          ]
                      ] )
                ] )
          ; ( "other_variables"
            , `Assoc
                [ "comment", `String "all other variables"
                ; "match", `String "\\w+"
                ; "name", `String "variable.other.go"
                ] )
          ] )
    ]
;;

let nix =
  `Assoc
    [ "name", `String "Nix"
    ; "scopeName", `String "source.nix"
    ; "fileTypes", `List [ `String "nix" ]
    ; "uuid", `String "0514fd5f-acb6-436d-b42c-7643e6d36c8f"
    ; "patterns", `List [ `Assoc [ "include", `String "#expression" ] ]
    ; ( "repository"
      , `Assoc
          [ ( "expression"
            , `Assoc
                [ ( "patterns"
                  , `List
                      [ `Assoc [ "include", `String "#parens-and-cont" ]
                      ; `Assoc [ "include", `String "#list-and-cont" ]
                      ; `Assoc [ "include", `String "#string" ]
                      ; `Assoc [ "include", `String "#interpolation" ]
                      ; `Assoc [ "include", `String "#with-assert" ]
                      ; `Assoc [ "include", `String "#function-for-sure" ]
                      ; `Assoc [ "include", `String "#attrset-for-sure" ]
                      ; `Assoc [ "include", `String "#attrset-or-function" ]
                      ; `Assoc [ "include", `String "#let" ]
                      ; `Assoc [ "include", `String "#if" ]
                      ; `Assoc [ "include", `String "#operator-unary" ]
                      ; `Assoc [ "include", `String "#operator-binary" ]
                      ; `Assoc [ "include", `String "#constants" ]
                      ; `Assoc [ "include", `String "#bad-reserved" ]
                      ; `Assoc [ "include", `String "#parameter-name-and-cont" ]
                      ; `Assoc [ "include", `String "#others" ]
                      ] )
                ] )
          ; ( "expression-cont"
            , `Assoc
                [ "begin", `String "(?=.?)"
                ; "end", `String "(?=([\\])};,]|\\b(else|then)\\b))"
                ; ( "patterns"
                  , `List
                      [ `Assoc [ "include", `String "#parens" ]
                      ; `Assoc [ "include", `String "#list" ]
                      ; `Assoc [ "include", `String "#string" ]
                      ; `Assoc [ "include", `String "#interpolation" ]
                      ; `Assoc [ "include", `String "#function-for-sure" ]
                      ; `Assoc [ "include", `String "#attrset-for-sure" ]
                      ; `Assoc [ "include", `String "#attrset-or-function" ]
                      ; `Assoc [ "include", `String "#operator-binary" ]
                      ; `Assoc [ "include", `String "#constants" ]
                      ; `Assoc [ "include", `String "#bad-reserved" ]
                      ; `Assoc [ "include", `String "#parameter-name" ]
                      ; `Assoc [ "include", `String "#others" ]
                      ] )
                ] )
          ; ( "parens"
            , `Assoc
                [ "begin", `String "\\("
                ; ( "beginCaptures"
                  , `Assoc
                      [ ( "0"
                        , `Assoc
                            [ "name", `String "punctuation.definition.expression.nix" ] )
                      ] )
                ; "end", `String "\\)"
                ; ( "endCaptures"
                  , `Assoc
                      [ ( "0"
                        , `Assoc
                            [ "name", `String "punctuation.definition.expression.nix" ] )
                      ] )
                ; "patterns", `List [ `Assoc [ "include", `String "#expression" ] ]
                ] )
          ; ( "parens-and-cont"
            , `Assoc
                [ "begin", `String "(?=\\()"
                ; "end", `String "(?=([\\])};,]|\\b(else|then)\\b))"
                ; ( "patterns"
                  , `List
                      [ `Assoc [ "include", `String "#parens" ]
                      ; `Assoc [ "include", `String "#expression-cont" ]
                      ] )
                ] )
          ; ( "list"
            , `Assoc
                [ "begin", `String "\\["
                ; ( "beginCaptures"
                  , `Assoc
                      [ "0", `Assoc [ "name", `String "punctuation.definition.list.nix" ]
                      ] )
                ; "end", `String "\\]"
                ; ( "endCaptures"
                  , `Assoc
                      [ "0", `Assoc [ "name", `String "punctuation.definition.list.nix" ]
                      ] )
                ; "patterns", `List [ `Assoc [ "include", `String "#expression" ] ]
                ] )
          ; ( "list-and-cont"
            , `Assoc
                [ "begin", `String "(?=\\[)"
                ; "end", `String "(?=([\\])};,]|\\b(else|then)\\b))"
                ; ( "patterns"
                  , `List
                      [ `Assoc [ "include", `String "#list" ]
                      ; `Assoc [ "include", `String "#expression-cont" ]
                      ] )
                ] )
          ; ( "attrset-for-sure"
            , `Assoc
                [ ( "patterns"
                  , `List
                      [ `Assoc
                          [ "begin", `String "(?=\\brec\\b)"
                          ; "end", `String "(?=([\\])};,]|\\b(else|then)\\b))"
                          ; ( "patterns"
                            , `List
                                [ `Assoc
                                    [ "begin", `String "\\brec\\b"
                                    ; "end", `String "(?=\\{)"
                                    ; ( "beginCaptures"
                                      , `Assoc
                                          [ ( "0"
                                            , `Assoc
                                                [ "name", `String "keyword.other.nix" ] )
                                          ] )
                                    ; ( "patterns"
                                      , `List [ `Assoc [ "include", `String "#others" ] ]
                                      )
                                    ]
                                ; `Assoc [ "include", `String "#attrset-definition" ]
                                ; `Assoc [ "include", `String "#others" ]
                                ] )
                          ]
                      ; `Assoc
                          [ "begin", `String "(?=\\{\\s*(\\}|[^,?]*(=|;)))"
                          ; "end", `String "(?=([\\])};,]|\\b(else|then)\\b))"
                          ; ( "patterns"
                            , `List
                                [ `Assoc [ "include", `String "#attrset-definition" ]
                                ; `Assoc [ "include", `String "#others" ]
                                ] )
                          ]
                      ] )
                ] )
          ; ( "attrset-definition"
            , `Assoc
                [ "begin", `String "(?=\\{)"
                ; "end", `String "(?=([\\])};,]|\\b(else|then)\\b))"
                ; ( "patterns"
                  , `List
                      [ `Assoc
                          [ "begin", `String "(\\{)"
                          ; "end", `String "(\\})"
                          ; ( "beginCaptures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.definition.attrset.nix" )
                                      ] )
                                ] )
                          ; ( "endCaptures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.definition.attrset.nix" )
                                      ] )
                                ] )
                          ; ( "patterns"
                            , `List [ `Assoc [ "include", `String "#attrset-contents" ] ]
                            )
                          ]
                      ; `Assoc
                          [ "begin", `String "(?<=\\})"
                          ; "end", `String "(?=([\\])};,]|\\b(else|then)\\b))"
                          ; ( "patterns"
                            , `List [ `Assoc [ "include", `String "#expression-cont" ] ] )
                          ]
                      ] )
                ] )
          ; ( "attrset-definition-brace-opened"
            , `Assoc
                [ ( "patterns"
                  , `List
                      [ `Assoc
                          [ "begin", `String "(?<=\\})"
                          ; "end", `String "(?=([\\])};,]|\\b(else|then)\\b))"
                          ; ( "patterns"
                            , `List [ `Assoc [ "include", `String "#expression-cont" ] ] )
                          ]
                      ; `Assoc
                          [ "begin", `String "(?=.?)"
                          ; "end", `String "\\}"
                          ; ( "endCaptures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.definition.attrset.nix" )
                                      ] )
                                ] )
                          ; ( "patterns"
                            , `List [ `Assoc [ "include", `String "#attrset-contents" ] ]
                            )
                          ]
                      ] )
                ] )
          ; ( "attrset-contents"
            , `Assoc
                [ ( "patterns"
                  , `List
                      [ `Assoc [ "include", `String "#attribute-inherit" ]
                      ; `Assoc [ "include", `String "#bad-reserved" ]
                      ; `Assoc [ "include", `String "#attribute-bind" ]
                      ; `Assoc [ "include", `String "#others" ]
                      ] )
                ] )
          ; ( "function-header-open-brace"
            , `Assoc
                [ "begin", `String "\\{"
                ; "end", `String "(?=\\})"
                ; ( "beginCaptures"
                  , `Assoc
                      [ ( "0"
                        , `Assoc
                            [ ( "name"
                              , `String "punctuation.definition.entity.function.2.nix" )
                            ] )
                      ] )
                ; "patterns", `List [ `Assoc [ "include", `String "#function-contents" ] ]
                ] )
          ; ( "function-header-close-brace-no-arg"
            , `Assoc
                [ "begin", `String "\\}"
                ; "end", `String "(?=\\:)"
                ; ( "beginCaptures"
                  , `Assoc
                      [ ( "0"
                        , `Assoc
                            [ "name", `String "punctuation.definition.entity.function.nix"
                            ] )
                      ] )
                ; "patterns", `List [ `Assoc [ "include", `String "#others" ] ]
                ] )
          ; ( "function-header-terminal-arg"
            , `Assoc
                [ "begin", `String "(?=@)"
                ; "end", `String "(?=\\:)"
                ; ( "patterns"
                  , `List
                      [ `Assoc
                          [ "begin", `String "\\@"
                          ; "end", `String "(?=\\:)"
                          ; ( "patterns"
                            , `List
                                [ `Assoc
                                    [ ( "begin"
                                      , `String "(\\b[a-zA-Z\\_][a-zA-Z0-9\\_\\'\\-]*)" )
                                    ; "end", `String "(?=\\:)"
                                    ; "name", `String "variable.parameter.function.3.nix"
                                    ]
                                ; `Assoc [ "include", `String "#others" ]
                                ] )
                          ]
                      ; `Assoc [ "include", `String "#others" ]
                      ] )
                ] )
          ; ( "function-header-close-brace-with-arg"
            , `Assoc
                [ "begin", `String "\\}"
                ; "end", `String "(?=\\:)"
                ; ( "beginCaptures"
                  , `Assoc
                      [ ( "0"
                        , `Assoc
                            [ "name", `String "punctuation.definition.entity.function.nix"
                            ] )
                      ] )
                ; ( "patterns"
                  , `List
                      [ `Assoc [ "include", `String "#function-header-terminal-arg" ]
                      ; `Assoc [ "include", `String "#others" ]
                      ] )
                ] )
          ; ( "function-header-until-colon-no-arg"
            , `Assoc
                [ "begin", `String "(?=\\{)"
                ; "end", `String "(?=\\:)"
                ; ( "patterns"
                  , `List
                      [ `Assoc [ "include", `String "#function-header-open-brace" ]
                      ; `Assoc
                          [ "include", `String "#function-header-close-brace-no-arg" ]
                      ] )
                ] )
          ; ( "function-header-until-colon-with-arg"
            , `Assoc
                [ "begin", `String "(?=\\{)"
                ; "end", `String "(?=\\:)"
                ; ( "patterns"
                  , `List
                      [ `Assoc [ "include", `String "#function-header-open-brace" ]
                      ; `Assoc
                          [ "include", `String "#function-header-close-brace-with-arg" ]
                      ] )
                ] )
          ; ( "function-body-from-colon"
            , `Assoc
                [ "begin", `String "(\\:)"
                ; "end", `String "(?=([\\])};,]|\\b(else|then)\\b))"
                ; ( "beginCaptures"
                  , `Assoc
                      [ ( "0"
                        , `Assoc [ "name", `String "punctuation.definition.function.nix" ]
                        )
                      ] )
                ; "patterns", `List [ `Assoc [ "include", `String "#expression" ] ]
                ] )
          ; ( "function-definition"
            , `Assoc
                [ "begin", `String "(?=.?)"
                ; "end", `String "(?=([\\])};,]|\\b(else|then)\\b))"
                ; ( "patterns"
                  , `List
                      [ `Assoc [ "include", `String "#function-body-from-colon" ]
                      ; `Assoc
                          [ "begin", `String "(?=.?)"
                          ; "end", `String "(?=\\:)"
                          ; ( "patterns"
                            , `List
                                [ `Assoc
                                    [ ( "begin"
                                      , `String "(\\b[a-zA-Z\\_][a-zA-Z0-9\\_\\'\\-]*)" )
                                    ; "end", `String "(?=\\:)"
                                    ; ( "beginCaptures"
                                      , `Assoc
                                          [ ( "0"
                                            , `Assoc
                                                [ ( "name"
                                                  , `String
                                                      "variable.parameter.function.4.nix"
                                                  )
                                                ] )
                                          ] )
                                    ; ( "patterns"
                                      , `List
                                          [ `Assoc
                                              [ "begin", `String "\\@"
                                              ; "end", `String "(?=\\:)"
                                              ; ( "patterns"
                                                , `List
                                                    [ `Assoc
                                                        [ ( "include"
                                                          , `String
                                                              "#function-header-until-colon-no-arg"
                                                          )
                                                        ]
                                                    ; `Assoc
                                                        [ "include", `String "#others" ]
                                                    ] )
                                              ]
                                          ; `Assoc [ "include", `String "#others" ]
                                          ] )
                                    ]
                                ; `Assoc
                                    [ "begin", `String "(?=\\{)"
                                    ; "end", `String "(?=\\:)"
                                    ; ( "patterns"
                                      , `List
                                          [ `Assoc
                                              [ ( "include"
                                                , `String
                                                    "#function-header-until-colon-with-arg"
                                                )
                                              ]
                                          ] )
                                    ]
                                ] )
                          ]
                      ; `Assoc [ "include", `String "#others" ]
                      ] )
                ] )
          ; ( "function-definition-brace-opened"
            , `Assoc
                [ "begin", `String "(?=.?)"
                ; "end", `String "(?=([\\])};,]|\\b(else|then)\\b))"
                ; ( "patterns"
                  , `List
                      [ `Assoc [ "include", `String "#function-body-from-colon" ]
                      ; `Assoc
                          [ "begin", `String "(?=.?)"
                          ; "end", `String "(?=\\:)"
                          ; ( "patterns"
                            , `List
                                [ `Assoc
                                    [ ( "include"
                                      , `String "#function-header-close-brace-with-arg" )
                                    ]
                                ; `Assoc
                                    [ "begin", `String "(?=.?)"
                                    ; "end", `String "(?=\\})"
                                    ; ( "patterns"
                                      , `List
                                          [ `Assoc
                                              [ "include", `String "#function-contents" ]
                                          ] )
                                    ]
                                ] )
                          ]
                      ; `Assoc [ "include", `String "#others" ]
                      ] )
                ] )
          ; ( "function-for-sure"
            , `Assoc
                [ ( "patterns"
                  , `List
                      [ `Assoc
                          [ ( "begin"
                            , `String
                                "(?=(\\b[a-zA-Z\\_][a-zA-Z0-9\\_\\'\\-]*\\s*[:@]|\\{[^}\\\"']*\\}\\s*:|\\{[^#}\"'/=]*[,\\?]))"
                            )
                          ; "end", `String "(?=([\\])};,]|\\b(else|then)\\b))"
                          ; ( "patterns"
                            , `List
                                [ `Assoc [ "include", `String "#function-definition" ] ] )
                          ]
                      ] )
                ] )
          ; ( "function-contents"
            , `Assoc
                [ ( "patterns"
                  , `List
                      [ `Assoc [ "include", `String "#bad-reserved" ]
                      ; `Assoc [ "include", `String "#function-parameter" ]
                      ; `Assoc [ "include", `String "#others" ]
                      ] )
                ] )
          ; ( "attrset-or-function"
            , `Assoc
                [ "begin", `String "\\{"
                ; ( "beginCaptures"
                  , `Assoc
                      [ ( "0"
                        , `Assoc
                            [ ( "name"
                              , `String "punctuation.definition.attrset-or-function.nix" )
                            ] )
                      ] )
                ; "end", `String "(?=([\\])};]|\\b(else|then)\\b))"
                ; ( "patterns"
                  , `List
                      [ `Assoc
                          [ ( "begin"
                            , `String
                                "(?=(\\s*\\}|\\\"|\\binherit\\b|\\$\\{|\\b[a-zA-Z\\_][a-zA-Z0-9\\_\\'\\-]*(\\s*\\.|\\s*=[^=])))"
                            )
                          ; "end", `String "(?=([\\])};,]|\\b(else|then)\\b))"
                          ; ( "patterns"
                            , `List
                                [ `Assoc
                                    [ ( "include"
                                      , `String "#attrset-definition-brace-opened" )
                                    ]
                                ] )
                          ]
                      ; `Assoc
                          [ ( "begin"
                            , `String
                                "(?=(\\.\\.\\.|\\b[a-zA-Z\\_][a-zA-Z0-9\\_\\'\\-]*\\s*[,?]))"
                            )
                          ; "end", `String "(?=([\\])};,]|\\b(else|then)\\b))"
                          ; ( "patterns"
                            , `List
                                [ `Assoc
                                    [ ( "include"
                                      , `String "#function-definition-brace-opened" )
                                    ]
                                ] )
                          ]
                      ; `Assoc [ "include", `String "#bad-reserved" ]
                      ; `Assoc
                          [ "begin", `String "\\b[a-zA-Z\\_][a-zA-Z0-9\\_\\'\\-]*"
                          ; "end", `String "(?=([\\])};]|\\b(else|then)\\b))"
                          ; ( "beginCaptures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "variable.parameter.function.maybe.nix"
                                        )
                                      ] )
                                ] )
                          ; ( "patterns"
                            , `List
                                [ `Assoc
                                    [ "begin", `String "(?=\\.)"
                                    ; "end", `String "(?=([\\])};,]|\\b(else|then)\\b))"
                                    ; ( "patterns"
                                      , `List
                                          [ `Assoc
                                              [ ( "include"
                                                , `String
                                                    "#attrset-definition-brace-opened" )
                                              ]
                                          ] )
                                    ]
                                ; `Assoc
                                    [ "begin", `String "\\s*(\\,)"
                                    ; ( "beginCaptures"
                                      , `Assoc
                                          [ ( "1"
                                            , `Assoc
                                                [ "name", `String "keyword.operator.nix" ]
                                            )
                                          ] )
                                    ; "end", `String "(?=([\\])};,]|\\b(else|then)\\b))"
                                    ; ( "patterns"
                                      , `List
                                          [ `Assoc
                                              [ ( "include"
                                                , `String
                                                    "#function-definition-brace-opened" )
                                              ]
                                          ] )
                                    ]
                                ; `Assoc
                                    [ "begin", `String "(?=\\=)"
                                    ; "end", `String "(?=([\\])};,]|\\b(else|then)\\b))"
                                    ; ( "patterns"
                                      , `List
                                          [ `Assoc
                                              [ ( "include"
                                                , `String "#attribute-bind-from-equals" )
                                              ]
                                          ; `Assoc
                                              [ ( "include"
                                                , `String
                                                    "#attrset-definition-brace-opened" )
                                              ]
                                          ] )
                                    ]
                                ; `Assoc
                                    [ "begin", `String "(?=\\?)"
                                    ; "end", `String "(?=([\\])};,]|\\b(else|then)\\b))"
                                    ; ( "patterns"
                                      , `List
                                          [ `Assoc
                                              [ ( "include"
                                                , `String "#function-parameter-default" )
                                              ]
                                          ; `Assoc
                                              [ "begin", `String "\\,"
                                              ; ( "beginCaptures"
                                                , `Assoc
                                                    [ ( "0"
                                                      , `Assoc
                                                          [ ( "name"
                                                            , `String
                                                                "keyword.operator.nix" )
                                                          ] )
                                                    ] )
                                              ; ( "end"
                                                , `String
                                                    "(?=([\\])};,]|\\b(else|then)\\b))" )
                                              ; ( "patterns"
                                                , `List
                                                    [ `Assoc
                                                        [ ( "include"
                                                          , `String
                                                              "#function-definition-brace-opened"
                                                          )
                                                        ]
                                                    ] )
                                              ]
                                          ] )
                                    ]
                                ; `Assoc [ "include", `String "#others" ]
                                ] )
                          ]
                      ; `Assoc [ "include", `String "#others" ]
                      ] )
                ] )
          ; ( "with-assert"
            , `Assoc
                [ "begin", `String "(?<![\\w'-])(with|assert)(?![\\w'-])"
                ; ( "beginCaptures"
                  , `Assoc [ "0", `Assoc [ "name", `String "keyword.other.nix" ] ] )
                ; "end", `String "\\;"
                ; "patterns", `List [ `Assoc [ "include", `String "#expression" ] ]
                ] )
          ; ( "let"
            , `Assoc
                [ "begin", `String "(?=\\blet\\b)"
                ; "end", `String "(?=([\\])};,]|\\b(else|then)\\b))"
                ; ( "patterns"
                  , `List
                      [ `Assoc
                          [ "begin", `String "\\blet\\b"
                          ; ( "beginCaptures"
                            , `Assoc
                                [ "0", `Assoc [ "name", `String "keyword.other.nix" ] ] )
                          ; "end", `String "(?=([\\])};,]|\\b(in|else|then)\\b))"
                          ; ( "patterns"
                            , `List
                                [ `Assoc
                                    [ "begin", `String "(?=\\{)"
                                    ; "end", `String "(?=([\\])};,]|\\b(else|then)\\b))"
                                    ; ( "patterns"
                                      , `List
                                          [ `Assoc
                                              [ "begin", `String "\\{"
                                              ; "end", `String "\\}"
                                              ; ( "patterns"
                                                , `List
                                                    [ `Assoc
                                                        [ ( "include"
                                                          , `String "#attrset-contents" )
                                                        ]
                                                    ] )
                                              ]
                                          ; `Assoc
                                              [ "begin", `String "(^|(?<=\\}))"
                                              ; ( "end"
                                                , `String
                                                    "(?=([\\])};,]|\\b(else|then)\\b))" )
                                              ; ( "patterns"
                                                , `List
                                                    [ `Assoc
                                                        [ ( "include"
                                                          , `String "#expression-cont" )
                                                        ]
                                                    ] )
                                              ]
                                          ; `Assoc [ "include", `String "#others" ]
                                          ] )
                                    ]
                                ; `Assoc [ "include", `String "#attrset-contents" ]
                                ; `Assoc [ "include", `String "#others" ]
                                ] )
                          ]
                      ; `Assoc
                          [ "begin", `String "\\bin\\b"
                          ; ( "beginCaptures"
                            , `Assoc
                                [ "0", `Assoc [ "name", `String "keyword.other.nix" ] ] )
                          ; "end", `String "(?=([\\])};,]|\\b(else|then)\\b))"
                          ; ( "patterns"
                            , `List [ `Assoc [ "include", `String "#expression" ] ] )
                          ]
                      ] )
                ] )
          ; ( "if"
            , `Assoc
                [ "begin", `String "(?=\\bif\\b)"
                ; "end", `String "(?=([\\])};,]|\\b(else|then)\\b))"
                ; ( "patterns"
                  , `List
                      [ `Assoc
                          [ "begin", `String "\\bif\\b"
                          ; "end", `String "\\bth(?=en\\b)"
                          ; ( "beginCaptures"
                            , `Assoc
                                [ "0", `Assoc [ "name", `String "keyword.other.nix" ] ] )
                          ; ( "endCaptures"
                            , `Assoc
                                [ "0", `Assoc [ "name", `String "keyword.other.nix" ] ] )
                          ; ( "patterns"
                            , `List [ `Assoc [ "include", `String "#expression" ] ] )
                          ]
                      ; `Assoc
                          [ "begin", `String "(?<=th)en\\b"
                          ; "end", `String "\\bel(?=se\\b)"
                          ; ( "beginCaptures"
                            , `Assoc
                                [ "0", `Assoc [ "name", `String "keyword.other.nix" ] ] )
                          ; ( "endCaptures"
                            , `Assoc
                                [ "0", `Assoc [ "name", `String "keyword.other.nix" ] ] )
                          ; ( "patterns"
                            , `List [ `Assoc [ "include", `String "#expression" ] ] )
                          ]
                      ; `Assoc
                          [ "begin", `String "(?<=el)se\\b"
                          ; "end", `String "(?=([\\])};,]|\\b(else|then)\\b))"
                          ; ( "endCaptures"
                            , `Assoc
                                [ "0", `Assoc [ "name", `String "keyword.other.nix" ] ] )
                          ; ( "beginCaptures"
                            , `Assoc
                                [ "0", `Assoc [ "name", `String "keyword.other.nix" ] ] )
                          ; ( "patterns"
                            , `List [ `Assoc [ "include", `String "#expression" ] ] )
                          ]
                      ] )
                ] )
          ; ( "function-body"
            , `Assoc
                [ "begin", `String "(@\\s*([a-zA-Z\\_][a-zA-Z0-9\\_\\'\\-]*)\\s*)?(\\:)"
                ; "end", `String "(?=([\\])};,]|\\b(else|then)\\b))"
                ; "patterns", `List [ `Assoc [ "include", `String "#expression" ] ]
                ] )
          ; ( "comment"
            , `Assoc
                [ ( "patterns"
                  , `List
                      [ `Assoc
                          [ "name", `String "comment.block.nix"
                          ; "begin", `String "/\\*([^*]|\\*[^\\/])*"
                          ; "end", `String "\\*\\/"
                          ]
                      ; `Assoc
                          [ "name", `String "comment.line.number-sign.nix"
                          ; "begin", `String "\\#"
                          ; "end", `String "$"
                          ]
                      ] )
                ] )
          ; ( "interpolation"
            , `Assoc
                [ "name", `String "meta.embedded"
                ; "begin", `String "\\$\\{"
                ; ( "beginCaptures"
                  , `Assoc
                      [ ( "0"
                        , `Assoc
                            [ "name", `String "punctuation.section.embedded.begin.nix" ] )
                      ] )
                ; "end", `String "\\}"
                ; ( "endCaptures"
                  , `Assoc
                      [ ( "0"
                        , `Assoc
                            [ "name", `String "punctuation.section.embedded.end.nix" ] )
                      ] )
                ; "patterns", `List [ `Assoc [ "include", `String "#expression" ] ]
                ] )
          ; ( "string-quoted"
            , `Assoc
                [ "name", `String "string.quoted.double.nix"
                ; "begin", `String "\\\""
                ; "end", `String "\\\""
                ; ( "beginCaptures"
                  , `Assoc
                      [ ( "0"
                        , `Assoc
                            [ ( "name"
                              , `String "punctuation.definition.string.double.start.nix" )
                            ] )
                      ] )
                ; ( "endCaptures"
                  , `Assoc
                      [ ( "0"
                        , `Assoc
                            [ ( "name"
                              , `String "punctuation.definition.string.double.end.nix" )
                            ] )
                      ] )
                ; ( "patterns"
                  , `List
                      [ `Assoc
                          [ "match", `String "\\\\."
                          ; "name", `String "constant.character.escape.nix"
                          ]
                      ; `Assoc [ "include", `String "#interpolation" ]
                      ] )
                ] )
          ; ( "string"
            , `Assoc
                [ ( "patterns"
                  , `List
                      [ `Assoc
                          [ "begin", `String "(?=\\'\\')"
                          ; "end", `String "(?=([\\])};,]|\\b(else|then)\\b))"
                          ; ( "patterns"
                            , `List
                                [ `Assoc
                                    [ "name", `String "string.quoted.other.nix"
                                    ; "begin", `String "\\'\\'"
                                    ; "end", `String "\\'\\'(?!\\$|\\'|\\\\.)"
                                    ; ( "beginCaptures"
                                      , `Assoc
                                          [ ( "0"
                                            , `Assoc
                                                [ ( "name"
                                                  , `String
                                                      "punctuation.definition.string.other.start.nix"
                                                  )
                                                ] )
                                          ] )
                                    ; ( "endCaptures"
                                      , `Assoc
                                          [ ( "0"
                                            , `Assoc
                                                [ ( "name"
                                                  , `String
                                                      "punctuation.definition.string.other.end.nix"
                                                  )
                                                ] )
                                          ] )
                                    ; ( "patterns"
                                      , `List
                                          [ `Assoc
                                              [ ( "name"
                                                , `String "constant.character.escape.nix"
                                                )
                                              ; "match", `String "\\'\\'(\\$|\\'|\\\\.)"
                                              ]
                                          ; `Assoc [ "include", `String "#interpolation" ]
                                          ] )
                                    ]
                                ; `Assoc [ "include", `String "#expression-cont" ]
                                ] )
                          ]
                      ; `Assoc
                          [ "begin", `String "(?=\\\")"
                          ; "end", `String "(?=([\\])};,]|\\b(else|then)\\b))"
                          ; ( "patterns"
                            , `List
                                [ `Assoc [ "include", `String "#string-quoted" ]
                                ; `Assoc [ "include", `String "#expression-cont" ]
                                ] )
                          ]
                      ; `Assoc
                          [ ( "begin"
                            , `String
                                "(~?[a-zA-Z0-9\\.\\_\\-\\+]*(\\/[a-zA-Z0-9\\.\\_\\-\\+]+)+)"
                            )
                          ; ( "beginCaptures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc [ "name", `String "string.unquoted.path.nix" ]
                                  )
                                ] )
                          ; "end", `String "(?=([\\])};,]|\\b(else|then)\\b))"
                          ; ( "patterns"
                            , `List [ `Assoc [ "include", `String "#expression-cont" ] ] )
                          ]
                      ; `Assoc
                          [ ( "begin"
                            , `String
                                "(\\<[a-zA-Z0-9\\.\\_\\-\\+]+(\\/[a-zA-Z0-9\\.\\_\\-\\+]+)*\\>)"
                            )
                          ; ( "beginCaptures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc [ "name", `String "string.unquoted.spath.nix" ]
                                  )
                                ] )
                          ; "end", `String "(?=([\\])};,]|\\b(else|then)\\b))"
                          ; ( "patterns"
                            , `List [ `Assoc [ "include", `String "#expression-cont" ] ] )
                          ]
                      ; `Assoc
                          [ ( "begin"
                            , `String
                                "([a-zA-Z][a-zA-Z0-9\\+\\-\\.]*\\:[a-zA-Z0-9\\%\\/\\?\\:\\@\\&\\=\\+\\$\\,\\-\\_\\.\\!\\~\\*\\']+)"
                            )
                          ; ( "beginCaptures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc [ "name", `String "string.unquoted.url.nix" ] )
                                ] )
                          ; "end", `String "(?=([\\])};,]|\\b(else|then)\\b))"
                          ; ( "patterns"
                            , `List [ `Assoc [ "include", `String "#expression-cont" ] ] )
                          ]
                      ] )
                ] )
          ; ( "parameter-name"
            , `Assoc
                [ "match", `String "\\b[a-zA-Z\\_][a-zA-Z0-9\\_\\'\\-]*"
                ; ( "captures"
                  , `Assoc
                      [ "0", `Assoc [ "name", `String "variable.parameter.name.nix" ] ] )
                ] )
          ; ( "parameter-name-and-cont"
            , `Assoc
                [ "begin", `String "\\b[a-zA-Z\\_][a-zA-Z0-9\\_\\'\\-]*"
                ; "end", `String "(?=([\\])};,]|\\b(else|then)\\b))"
                ; ( "beginCaptures"
                  , `Assoc
                      [ "0", `Assoc [ "name", `String "variable.parameter.name.nix" ] ] )
                ; "patterns", `List [ `Assoc [ "include", `String "#expression-cont" ] ]
                ] )
          ; ( "attribute-name-single"
            , `Assoc
                [ "match", `String "\\b[a-zA-Z\\_][a-zA-Z0-9\\_\\'\\-]*"
                ; "name", `String "entity.other.attribute-name.single.nix"
                ] )
          ; ( "attribute-name"
            , `Assoc
                [ ( "patterns"
                  , `List
                      [ `Assoc
                          [ "match", `String "\\b[a-zA-Z\\_][a-zA-Z0-9\\_\\'\\-]*"
                          ; "name", `String "entity.other.attribute-name.multipart.nix"
                          ]
                      ; `Assoc [ "match", `String "\\." ]
                      ; `Assoc [ "include", `String "#string-quoted" ]
                      ; `Assoc [ "include", `String "#interpolation" ]
                      ] )
                ] )
          ; ( "function-parameter-default"
            , `Assoc
                [ "begin", `String "\\?"
                ; ( "beginCaptures"
                  , `Assoc [ "0", `Assoc [ "name", `String "keyword.operator.nix" ] ] )
                ; "end", `String "(?=[,}])"
                ; "patterns", `List [ `Assoc [ "include", `String "#expression" ] ]
                ] )
          ; ( "function-parameter"
            , `Assoc
                [ ( "patterns"
                  , `List
                      [ `Assoc
                          [ "begin", `String "(\\.\\.\\.)"
                          ; "end", `String "(,|(?=\\}))"
                          ; "name", `String "keyword.operator.nix"
                          ; "patterns", `List [ `Assoc [ "include", `String "#others" ] ]
                          ]
                      ; `Assoc
                          [ "begin", `String "\\b[a-zA-Z\\_][a-zA-Z0-9\\_\\'\\-]*"
                          ; ( "beginCaptures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "variable.parameter.function.1.nix" )
                                      ] )
                                ] )
                          ; "end", `String "(,|(?=\\}))"
                          ; ( "endCaptures"
                            , `Assoc
                                [ "0", `Assoc [ "name", `String "keyword.operator.nix" ] ]
                            )
                          ; ( "patterns"
                            , `List
                                [ `Assoc [ "include", `String "#whitespace" ]
                                ; `Assoc [ "include", `String "#comment" ]
                                ; `Assoc
                                    [ "include", `String "#function-parameter-default" ]
                                ; `Assoc [ "include", `String "#expression" ]
                                ] )
                          ]
                      ; `Assoc [ "include", `String "#others" ]
                      ] )
                ] )
          ; ( "attribute-inherit"
            , `Assoc
                [ "begin", `String "\\binherit\\b"
                ; ( "beginCaptures"
                  , `Assoc [ "0", `Assoc [ "name", `String "keyword.other.inherit.nix" ] ]
                  )
                ; "end", `String "\\;"
                ; ( "endCaptures"
                  , `Assoc
                      [ ( "0"
                        , `Assoc [ "name", `String "punctuation.terminator.inherit.nix" ]
                        )
                      ] )
                ; ( "patterns"
                  , `List
                      [ `Assoc
                          [ "begin", `String "\\("
                          ; "end", `String "(?=\\;)"
                          ; ( "beginCaptures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "name"
                                        , `String
                                            "punctuation.section.function.arguments.nix" )
                                      ] )
                                ] )
                          ; ( "patterns"
                            , `List
                                [ `Assoc
                                    [ "begin", `String "\\)"
                                    ; "end", `String "(?=\\;)"
                                    ; ( "beginCaptures"
                                      , `Assoc
                                          [ ( "0"
                                            , `Assoc
                                                [ ( "name"
                                                  , `String
                                                      "punctuation.section.function.arguments.nix"
                                                  )
                                                ] )
                                          ] )
                                    ; ( "patterns"
                                      , `List
                                          [ `Assoc [ "include", `String "#bad-reserved" ]
                                          ; `Assoc
                                              [ ( "include"
                                                , `String "#attribute-name-single" )
                                              ]
                                          ; `Assoc [ "include", `String "#others" ]
                                          ] )
                                    ]
                                ; `Assoc [ "include", `String "#expression" ]
                                ] )
                          ]
                      ; `Assoc
                          [ "begin", `String "(?=[a-zA-Z\\_])"
                          ; "end", `String "(?=\\;)"
                          ; ( "patterns"
                            , `List
                                [ `Assoc [ "include", `String "#bad-reserved" ]
                                ; `Assoc [ "include", `String "#attribute-name-single" ]
                                ; `Assoc [ "include", `String "#others" ]
                                ] )
                          ]
                      ; `Assoc [ "include", `String "#others" ]
                      ] )
                ] )
          ; ( "attribute-bind-from-equals"
            , `Assoc
                [ "begin", `String "\\="
                ; ( "beginCaptures"
                  , `Assoc [ "0", `Assoc [ "name", `String "keyword.operator.bind.nix" ] ]
                  )
                ; "end", `String "\\;"
                ; ( "endCaptures"
                  , `Assoc
                      [ "0", `Assoc [ "name", `String "punctuation.terminator.bind.nix" ]
                      ] )
                ; "patterns", `List [ `Assoc [ "include", `String "#expression" ] ]
                ] )
          ; ( "attribute-bind"
            , `Assoc
                [ ( "patterns"
                  , `List
                      [ `Assoc [ "include", `String "#attribute-name" ]
                      ; `Assoc [ "include", `String "#attribute-bind-from-equals" ]
                      ] )
                ] )
          ; ( "operator-unary"
            , `Assoc
                [ "name", `String "keyword.operator.unary.nix"; "match", `String "(!|-)" ]
            )
          ; ( "operator-binary"
            , `Assoc
                [ "name", `String "keyword.operator.nix"
                ; ( "match"
                  , `String
                      "(\\bor\\b|\\.|\\|\\>|\\<\\||==|!=|!|\\<\\=|\\<|\\>\\=|\\>|&&|\\|\\||-\\>|//|\\?|\\+\\+|-|\\*|/(?=([^*]|$))|\\+)"
                  )
                ] )
          ; ( "constants"
            , `Assoc
                [ ( "patterns"
                  , `List
                      [ `Assoc
                          [ "begin", `String "\\b(builtins|true|false|null)\\b"
                          ; "end", `String "(?=([\\])};,]|\\b(else|then)\\b))"
                          ; ( "beginCaptures"
                            , `Assoc
                                [ "0", `Assoc [ "name", `String "constant.language.nix" ]
                                ] )
                          ; ( "patterns"
                            , `List [ `Assoc [ "include", `String "#expression-cont" ] ] )
                          ]
                      ; `Assoc
                          [ ( "beginCaptures"
                            , `Assoc
                                [ "0", `Assoc [ "name", `String "support.function.nix" ] ]
                            )
                          ; ( "begin"
                            , `String
                                "\\b(scopedImport|import|isNull|abort|throw|baseNameOf|dirOf|removeAttrs|map|toString|derivationStrict|derivation)\\b"
                            )
                          ; "end", `String "(?=([\\])};,]|\\b(else|then)\\b))"
                          ; ( "patterns"
                            , `List [ `Assoc [ "include", `String "#expression-cont" ] ] )
                          ]
                      ; `Assoc
                          [ ( "beginCaptures"
                            , `Assoc
                                [ "0", `Assoc [ "name", `String "constant.numeric.nix" ] ]
                            )
                          ; "begin", `String "\\b[0-9]+\\b"
                          ; "end", `String "(?=([\\])};,]|\\b(else|then)\\b))"
                          ; ( "patterns"
                            , `List [ `Assoc [ "include", `String "#expression-cont" ] ] )
                          ]
                      ] )
                ] )
          ; "whitespace", `Assoc [ "match", `String "\\s+" ]
          ; "illegal", `Assoc [ "match", `String "."; "name", `String "invalid.illegal" ]
          ; ( "others"
            , `Assoc
                [ ( "patterns"
                  , `List
                      [ `Assoc [ "include", `String "#whitespace" ]
                      ; `Assoc [ "include", `String "#comment" ]
                      ; `Assoc [ "include", `String "#illegal" ]
                      ] )
                ] )
          ; ( "bad-reserved"
            , `Assoc
                [ ( "match"
                  , `String
                      "(?<![\\w'-])(if|then|else|assert|with|let|in|rec|inherit)(?![\\w'-])"
                  )
                ; "name", `String "invalid.illegal.reserved.nix"
                ] )
          ] )
    ]
;;

let html =
  `Assoc
    [ ( "information_for_contributors"
      , `List
          [ `String
              "This file has been converted from \
               https://github.com/textmate/html.tmbundle/blob/master/Syntaxes/HTML.plist"
          ; `String
              "If you want to provide a fix or improvement, please create a pull request \
               against the original repository."
          ; `String "Once accepted there, we are happy to receive an update request."
          ] )
    ; ( "version"
      , `String
          "https://github.com/textmate/html.tmbundle/commit/0c3d5ee54de3a993f747f54186b73a4d2d3c44a2"
      )
    ; "name", `String "HTML"
    ; "scopeName", `String "text.html.basic"
    ; ( "injections"
      , `Assoc
          [ ( "R:text.html - (comment.block, text.html meta.embedded, meta.tag.*.*.html, \
               meta.tag.*.*.*.html, meta.tag.*.*.*.*.html)"
            , `Assoc
                [ ( "comment"
                  , `String "Uses R: to ensure this matches after any other injections." )
                ; ( "patterns"
                  , `List
                      [ `Assoc
                          [ "match", `String "<"
                          ; "name", `String "invalid.illegal.bad-angle-bracket.html"
                          ]
                      ] )
                ] )
          ] )
    ; ( "patterns"
      , `List
          [ `Assoc [ "include", `String "#xml-processing" ]
          ; `Assoc [ "include", `String "#comment" ]
          ; `Assoc [ "include", `String "#doctype" ]
          ; `Assoc [ "include", `String "#cdata" ]
          ; `Assoc [ "include", `String "#tags-valid" ]
          ; `Assoc [ "include", `String "#tags-invalid" ]
          ; `Assoc [ "include", `String "#entities" ]
          ] )
    ; ( "repository"
      , `Assoc
          [ ( "attribute"
            , `Assoc
                [ ( "patterns"
                  , `List
                      [ `Assoc
                          [ ( "begin"
                            , `String
                                "(s(hape|cope|t(ep|art)|ize(s)?|p(ellcheck|an)|elected|lot|andbox|rc(set|doc|lang)?)|h(ttp-equiv|i(dden|gh)|e(ight|aders)|ref(lang)?)|n(o(nce|validate|module)|ame)|c(h(ecked|arset)|ite|o(nt(ent(editable)?|rols)|ords|l(s(pan)?|or))|lass|rossorigin)|t(ype(mustmatch)?|itle|a(rget|bindex)|ranslate)|i(s(map)?|n(tegrity|putmode)|tem(scope|type|id|prop|ref)|d)|op(timum|en)|d(i(sabled|r(name)?)|ownload|e(coding|f(er|ault))|at(etime|a)|raggable)|usemap|p(ing|oster|la(ysinline|ceholder)|attern|reload)|enctype|value|kind|for(m(novalidate|target|enctype|action|method)?)?|w(idth|rap)|l(ist|o(op|w)|a(ng|bel))|a(s(ync)?|c(ce(sskey|pt(-charset)?)|tion)|uto(c(omplete|apitalize)|play|focus)|l(t|low(usermedia|paymentrequest|fullscreen))|bbr)|r(ows(pan)?|e(versed|quired|ferrerpolicy|l|adonly))|m(in(length)?|u(ted|ltiple)|e(thod|dia)|a(nifest|x(length)?)))(?![\\w:-])"
                            )
                          ; ( "beginCaptures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ "name", `String "entity.other.attribute-name.html"
                                      ] )
                                ] )
                          ; "comment", `String "HTML5 attributes, not event handlers"
                          ; "end", `String "(?=\\s*+[^=\\s])"
                          ; "name", `String "meta.attribute.$1.html"
                          ; ( "patterns"
                            , `List
                                [ `Assoc [ "include", `String "#attribute-interior" ] ] )
                          ]
                      ; `Assoc
                          [ "begin", `String "style(?![\\w:-])"
                          ; ( "beginCaptures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ "name", `String "entity.other.attribute-name.html"
                                      ] )
                                ] )
                          ; "comment", `String "HTML5 style attribute"
                          ; "end", `String "(?=\\s*+[^=\\s])"
                          ; "name", `String "meta.attribute.style.html"
                          ; ( "patterns"
                            , `List
                                [ `Assoc
                                    [ "begin", `String "="
                                    ; ( "beginCaptures"
                                      , `Assoc
                                          [ ( "0"
                                            , `Assoc
                                                [ ( "name"
                                                  , `String
                                                      "punctuation.separator.key-value.html"
                                                  )
                                                ] )
                                          ] )
                                    ; "end", `String "(?<=[^\\s=])(?!\\s*=)|(?=/?>)"
                                    ; ( "patterns"
                                      , `List
                                          [ `Assoc
                                              [ "begin", `String "(?=[^\\s=<>`/]|/(?!>))"
                                              ; "end", `String "(?!\\G)"
                                              ; "name", `String "meta.embedded.line.css"
                                              ; ( "patterns"
                                                , `List
                                                    [ `Assoc
                                                        [ ( "captures"
                                                          , `Assoc
                                                              [ ( "0"
                                                                , `Assoc
                                                                    [ ( "name"
                                                                      , `String
                                                                          "source.css" )
                                                                    ] )
                                                              ] )
                                                        ; ( "match"
                                                          , `String
                                                              "([^\\s\"'=<>`/]|/(?!>))+" )
                                                        ; ( "name"
                                                          , `String "string.unquoted.html"
                                                          )
                                                        ]
                                                    ; `Assoc
                                                        [ "begin", `String "\""
                                                        ; ( "beginCaptures"
                                                          , `Assoc
                                                              [ ( "0"
                                                                , `Assoc
                                                                    [ ( "name"
                                                                      , `String
                                                                          "punctuation.definition.string.begin.html"
                                                                      )
                                                                    ] )
                                                              ] )
                                                        ; ( "contentName"
                                                          , `String "source.css" )
                                                        ; "end", `String "(\")"
                                                        ; ( "endCaptures"
                                                          , `Assoc
                                                              [ ( "0"
                                                                , `Assoc
                                                                    [ ( "name"
                                                                      , `String
                                                                          "punctuation.definition.string.end.html"
                                                                      )
                                                                    ] )
                                                              ; ( "1"
                                                                , `Assoc
                                                                    [ ( "name"
                                                                      , `String
                                                                          "source.css" )
                                                                    ] )
                                                              ] )
                                                        ; ( "name"
                                                          , `String
                                                              "string.quoted.double.html"
                                                          )
                                                        ; ( "patterns"
                                                          , `List
                                                              [ `Assoc
                                                                  [ ( "include"
                                                                    , `String "#entities"
                                                                    )
                                                                  ]
                                                              ] )
                                                        ]
                                                    ; `Assoc
                                                        [ "begin", `String "'"
                                                        ; ( "beginCaptures"
                                                          , `Assoc
                                                              [ ( "0"
                                                                , `Assoc
                                                                    [ ( "name"
                                                                      , `String
                                                                          "punctuation.definition.string.begin.html"
                                                                      )
                                                                    ] )
                                                              ] )
                                                        ; ( "contentName"
                                                          , `String "source.css" )
                                                        ; "end", `String "(')"
                                                        ; ( "endCaptures"
                                                          , `Assoc
                                                              [ ( "0"
                                                                , `Assoc
                                                                    [ ( "name"
                                                                      , `String
                                                                          "punctuation.definition.string.end.html"
                                                                      )
                                                                    ] )
                                                              ; ( "1"
                                                                , `Assoc
                                                                    [ ( "name"
                                                                      , `String
                                                                          "source.css" )
                                                                    ] )
                                                              ] )
                                                        ; ( "name"
                                                          , `String
                                                              "string.quoted.single.html"
                                                          )
                                                        ; ( "patterns"
                                                          , `List
                                                              [ `Assoc
                                                                  [ ( "include"
                                                                    , `String "#entities"
                                                                    )
                                                                  ]
                                                              ] )
                                                        ]
                                                    ] )
                                              ]
                                          ; `Assoc
                                              [ "match", `String "="
                                              ; ( "name"
                                                , `String
                                                    "invalid.illegal.unexpected-equals-sign.html"
                                                )
                                              ]
                                          ] )
                                    ]
                                ] )
                          ]
                      ; `Assoc
                          [ ( "begin"
                            , `String
                                "on(s(croll|t(orage|alled)|u(spend|bmit)|e(curitypolicyviolation|ek(ing|ed)|lect))|hashchange|c(hange|o(ntextmenu|py)|u(t|echange)|l(ick|ose)|an(cel|play(through)?))|t(imeupdate|oggle)|in(put|valid)|o(nline|ffline)|d(urationchange|r(op|ag(start|over|e(n(ter|d)|xit)|leave)?)|blclick)|un(handledrejection|load)|p(opstate|lay(ing)?|a(ste|use|ge(show|hide))|rogress)|e(nded|rror|mptied)|volumechange|key(down|up|press)|focus|w(heel|aiting)|l(oad(start|e(nd|d(data|metadata)))?|anguagechange)|a(uxclick|fterprint|bort)|r(e(s(ize|et)|jectionhandled)|atechange)|m(ouse(o(ut|ver)|down|up|enter|leave|move)|essage(error)?)|b(efore(unload|print)|lur))(?![\\w:-])"
                            )
                          ; ( "beginCaptures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ "name", `String "entity.other.attribute-name.html"
                                      ] )
                                ] )
                          ; "comment", `String "HTML5 attributes, event handlers"
                          ; "end", `String "(?=\\s*+[^=\\s])"
                          ; "name", `String "meta.attribute.event-handler.$1.html"
                          ; ( "patterns"
                            , `List
                                [ `Assoc
                                    [ "begin", `String "="
                                    ; ( "beginCaptures"
                                      , `Assoc
                                          [ ( "0"
                                            , `Assoc
                                                [ ( "name"
                                                  , `String
                                                      "punctuation.separator.key-value.html"
                                                  )
                                                ] )
                                          ] )
                                    ; "end", `String "(?<=[^\\s=])(?!\\s*=)|(?=/?>)"
                                    ; ( "patterns"
                                      , `List
                                          [ `Assoc
                                              [ "begin", `String "(?=[^\\s=<>`/]|/(?!>))"
                                              ; "end", `String "(?!\\G)"
                                              ; "name", `String "meta.embedded.line.js"
                                              ; ( "patterns"
                                                , `List
                                                    [ `Assoc
                                                        [ ( "captures"
                                                          , `Assoc
                                                              [ ( "0"
                                                                , `Assoc
                                                                    [ ( "name"
                                                                      , `String
                                                                          "source.js" )
                                                                    ] )
                                                              ; ( "1"
                                                                , `Assoc
                                                                    [ ( "patterns"
                                                                      , `List
                                                                          [ `Assoc
                                                                              [ ( "include"
                                                                                , `String
                                                                                    "source.js"
                                                                                )
                                                                              ]
                                                                          ] )
                                                                    ] )
                                                              ] )
                                                        ; ( "match"
                                                          , `String
                                                              "(([^\\s\"'=<>`/]|/(?!>))+)"
                                                          )
                                                        ; ( "name"
                                                          , `String "string.unquoted.html"
                                                          )
                                                        ]
                                                    ; `Assoc
                                                        [ "begin", `String "\""
                                                        ; ( "beginCaptures"
                                                          , `Assoc
                                                              [ ( "0"
                                                                , `Assoc
                                                                    [ ( "name"
                                                                      , `String
                                                                          "punctuation.definition.string.begin.html"
                                                                      )
                                                                    ] )
                                                              ] )
                                                        ; ( "contentName"
                                                          , `String "source.js" )
                                                        ; "end", `String "(\")"
                                                        ; ( "endCaptures"
                                                          , `Assoc
                                                              [ ( "0"
                                                                , `Assoc
                                                                    [ ( "name"
                                                                      , `String
                                                                          "punctuation.definition.string.end.html"
                                                                      )
                                                                    ] )
                                                              ; ( "1"
                                                                , `Assoc
                                                                    [ ( "name"
                                                                      , `String
                                                                          "source.js" )
                                                                    ] )
                                                              ] )
                                                        ; ( "name"
                                                          , `String
                                                              "string.quoted.double.html"
                                                          )
                                                        ; ( "patterns"
                                                          , `List
                                                              [ `Assoc
                                                                  [ ( "captures"
                                                                    , `Assoc
                                                                        [ ( "0"
                                                                          , `Assoc
                                                                              [ ( "patterns"
                                                                                , `List
                                                                                    [ `Assoc
                                                                                        [ ( 
                                                                                          "include"
                                                                                        , `String
                                                                                          "source.js"
                                                                                          )
                                                                                        ]
                                                                                    ] )
                                                                              ] )
                                                                        ] )
                                                                  ; ( "match"
                                                                    , `String
                                                                        "([^\\n\"/]|/(?![/*]))+"
                                                                    )
                                                                  ]
                                                              ; `Assoc
                                                                  [ "begin", `String "//"
                                                                  ; ( "beginCaptures"
                                                                    , `Assoc
                                                                        [ ( "0"
                                                                          , `Assoc
                                                                              [ ( "name"
                                                                                , `String
                                                                                    "punctuation.definition.comment.js"
                                                                                )
                                                                              ] )
                                                                        ] )
                                                                  ; ( "end"
                                                                    , `String "(?=\")|\\n"
                                                                    )
                                                                  ; ( "name"
                                                                    , `String
                                                                        "comment.line.double-slash.js"
                                                                    )
                                                                  ]
                                                              ; `Assoc
                                                                  [ ( "begin"
                                                                    , `String "/\\*" )
                                                                  ; ( "beginCaptures"
                                                                    , `Assoc
                                                                        [ ( "0"
                                                                          , `Assoc
                                                                              [ ( "name"
                                                                                , `String
                                                                                    "punctuation.definition.comment.begin.js"
                                                                                )
                                                                              ] )
                                                                        ] )
                                                                  ; ( "end"
                                                                    , `String
                                                                        "(?=\")|\\*/" )
                                                                  ; ( "endCaptures"
                                                                    , `Assoc
                                                                        [ ( "0"
                                                                          , `Assoc
                                                                              [ ( "name"
                                                                                , `String
                                                                                    "punctuation.definition.comment.end.js"
                                                                                )
                                                                              ] )
                                                                        ] )
                                                                  ; ( "name"
                                                                    , `String
                                                                        "comment.block.js"
                                                                    )
                                                                  ]
                                                              ] )
                                                        ]
                                                    ; `Assoc
                                                        [ "begin", `String "'"
                                                        ; ( "beginCaptures"
                                                          , `Assoc
                                                              [ ( "0"
                                                                , `Assoc
                                                                    [ ( "name"
                                                                      , `String
                                                                          "punctuation.definition.string.begin.html"
                                                                      )
                                                                    ] )
                                                              ] )
                                                        ; ( "contentName"
                                                          , `String "source.js" )
                                                        ; "end", `String "(')"
                                                        ; ( "endCaptures"
                                                          , `Assoc
                                                              [ ( "0"
                                                                , `Assoc
                                                                    [ ( "name"
                                                                      , `String
                                                                          "punctuation.definition.string.end.html"
                                                                      )
                                                                    ] )
                                                              ; ( "1"
                                                                , `Assoc
                                                                    [ ( "name"
                                                                      , `String
                                                                          "source.js" )
                                                                    ] )
                                                              ] )
                                                        ; ( "name"
                                                          , `String
                                                              "string.quoted.single.html"
                                                          )
                                                        ; ( "patterns"
                                                          , `List
                                                              [ `Assoc
                                                                  [ ( "captures"
                                                                    , `Assoc
                                                                        [ ( "0"
                                                                          , `Assoc
                                                                              [ ( "patterns"
                                                                                , `List
                                                                                    [ `Assoc
                                                                                        [ ( 
                                                                                          "include"
                                                                                        , `String
                                                                                          "source.js"
                                                                                          )
                                                                                        ]
                                                                                    ] )
                                                                              ] )
                                                                        ] )
                                                                  ; ( "match"
                                                                    , `String
                                                                        "([^\\n'/]|/(?![/*]))+"
                                                                    )
                                                                  ]
                                                              ; `Assoc
                                                                  [ "begin", `String "//"
                                                                  ; ( "beginCaptures"
                                                                    , `Assoc
                                                                        [ ( "0"
                                                                          , `Assoc
                                                                              [ ( "name"
                                                                                , `String
                                                                                    "punctuation.definition.comment.js"
                                                                                )
                                                                              ] )
                                                                        ] )
                                                                  ; ( "end"
                                                                    , `String "(?=')|\\n"
                                                                    )
                                                                  ; ( "name"
                                                                    , `String
                                                                        "comment.line.double-slash.js"
                                                                    )
                                                                  ]
                                                              ; `Assoc
                                                                  [ ( "begin"
                                                                    , `String "/\\*" )
                                                                  ; ( "beginCaptures"
                                                                    , `Assoc
                                                                        [ ( "0"
                                                                          , `Assoc
                                                                              [ ( "name"
                                                                                , `String
                                                                                    "punctuation.definition.comment.begin.js"
                                                                                )
                                                                              ] )
                                                                        ] )
                                                                  ; ( "end"
                                                                    , `String "(?=')|\\*/"
                                                                    )
                                                                  ; ( "endCaptures"
                                                                    , `Assoc
                                                                        [ ( "0"
                                                                          , `Assoc
                                                                              [ ( "name"
                                                                                , `String
                                                                                    "punctuation.definition.comment.end.js"
                                                                                )
                                                                              ] )
                                                                        ] )
                                                                  ; ( "name"
                                                                    , `String
                                                                        "comment.block.js"
                                                                    )
                                                                  ]
                                                              ] )
                                                        ]
                                                    ] )
                                              ]
                                          ; `Assoc
                                              [ "match", `String "="
                                              ; ( "name"
                                                , `String
                                                    "invalid.illegal.unexpected-equals-sign.html"
                                                )
                                              ]
                                          ] )
                                    ]
                                ] )
                          ]
                      ; `Assoc
                          [ "begin", `String "(data-[a-z\\-]+)(?![\\w:-])"
                          ; ( "beginCaptures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ "name", `String "entity.other.attribute-name.html"
                                      ] )
                                ] )
                          ; "comment", `String "HTML5 attributes, data-*"
                          ; "end", `String "(?=\\s*+[^=\\s])"
                          ; "name", `String "meta.attribute.data-x.$1.html"
                          ; ( "patterns"
                            , `List
                                [ `Assoc [ "include", `String "#attribute-interior" ] ] )
                          ]
                      ; `Assoc
                          [ "begin", `String "(align|bgcolor|border)(?![\\w:-])"
                          ; ( "beginCaptures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "name"
                                        , `String
                                            "invalid.deprecated.entity.other.attribute-name.html"
                                        )
                                      ] )
                                ] )
                          ; "comment", `String "HTML attributes, deprecated"
                          ; "end", `String "(?=\\s*+[^=\\s])"
                          ; "name", `String "meta.attribute.$1.html"
                          ; ( "patterns"
                            , `List
                                [ `Assoc [ "include", `String "#attribute-interior" ] ] )
                          ]
                      ; `Assoc
                          [ ( "begin"
                            , `String
                                "([^\\x{0020}\"'<>/=\\x{0000}-\\x{001F}\\x{007F}-\\x{009F}\\x{FDD0}-\\x{FDEF}\\x{FFFE}\\x{FFFF}\\x{1FFFE}\\x{1FFFF}\\x{2FFFE}\\x{2FFFF}\\x{3FFFE}\\x{3FFFF}\\x{4FFFE}\\x{4FFFF}\\x{5FFFE}\\x{5FFFF}\\x{6FFFE}\\x{6FFFF}\\x{7FFFE}\\x{7FFFF}\\x{8FFFE}\\x{8FFFF}\\x{9FFFE}\\x{9FFFF}\\x{AFFFE}\\x{AFFFF}\\x{BFFFE}\\x{BFFFF}\\x{CFFFE}\\x{CFFFF}\\x{DFFFE}\\x{DFFFF}\\x{EFFFE}\\x{EFFFF}\\x{FFFFE}\\x{FFFFF}\\x{10FFFE}\\x{10FFFF}]+)"
                            )
                          ; ( "beginCaptures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ "name", `String "entity.other.attribute-name.html"
                                      ] )
                                ] )
                          ; "comment", `String "Anything else that is valid"
                          ; "end", `String "(?=\\s*+[^=\\s])"
                          ; "name", `String "meta.attribute.unrecognized.$1.html"
                          ; ( "patterns"
                            , `List
                                [ `Assoc [ "include", `String "#attribute-interior" ] ] )
                          ]
                      ; `Assoc
                          [ "match", `String "[^\\s>]+"
                          ; ( "name"
                            , `String "invalid.illegal.character-not-allowed-here.html" )
                          ]
                      ] )
                ] )
          ; ( "attribute-interior"
            , `Assoc
                [ ( "patterns"
                  , `List
                      [ `Assoc
                          [ "begin", `String "="
                          ; ( "beginCaptures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.separator.key-value.html" )
                                      ] )
                                ] )
                          ; "end", `String "(?<=[^\\s=])(?!\\s*=)|(?=/?>)"
                          ; ( "patterns"
                            , `List
                                [ `Assoc
                                    [ "match", `String "([^\\s\"'=<>`/]|/(?!>))+"
                                    ; "name", `String "string.unquoted.html"
                                    ]
                                ; `Assoc
                                    [ "begin", `String "\""
                                    ; ( "beginCaptures"
                                      , `Assoc
                                          [ ( "0"
                                            , `Assoc
                                                [ ( "name"
                                                  , `String
                                                      "punctuation.definition.string.begin.html"
                                                  )
                                                ] )
                                          ] )
                                    ; "end", `String "\""
                                    ; ( "endCaptures"
                                      , `Assoc
                                          [ ( "0"
                                            , `Assoc
                                                [ ( "name"
                                                  , `String
                                                      "punctuation.definition.string.end.html"
                                                  )
                                                ] )
                                          ] )
                                    ; "name", `String "string.quoted.double.html"
                                    ; ( "patterns"
                                      , `List
                                          [ `Assoc [ "include", `String "#entities" ] ] )
                                    ]
                                ; `Assoc
                                    [ "begin", `String "'"
                                    ; ( "beginCaptures"
                                      , `Assoc
                                          [ ( "0"
                                            , `Assoc
                                                [ ( "name"
                                                  , `String
                                                      "punctuation.definition.string.begin.html"
                                                  )
                                                ] )
                                          ] )
                                    ; "end", `String "'"
                                    ; ( "endCaptures"
                                      , `Assoc
                                          [ ( "0"
                                            , `Assoc
                                                [ ( "name"
                                                  , `String
                                                      "punctuation.definition.string.end.html"
                                                  )
                                                ] )
                                          ] )
                                    ; "name", `String "string.quoted.single.html"
                                    ; ( "patterns"
                                      , `List
                                          [ `Assoc [ "include", `String "#entities" ] ] )
                                    ]
                                ; `Assoc
                                    [ "match", `String "="
                                    ; ( "name"
                                      , `String
                                          "invalid.illegal.unexpected-equals-sign.html" )
                                    ]
                                ] )
                          ]
                      ] )
                ] )
          ; ( "cdata"
            , `Assoc
                [ "begin", `String "<!\\[CDATA\\["
                ; ( "beginCaptures"
                  , `Assoc
                      [ ( "0"
                        , `Assoc
                            [ "name", `String "punctuation.definition.tag.begin.html" ] )
                      ] )
                ; "contentName", `String "string.other.inline-data.html"
                ; "end", `String "]]>"
                ; ( "endCaptures"
                  , `Assoc
                      [ ( "0"
                        , `Assoc [ "name", `String "punctuation.definition.tag.end.html" ]
                        )
                      ] )
                ; "name", `String "meta.tag.metadata.cdata.html"
                ] )
          ; ( "comment"
            , `Assoc
                [ "begin", `String "<!--"
                ; ( "captures"
                  , `Assoc
                      [ ( "0"
                        , `Assoc [ "name", `String "punctuation.definition.comment.html" ]
                        )
                      ] )
                ; "end", `String "-->"
                ; "name", `String "comment.block.html"
                ; ( "patterns"
                  , `List
                      [ `Assoc
                          [ "match", `String "\\G-?>"
                          ; ( "name"
                            , `String "invalid.illegal.characters-not-allowed-here.html" )
                          ]
                      ; `Assoc
                          [ "match", `String "<!--(?!>)|<!-(?=-->)"
                          ; ( "name"
                            , `String "invalid.illegal.characters-not-allowed-here.html" )
                          ]
                      ; `Assoc
                          [ "match", `String "--!>"
                          ; ( "name"
                            , `String "invalid.illegal.characters-not-allowed-here.html" )
                          ]
                      ] )
                ] )
          ; ( "core-minus-invalid"
            , `Assoc
                [ ( "comment"
                  , `String
                      "This should be the root pattern array includes minus #tags-invalid"
                  )
                ; ( "patterns"
                  , `List
                      [ `Assoc [ "include", `String "#xml-processing" ]
                      ; `Assoc [ "include", `String "#comment" ]
                      ; `Assoc [ "include", `String "#doctype" ]
                      ; `Assoc [ "include", `String "#cdata" ]
                      ; `Assoc [ "include", `String "#tags-valid" ]
                      ; `Assoc [ "include", `String "#entities" ]
                      ] )
                ] )
          ; ( "doctype"
            , `Assoc
                [ "begin", `String "<!(?=(?i:DOCTYPE\\s))"
                ; ( "beginCaptures"
                  , `Assoc
                      [ ( "0"
                        , `Assoc
                            [ "name", `String "punctuation.definition.tag.begin.html" ] )
                      ] )
                ; "end", `String ">"
                ; ( "endCaptures"
                  , `Assoc
                      [ ( "0"
                        , `Assoc [ "name", `String "punctuation.definition.tag.end.html" ]
                        )
                      ] )
                ; "name", `String "meta.tag.metadata.doctype.html"
                ; ( "patterns"
                  , `List
                      [ `Assoc
                          [ "match", `String "\\G(?i:DOCTYPE)"
                          ; "name", `String "entity.name.tag.html"
                          ]
                      ; `Assoc
                          [ "begin", `String "\""
                          ; "end", `String "\""
                          ; "name", `String "string.quoted.double.html"
                          ]
                      ; `Assoc
                          [ "match", `String "[^\\s>]+"
                          ; "name", `String "entity.other.attribute-name.html"
                          ]
                      ] )
                ] )
          ; ( "entities"
            , `Assoc
                [ ( "patterns"
                  , `List
                      [ `Assoc
                          [ ( "captures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.definition.entity.html" )
                                      ] )
                                ; ( "912"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.definition.entity.html" )
                                      ] )
                                ] )
                          ; ( "comment"
                            , `String
                                "Yes this is a bit ridiculous, there are quite a lot of \
                                 these" )
                          ; ( "match"
                            , `String
                                "(?x)\n\
                                 \t\t\t\t\t\t(&)\t(?=[a-zA-Z])\n\
                                 \t\t\t\t\t\t(\n\
                                 \t\t\t\t\t\t\t(a(s(ymp(eq)?|cr|t)|n(d(slope|d|v|and)?|g(s(t|ph)|zarr|e|le|rt(vb(d)?)?|msd(a(h|c|d|e|f|a|g|b))?)?)|c(y|irc|d|ute|E)?|tilde|o(pf|gon)|uml|p(id|os|prox(eq)?|e|E|acir)?|elig|f(r)?|w(conint|int)|l(pha|e(ph|fsym))|acute|ring|grave|m(p|a(cr|lg))|breve)|A(s(sign|cr)|nd|MP|c(y|irc)|tilde|o(pf|gon)|uml|pplyFunction|fr|Elig|lpha|acute|ring|grave|macr|breve))\n\
                                 \t\t\t\t\t\t  | \
                                 (B(scr|cy|opf|umpeq|e(cause|ta|rnoullis)|fr|a(ckslash|r(v|wed))|reve)|b(s(cr|im(e)?|ol(hsub|b)?|emi)|n(ot|e(quiv)?)|c(y|ong)|ig(s(tar|qcup)|c(irc|up|ap)|triangle(down|up)|o(times|dot|plus)|uplus|vee|wedge)|o(t(tom)?|pf|wtie|x(h(d|u|D|U)?|times|H(d|u|D|U)?|d(R|l|r|L)|u(R|l|r|L)|plus|D(R|l|r|L)|v(R|h|H|l|r|L)?|U(R|l|r|L)|V(R|h|H|l|r|L)?|minus|box))|Not|dquo|u(ll(et)?|mp(e(q)?|E)?)|prime|e(caus(e)?|t(h|ween|a)|psi|rnou|mptyv)|karow|fr|l(ock|k(1(2|4)|34)|a(nk|ck(square|triangle(down|left|right)?|lozenge)))|a(ck(sim(eq)?|cong|prime|epsilon)|r(vee|wed(ge)?))|r(eve|vbar)|brk(tbrk)?))\n\
                                 \t\t\t\t\t\t  | \
                                 (c(s(cr|u(p(e)?|b(e)?))|h(cy|i|eck(mark)?)|ylcty|c(irc|ups(sm)?|edil|a(ps|ron))|tdot|ir(scir|c(eq|le(d(R|circ|S|dash|ast)|arrow(left|right)))?|e|fnint|E|mid)?|o(n(int|g(dot)?)|p(y(sr)?|f|rod)|lon(e(q)?)?|m(p(fn|le(xes|ment))?|ma(t)?))|dot|u(darr(l|r)|p(s|c(up|ap)|or|dot|brcap)?|e(sc|pr)|vee|wed|larr(p)?|r(vearrow(left|right)|ly(eq(succ|prec)|vee|wedge)|arr(m)?|ren))|e(nt(erdot)?|dil|mptyv)|fr|w(conint|int)|lubs(uit)?|a(cute|p(s|c(up|ap)|dot|and|brcup)?|r(on|et))|r(oss|arr))|C(scr|hi|c(irc|onint|edil|aron)|ircle(Minus|Times|Dot|Plus)|Hcy|o(n(tourIntegral|int|gruent)|unterClockwiseContourIntegral|p(f|roduct)|lon(e)?)|dot|up(Cap)?|OPY|e(nterDot|dilla)|fr|lo(seCurly(DoubleQuote|Quote)|ckwiseContourIntegral)|a(yleys|cute|p(italDifferentialD)?)|ross))\n\
                                 \t\t\t\t\t\t  | \
                                 (d(s(c(y|r)|trok|ol)|har(l|r)|c(y|aron)|t(dot|ri(f)?)|i(sin|e|v(ide(ontimes)?|onx)?|am(s|ond(suit)?)?|gamma)|Har|z(cy|igrarr)|o(t(square|plus|eq(dot)?|minus)?|ublebarwedge|pf|wn(harpoon(left|right)|downarrows|arrow)|llar)|d(otseq|a(rr|gger))?|u(har|arr)|jcy|e(lta|g|mptyv)|f(isht|r)|wangle|lc(orn|rop)|a(sh(v)?|leth|rr|gger)|r(c(orn|rop)|bkarow)|b(karow|lac)|Arr)|D(s(cr|trok)|c(y|aron)|Scy|i(fferentialD|a(critical(Grave|Tilde|Do(t|ubleAcute)|Acute)|mond))|o(t(Dot|Equal)?|uble(Right(Tee|Arrow)|ContourIntegral|Do(t|wnArrow)|Up(DownArrow|Arrow)|VerticalBar|L(ong(RightArrow|Left(RightArrow|Arrow))|eft(RightArrow|Tee|Arrow)))|pf|wn(Right(TeeVector|Vector(Bar)?)|Breve|Tee(Arrow)?|arrow|Left(RightVector|TeeVector|Vector(Bar)?)|Arrow(Bar|UpArrow)?))|Zcy|el(ta)?|D(otrahd)?|Jcy|fr|a(shv|rr|gger)))\n\
                                 \t\t\t\t\t\t  | \
                                 (e(s(cr|im|dot)|n(sp|g)|c(y|ir(c)?|olon|aron)|t(h|a)|o(pf|gon)|dot|u(ro|ml)|p(si(v|lon)?|lus|ar(sl)?)|e|D(ot|Dot)|q(s(im|lant(less|gtr))|c(irc|olon)|u(iv(DD)?|est|als)|vparsl)|f(Dot|r)|l(s(dot)?|inters|l)?|a(ster|cute)|r(Dot|arr)|g(s(dot)?|rave)?|x(cl|ist|p(onentiale|ectation))|m(sp(1(3|4))?|pty(set|v)?|acr))|E(s(cr|im)|c(y|irc|aron)|ta|o(pf|gon)|NG|dot|uml|TH|psilon|qu(ilibrium|al(Tilde)?)|fr|lement|acute|grave|x(ists|ponentialE)|m(pty(SmallSquare|VerySmallSquare)|acr)))\n\
                                 \t\t\t\t\t\t  | \
                                 (f(scr|nof|cy|ilig|o(pf|r(k(v)?|all))|jlig|partint|emale|f(ilig|l(ig|lig)|r)|l(tns|lig|at)|allingdotseq|r(own|a(sl|c(1(2|8|3|4|5|6)|78|2(3|5)|3(8|4|5)|45|5(8|6)))))|F(scr|cy|illed(SmallSquare|VerySmallSquare)|o(uriertrf|pf|rAll)|fr))\n\
                                 \t\t\t\t\t\t  | \
                                 (G(scr|c(y|irc|edil)|t|opf|dot|T|Jcy|fr|amma(d)?|reater(Greater|SlantEqual|Tilde|Equal(Less)?|FullEqual|Less)|g|breve)|g(s(cr|im(e|l)?)|n(sim|e(q(q)?)?|E|ap(prox)?)|c(y|irc)|t(c(c|ir)|dot|quest|lPar|r(sim|dot|eq(qless|less)|less|a(pprox|rr)))?|imel|opf|dot|jcy|e(s(cc|dot(o(l)?)?|l(es)?)?|q(slant|q)?|l)?|v(nE|ertneqq)|fr|E(l)?|l(j|E|a)?|a(cute|p|mma(d)?)|rave|g(g)?|breve))\n\
                                 \t\t\t\t\t\t  | \
                                 (h(s(cr|trok|lash)|y(phen|bull)|circ|o(ok(leftarrow|rightarrow)|pf|arr|rbar|mtht)|e(llip|arts(uit)?|rcon)|ks(earow|warow)|fr|a(irsp|lf|r(dcy|r(cir|w)?)|milt)|bar|Arr)|H(s(cr|trok)|circ|ilbertSpace|o(pf|rizontalLine)|ump(DownHump|Equal)|fr|a(cek|t)|ARDcy))\n\
                                 \t\t\t\t\t\t  | \
                                 (i(s(cr|in(s(v)?|dot|v|E)?)|n(care|t(cal|prod|e(rcal|gers)|larhk)?|odot|fin(tie)?)?|c(y|irc)?|t(ilde)?|i(nfin|i(nt|int)|ota)?|o(cy|ta|pf|gon)|u(kcy|ml)|jlig|prod|e(cy|xcl)|quest|f(f|r)|acute|grave|m(of|ped|a(cr|th|g(part|e|line))))|I(scr|n(t(e(rsection|gral))?|visible(Comma|Times))|c(y|irc)|tilde|o(ta|pf|gon)|dot|u(kcy|ml)|Ocy|Jlig|fr|Ecy|acute|grave|m(plies|a(cr|ginaryI))?))\n\
                                 \t\t\t\t\t\t  | \
                                 (j(s(cr|ercy)|c(y|irc)|opf|ukcy|fr|math)|J(s(cr|ercy)|c(y|irc)|opf|ukcy|fr))\n\
                                 \t\t\t\t\t\t  | \
                                 (k(scr|hcy|c(y|edil)|opf|jcy|fr|appa(v)?|green)|K(scr|c(y|edil)|Hcy|opf|Jcy|fr|appa))\n\
                                 \t\t\t\t\t\t  | \
                                 (l(s(h|cr|trok|im(e|g)?|q(uo(r)?|b)|aquo)|h(ar(d|u(l)?)|blk)|n(sim|e(q(q)?)?|E|ap(prox)?)|c(y|ub|e(il|dil)|aron)|Barr|t(hree|c(c|ir)|imes|dot|quest|larr|r(i(e|f)?|Par))?|Har|o(ng(left(arrow|rightarrow)|rightarrow|mapsto)|times|z(enge|f)?|oparrow(left|right)|p(f|lus|ar)|w(ast|bar)|a(ng|rr)|brk)|d(sh|ca|quo(r)?|r(dhar|ushar))|ur(dshar|uhar)|jcy|par(lt)?|e(s(s(sim|dot|eq(qgtr|gtr)|approx|gtr)|cc|dot(o(r)?)?|g(es)?)?|q(slant|q)?|ft(harpoon(down|up)|threetimes|leftarrows|arrow(tail)?|right(squigarrow|harpoons|arrow(s)?))|g)?|v(nE|ertneqq)|f(isht|loor|r)|E(g)?|l(hard|corner|tri|arr)?|a(ng(d|le)?|cute|t(e(s)?|ail)?|p|emptyv|quo|rr(sim|hk|tl|pl|fs|lp|b(fs)?)?|gran|mbda)|r(har(d)?|corner|tri|arr|m)|g(E)?|m(idot|oust(ache)?)|b(arr|r(k(sl(d|u)|e)|ac(e|k))|brk)|A(tail|arr|rr))|L(s(h|cr|trok)|c(y|edil|aron)|t|o(ng(RightArrow|left(arrow|rightarrow)|rightarrow|Left(RightArrow|Arrow))|pf|wer(RightArrow|LeftArrow))|T|e(ss(Greater|SlantEqual|Tilde|EqualGreater|FullEqual|Less)|ft(Right(Vector|Arrow)|Ceiling|T(ee(Vector|Arrow)?|riangle(Bar|Equal)?)|Do(ubleBracket|wn(TeeVector|Vector(Bar)?))|Up(TeeVector|DownVector|Vector(Bar)?)|Vector(Bar)?|arrow|rightarrow|Floor|A(ngleBracket|rrow(RightArrow|Bar)?)))|Jcy|fr|l(eftarrow)?|a(ng|cute|placetrf|rr|mbda)|midot))\n\
                                 \t\t\t\t\t\t  | \
                                 (M(scr|cy|inusPlus|opf|u|e(diumSpace|llintrf)|fr|ap)|m(s(cr|tpos)|ho|nplus|c(y|omma)|i(nus(d(u)?|b)?|cro|d(cir|dot|ast)?)|o(dels|pf)|dash|u(ltimap|map)?|p|easuredangle|DDot|fr|l(cp|dr)|a(cr|p(sto(down|up|left)?)?|l(t(ese)?|e)|rker)))\n\
                                 \t\t\t\t\t\t  | \
                                 (n(s(hort(parallel|mid)|c(cue|e|r)?|im(e(q)?)?|u(cc(eq)?|p(set(eq(q)?)?|e|E)?|b(set(eq(q)?)?|e|E)?)|par|qsu(pe|be)|mid)|Rightarrow|h(par|arr|Arr)|G(t(v)?|g)|c(y|ong(dot)?|up|edil|a(p|ron))|t(ilde|lg|riangle(left(eq)?|right(eq)?)|gl)|i(s(d)?|v)?|o(t(ni(v(c|a|b))?|in(dot|v(c|a|b)|E)?)?|pf)|dash|u(m(sp|ero)?)?|jcy|p(olint|ar(sl|t|allel)?|r(cue|e(c(eq)?)?)?)|e(s(im|ear)|dot|quiv|ar(hk|r(ow)?)|xist(s)?|Arr)?|v(sim|infin|Harr|dash|Dash|l(t(rie)?|e|Arr)|ap|r(trie|Arr)|g(t|e))|fr|w(near|ar(hk|r(ow)?)|Arr)|V(dash|Dash)|l(sim|t(ri(e)?)?|dr|e(s(s)?|q(slant|q)?|ft(arrow|rightarrow))?|E|arr|Arr)|a(ng|cute|tur(al(s)?)?|p(id|os|prox|E)?|bla)|r(tri(e)?|ightarrow|arr(c|w)?|Arr)|g(sim|t(r)?|e(s|q(slant|q)?)?|E)|mid|L(t(v)?|eft(arrow|rightarrow)|l)|b(sp|ump(e)?))|N(scr|c(y|edil|aron)|tilde|o(nBreakingSpace|Break|t(R(ightTriangle(Bar|Equal)?|everseElement)|Greater(Greater|SlantEqual|Tilde|Equal|FullEqual|Less)?|S(u(cceeds(SlantEqual|Tilde|Equal)?|perset(Equal)?|bset(Equal)?)|quareSu(perset(Equal)?|bset(Equal)?))|Hump(DownHump|Equal)|Nested(GreaterGreater|LessLess)|C(ongruent|upCap)|Tilde(Tilde|Equal|FullEqual)?|DoubleVerticalBar|Precedes(SlantEqual|Equal)?|E(qual(Tilde)?|lement|xists)|VerticalBar|Le(ss(Greater|SlantEqual|Tilde|Equal|Less)?|ftTriangle(Bar|Equal)?))?|pf)|u|e(sted(GreaterGreater|LessLess)|wLine|gative(MediumSpace|Thi(nSpace|ckSpace)|VeryThinSpace))|Jcy|fr|acute))\n\
                                 \t\t\t\t\t\t  | \
                                 (o(s(cr|ol|lash)|h(m|bar)|c(y|ir(c)?)|ti(lde|mes(as)?)|S|int|opf|d(sold|iv|ot|ash|blac)|uml|p(erp|lus|ar)|elig|vbar|f(cir|r)|l(c(ir|ross)|t|ine|arr)|a(st|cute)|r(slope|igof|or|d(er(of)?|f|m)?|v|arr)?|g(t|on|rave)|m(i(nus|cron|d)|ega|acr))|O(s(cr|lash)|c(y|irc)|ti(lde|mes)|opf|dblac|uml|penCurly(DoubleQuote|Quote)|ver(B(ar|rac(e|ket))|Parenthesis)|fr|Elig|acute|r|grave|m(icron|ega|acr)))\n\
                                 \t\t\t\t\t\t  | \
                                 (p(s(cr|i)|h(i(v)?|one|mmat)|cy|i(tchfork|v)?|o(intint|und|pf)|uncsp|er(cnt|tenk|iod|p|mil)|fr|l(us(sim|cir|two|d(o|u)|e|acir|mn|b)?|an(ck(h)?|kv))|ar(s(im|l)|t|a(llel)?)?|r(sim|n(sim|E|ap)|cue|ime(s)?|o(d|p(to)?|f(surf|line|alar))|urel|e(c(sim|n(sim|eqq|approx)|curlyeq|eq|approx)?)?|E|ap)?|m)|P(s(cr|i)|hi|cy|i|o(incareplane|pf)|fr|lusMinus|artialD|r(ime|o(duct|portion(al)?)|ecedes(SlantEqual|Tilde|Equal)?)?))\n\
                                 \t\t\t\t\t\t  | \
                                 (q(scr|int|opf|u(ot|est(eq)?|at(int|ernions))|prime|fr)|Q(scr|opf|UOT|fr))\n\
                                 \t\t\t\t\t\t  | \
                                 (R(s(h|cr)|ho|c(y|edil|aron)|Barr|ight(Ceiling|T(ee(Vector|Arrow)?|riangle(Bar|Equal)?)|Do(ubleBracket|wn(TeeVector|Vector(Bar)?))|Up(TeeVector|DownVector|Vector(Bar)?)|Vector(Bar)?|arrow|Floor|A(ngleBracket|rrow(Bar|LeftArrow)?))|o(undImplies|pf)|uleDelayed|e(verse(UpEquilibrium|E(quilibrium|lement)))?|fr|EG|a(ng|cute|rr(tl)?)|rightarrow)|r(s(h|cr|q(uo(r)?|b)|aquo)|h(o(v)?|ar(d|u(l)?))|nmid|c(y|ub|e(il|dil)|aron)|Barr|t(hree|imes|ri(e|f|ltri)?)|i(singdotseq|ng|ght(squigarrow|harpoon(down|up)|threetimes|left(harpoons|arrows)|arrow(tail)?|rightarrows))|Har|o(times|p(f|lus|ar)|a(ng|rr)|brk)|d(sh|ca|quo(r)?|ldhar)|uluhar|p(polint|ar(gt)?)|e(ct|al(s|ine|part)?|g)|f(isht|loor|r)|l(har|arr|m)|a(ng(d|e|le)?|c(ute|e)|t(io(nals)?|ail)|dic|emptyv|quo|rr(sim|hk|c|tl|pl|fs|w|lp|ap|b(fs)?)?)|rarr|x|moust(ache)?|b(arr|r(k(sl(d|u)|e)|ac(e|k))|brk)|A(tail|arr|rr)))\n\
                                 \t\t\t\t\t\t  | \
                                 (s(s(cr|tarf|etmn|mile)|h(y|c(hcy|y)|ort(parallel|mid)|arp)|c(sim|y|n(sim|E|ap)|cue|irc|polint|e(dil)?|E|a(p|ron))?|t(ar(f)?|r(ns|aight(phi|epsilon)))|i(gma(v|f)?|m(ne|dot|plus|e(q)?|l(E)?|rarr|g(E)?)?)|zlig|o(pf|ftcy|l(b(ar)?)?)|dot(e|b)?|u(ng|cc(sim|n(sim|eqq|approx)|curlyeq|eq|approx)?|p(s(im|u(p|b)|et(neq(q)?|eq(q)?)?)|hs(ol|ub)|1|n(e|E)|2|d(sub|ot)|3|plus|e(dot)?|E|larr|mult)?|m|b(s(im|u(p|b)|et(neq(q)?|eq(q)?)?)|n(e|E)|dot|plus|e(dot)?|E|rarr|mult)?)|pa(des(uit)?|r)|e(swar|ct|tm(n|inus)|ar(hk|r(ow)?)|xt|mi|Arr)|q(su(p(set(eq)?|e)?|b(set(eq)?|e)?)|c(up(s)?|ap(s)?)|u(f|ar(e|f))?)|fr(own)?|w(nwar|ar(hk|r(ow)?)|Arr)|larr|acute|rarr|m(t(e(s)?)?|i(d|le)|eparsl|a(shp|llsetminus))|bquo)|S(scr|hort(RightArrow|DownArrow|UpArrow|LeftArrow)|c(y|irc|edil|aron)?|tar|igma|H(cy|CHcy)|opf|u(c(hThat|ceeds(SlantEqual|Tilde|Equal)?)|p(set|erset(Equal)?)?|m|b(set(Equal)?)?)|OFTcy|q(uare(Su(perset(Equal)?|bset(Equal)?)|Intersection|Union)?|rt)|fr|acute|mallCircle))\n\
                                 \t\t\t\t\t\t  | \
                                 (t(s(hcy|c(y|r)|trok)|h(i(nsp|ck(sim|approx))|orn|e(ta(sym|v)?|re(4|fore))|k(sim|ap))|c(y|edil|aron)|i(nt|lde|mes(d|b(ar)?)?)|o(sa|p(cir|f(ork)?|bot)?|ea)|dot|prime|elrec|fr|w(ixt|ohead(leftarrow|rightarrow))|a(u|rget)|r(i(sb|time|dot|plus|e|angle(down|q|left(eq)?|right(eq)?)?|minus)|pezium|ade)|brk)|T(s(cr|trok)|RADE|h(i(nSpace|ckSpace)|e(ta|refore))|c(y|edil|aron)|S(cy|Hcy)|ilde(Tilde|Equal|FullEqual)?|HORN|opf|fr|a(u|b)|ripleDot))\n\
                                 \t\t\t\t\t\t  | \
                                 (u(scr|h(ar(l|r)|blk)|c(y|irc)|t(ilde|dot|ri(f)?)|Har|o(pf|gon)|d(har|arr|blac)|u(arr|ml)|p(si(h|lon)?|harpoon(left|right)|downarrow|uparrows|lus|arrow)|f(isht|r)|wangle|l(c(orn(er)?|rop)|tri)|a(cute|rr)|r(c(orn(er)?|rop)|tri|ing)|grave|m(l|acr)|br(cy|eve)|Arr)|U(scr|n(ion(Plus)?|der(B(ar|rac(e|ket))|Parenthesis))|c(y|irc)|tilde|o(pf|gon)|dblac|uml|p(si(lon)?|downarrow|Tee(Arrow)?|per(RightArrow|LeftArrow)|DownArrow|Equilibrium|arrow|Arrow(Bar|DownArrow)?)|fr|a(cute|rr(ocir)?)|ring|grave|macr|br(cy|eve)))\n\
                                 \t\t\t\t\t\t  | \
                                 (v(s(cr|u(pn(e|E)|bn(e|E)))|nsu(p|b)|cy|Bar(v)?|zigzag|opf|dash|prop|e(e(eq|bar)?|llip|r(t|bar))|Dash|fr|ltri|a(ngrt|r(s(igma|u(psetneq(q)?|bsetneq(q)?))|nothing|t(heta|riangle(left|right))|p(hi|i|ropto)|epsilon|kappa|r(ho)?))|rtri|Arr)|V(scr|cy|opf|dash(l)?|e(e|r(yThinSpace|t(ical(Bar|Separator|Tilde|Line))?|bar))|Dash|vdash|fr|bar))\n\
                                 \t\t\t\t\t\t  | \
                                 (w(scr|circ|opf|p|e(ierp|d(ge(q)?|bar))|fr|r(eath)?)|W(scr|circ|opf|edge|fr))\n\
                                 \t\t\t\t\t\t  | \
                                 (X(scr|i|opf|fr)|x(s(cr|qcup)|h(arr|Arr)|nis|c(irc|up|ap)|i|o(time|dot|p(f|lus))|dtri|u(tri|plus)|vee|fr|wedge|l(arr|Arr)|r(arr|Arr)|map))\n\
                                 \t\t\t\t\t\t  | \
                                 (y(scr|c(y|irc)|icy|opf|u(cy|ml)|en|fr|ac(y|ute))|Y(scr|c(y|irc)|opf|uml|Icy|Ucy|fr|acute|Acy))\n\
                                 \t\t\t\t\t\t  | \
                                 (z(scr|hcy|c(y|aron)|igrarr|opf|dot|e(ta|etrf)|fr|w(nj|j)|acute)|Z(scr|c(y|aron)|Hcy|opf|dot|e(ta|roWidthSpace)|fr|acute))\n\
                                 \t\t\t\t\t\t)\n\
                                 \t\t\t\t\t\t(;)\n\
                                 \t\t\t\t\t" )
                          ; "name", `String "constant.character.entity.named.$2.html"
                          ]
                      ; `Assoc
                          [ ( "captures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.definition.entity.html" )
                                      ] )
                                ; ( "3"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.definition.entity.html" )
                                      ] )
                                ] )
                          ; "match", `String "(&)#[0-9]+(;)"
                          ; ( "name"
                            , `String "constant.character.entity.numeric.decimal.html" )
                          ]
                      ; `Assoc
                          [ ( "captures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.definition.entity.html" )
                                      ] )
                                ; ( "3"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.definition.entity.html" )
                                      ] )
                                ] )
                          ; "match", `String "(&)#[xX][0-9a-fA-F]+(;)"
                          ; ( "name"
                            , `String "constant.character.entity.numeric.hexadecimal.html"
                            )
                          ]
                      ; `Assoc
                          [ "match", `String "&(?=[a-zA-Z0-9]+;)"
                          ; "name", `String "invalid.illegal.ambiguous-ampersand.html"
                          ]
                      ] )
                ] )
          ; ( "math"
            , `Assoc
                [ ( "patterns"
                  , `List
                      [ `Assoc
                          [ ( "begin"
                            , `String
                                "(?i)(<)(math)(?=\\s|/?>)(?:(([^\"'>]|\"[^\"]*\"|'[^']*')*)(>))?"
                            )
                          ; ( "beginCaptures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ "name", `String "meta.tag.structure.$2.start.html"
                                      ] )
                                ; ( "1"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.definition.tag.begin.html"
                                        )
                                      ] )
                                ; "2", `Assoc [ "name", `String "entity.name.tag.html" ]
                                ; ( "3"
                                  , `Assoc
                                      [ ( "patterns"
                                        , `List
                                            [ `Assoc [ "include", `String "#attribute" ] ]
                                        )
                                      ] )
                                ; ( "5"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.definition.tag.end.html" )
                                      ] )
                                ] )
                          ; "end", `String "(?i)(</)(\\2)\\s*(>)"
                          ; ( "endCaptures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ "name", `String "meta.tag.structure.$2.end.html" ]
                                  )
                                ; ( "1"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.definition.tag.begin.html"
                                        )
                                      ] )
                                ; "2", `Assoc [ "name", `String "entity.name.tag.html" ]
                                ; ( "3"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.definition.tag.end.html" )
                                      ] )
                                ] )
                          ; "name", `String "meta.element.structure.$2.html"
                          ; ( "patterns"
                            , `List
                                [ `Assoc
                                    [ "begin", `String "(?<!>)\\G"
                                    ; "end", `String ">"
                                    ; ( "endCaptures"
                                      , `Assoc
                                          [ ( "0"
                                            , `Assoc
                                                [ ( "name"
                                                  , `String
                                                      "punctuation.definition.tag.end.html"
                                                  )
                                                ] )
                                          ] )
                                    ; "name", `String "meta.tag.structure.start.html"
                                    ; ( "patterns"
                                      , `List
                                          [ `Assoc [ "include", `String "#attribute" ] ] )
                                    ]
                                ; `Assoc [ "include", `String "#tags" ]
                                ] )
                          ]
                      ] )
                ; ( "repository"
                  , `Assoc
                      [ ( "attribute"
                        , `Assoc
                            [ ( "patterns"
                              , `List
                                  [ `Assoc
                                      [ ( "begin"
                                        , `String
                                            "(s(hift|ymmetric|cript(sizemultiplier|level|minsize)|t(ackalign|retchy)|ide|u(pscriptshift|bscriptshift)|e(parator(s)?|lection)|rc)|h(eight|ref)|n(otation|umalign)|c(haralign|olumn(spa(n|cing)|width|lines|align)|lose|rossout)|i(n(dent(shift(first|last)?|target|align(first|last)?)|fixlinebreakstyle)|d)|o(pen|verflow)|d(i(splay(style)?|r)|e(nomalign|cimalpoint|pth))|position|e(dge|qual(columns|rows))|voffset|f(orm|ence|rame(spacing)?)|width|l(space|ine(thickness|leading|break(style|multchar)?)|o(ngdivstyle|cation)|ength|quote|argeop)|a(c(cent(under)?|tiontype)|l(t(text|img(-(height|valign|width))?)|ign(mentscope)?))|r(space|ow(spa(n|cing)|lines|align)|quote)|groupalign|x(link:href|mlns)|m(in(size|labelspacing)|ovablelimits|a(th(size|color|variant|background)|xsize))|bevelled)(?![\\w:-])"
                                        )
                                      ; ( "beginCaptures"
                                        , `Assoc
                                            [ ( "0"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "entity.other.attribute-name.html"
                                                    )
                                                  ] )
                                            ] )
                                      ; "end", `String "(?=\\s*+[^=\\s])"
                                      ; "name", `String "meta.attribute.$1.html"
                                      ; ( "patterns"
                                        , `List
                                            [ `Assoc
                                                [ "include", `String "#attribute-interior"
                                                ]
                                            ] )
                                      ]
                                  ; `Assoc
                                      [ ( "begin"
                                        , `String
                                            "([^\\x{0020}\"'<>/=\\x{0000}-\\x{001F}\\x{007F}-\\x{009F}\\x{FDD0}-\\x{FDEF}\\x{FFFE}\\x{FFFF}\\x{1FFFE}\\x{1FFFF}\\x{2FFFE}\\x{2FFFF}\\x{3FFFE}\\x{3FFFF}\\x{4FFFE}\\x{4FFFF}\\x{5FFFE}\\x{5FFFF}\\x{6FFFE}\\x{6FFFF}\\x{7FFFE}\\x{7FFFF}\\x{8FFFE}\\x{8FFFF}\\x{9FFFE}\\x{9FFFF}\\x{AFFFE}\\x{AFFFF}\\x{BFFFE}\\x{BFFFF}\\x{CFFFE}\\x{CFFFF}\\x{DFFFE}\\x{DFFFF}\\x{EFFFE}\\x{EFFFF}\\x{FFFFE}\\x{FFFFF}\\x{10FFFE}\\x{10FFFF}]+)"
                                        )
                                      ; ( "beginCaptures"
                                        , `Assoc
                                            [ ( "0"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "entity.other.attribute-name.html"
                                                    )
                                                  ] )
                                            ] )
                                      ; "comment", `String "Anything else that is valid"
                                      ; "end", `String "(?=\\s*+[^=\\s])"
                                      ; ( "name"
                                        , `String "meta.attribute.unrecognized.$1.html" )
                                      ; ( "patterns"
                                        , `List
                                            [ `Assoc
                                                [ "include", `String "#attribute-interior"
                                                ]
                                            ] )
                                      ]
                                  ; `Assoc
                                      [ "match", `String "[^\\s>]+"
                                      ; ( "name"
                                        , `String
                                            "invalid.illegal.character-not-allowed-here.html"
                                        )
                                      ]
                                  ] )
                            ] )
                      ; ( "tags"
                        , `Assoc
                            [ ( "patterns"
                              , `List
                                  [ `Assoc [ "include", `String "#comment" ]
                                  ; `Assoc [ "include", `String "#cdata" ]
                                  ; `Assoc
                                      [ ( "captures"
                                        , `Assoc
                                            [ ( "0"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "meta.tag.structure.math.$2.void.html"
                                                    )
                                                  ] )
                                            ; ( "1"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "punctuation.definition.tag.begin.html"
                                                    )
                                                  ] )
                                            ; ( "2"
                                              , `Assoc
                                                  [ "name", `String "entity.name.tag.html"
                                                  ] )
                                            ; ( "3"
                                              , `Assoc
                                                  [ ( "patterns"
                                                    , `List
                                                        [ `Assoc
                                                            [ ( "include"
                                                              , `String "#attribute" )
                                                            ]
                                                        ] )
                                                  ] )
                                            ; ( "5"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "punctuation.definition.tag.end.html"
                                                    )
                                                  ] )
                                            ] )
                                      ; ( "match"
                                        , `String
                                            "(?i)(<)(annotation|annotation-xml|semantics|menclose|merror|mfenced|mfrac|mpadded|mphantom|mroot|mrow|msqrt|mstyle|mmultiscripts|mover|mprescripts|msub|msubsup|msup|munder|munderover|none|mlabeledtr|mtable|mtd|mtr|mlongdiv|mscarries|mscarry|msgroup|msline|msrow|mstack|maction)(?=\\s|/?>)(?:(([^\"'>]|\"[^\"]*\"|'[^']*')*)(/>))"
                                        )
                                      ; ( "name"
                                        , `String "meta.element.structure.math.$2.html" )
                                      ]
                                  ; `Assoc
                                      [ ( "begin"
                                        , `String
                                            "(?i)(<)(annotation|annotation-xml|semantics|menclose|merror|mfenced|mfrac|mpadded|mphantom|mroot|mrow|msqrt|mstyle|mmultiscripts|mover|mprescripts|msub|msubsup|msup|munder|munderover|none|mlabeledtr|mtable|mtd|mtr|mlongdiv|mscarries|mscarry|msgroup|msline|msrow|mstack|maction)(?=\\s|/?>)(?:(([^\"'>]|\"[^\"]*\"|'[^']*')*)(>))?"
                                        )
                                      ; ( "beginCaptures"
                                        , `Assoc
                                            [ ( "0"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "meta.tag.structure.math.$2.start.html"
                                                    )
                                                  ] )
                                            ; ( "1"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "punctuation.definition.tag.begin.html"
                                                    )
                                                  ] )
                                            ; ( "2"
                                              , `Assoc
                                                  [ "name", `String "entity.name.tag.html"
                                                  ] )
                                            ; ( "3"
                                              , `Assoc
                                                  [ ( "patterns"
                                                    , `List
                                                        [ `Assoc
                                                            [ ( "include"
                                                              , `String "#attribute" )
                                                            ]
                                                        ] )
                                                  ] )
                                            ; ( "5"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "punctuation.definition.tag.end.html"
                                                    )
                                                  ] )
                                            ] )
                                      ; ( "end"
                                        , `String "(?i)(</)(\\2)\\s*(>)|(/>)|(?=</\\w+)" )
                                      ; ( "endCaptures"
                                        , `Assoc
                                            [ ( "0"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "meta.tag.structure.math.$2.end.html"
                                                    )
                                                  ] )
                                            ; ( "1"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "punctuation.definition.tag.begin.html"
                                                    )
                                                  ] )
                                            ; ( "2"
                                              , `Assoc
                                                  [ "name", `String "entity.name.tag.html"
                                                  ] )
                                            ; ( "3"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "punctuation.definition.tag.end.html"
                                                    )
                                                  ] )
                                            ; ( "4"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "punctuation.definition.tag.end.html"
                                                    )
                                                  ] )
                                            ] )
                                      ; ( "name"
                                        , `String "meta.element.structure.math.$2.html" )
                                      ; ( "patterns"
                                        , `List
                                            [ `Assoc
                                                [ "begin", `String "(?<!>)\\G"
                                                ; "end", `String "(?=/>)|>"
                                                ; ( "endCaptures"
                                                  , `Assoc
                                                      [ ( "0"
                                                        , `Assoc
                                                            [ ( "name"
                                                              , `String
                                                                  "punctuation.definition.tag.end.html"
                                                              )
                                                            ] )
                                                      ] )
                                                ; ( "name"
                                                  , `String
                                                      "meta.tag.structure.start.html" )
                                                ; ( "patterns"
                                                  , `List
                                                      [ `Assoc
                                                          [ ( "include"
                                                            , `String "#attribute" )
                                                          ]
                                                      ] )
                                                ]
                                            ; `Assoc [ "include", `String "#tags" ]
                                            ] )
                                      ]
                                  ; `Assoc
                                      [ ( "captures"
                                        , `Assoc
                                            [ ( "0"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "meta.tag.inline.math.$2.void.html"
                                                    )
                                                  ] )
                                            ; ( "1"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "punctuation.definition.tag.begin.html"
                                                    )
                                                  ] )
                                            ; ( "2"
                                              , `Assoc
                                                  [ "name", `String "entity.name.tag.html"
                                                  ] )
                                            ; ( "3"
                                              , `Assoc
                                                  [ ( "patterns"
                                                    , `List
                                                        [ `Assoc
                                                            [ ( "include"
                                                              , `String "#attribute" )
                                                            ]
                                                        ] )
                                                  ] )
                                            ; ( "5"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "punctuation.definition.tag.end.html"
                                                    )
                                                  ] )
                                            ] )
                                      ; ( "match"
                                        , `String
                                            "(?i)(<)(mi|mn|mo|ms|mspace|mtext|maligngroup|malignmark)(?=\\s|/?>)(?:(([^\"'>]|\"[^\"]*\"|'[^']*')*)(/>))"
                                        )
                                      ; "name", `String "meta.element.inline.math.$2.html"
                                      ]
                                  ; `Assoc
                                      [ ( "begin"
                                        , `String
                                            "(?i)(<)(mi|mn|mo|ms|mspace|mtext|maligngroup|malignmark)(?=\\s|/?>)(?:(([^\"'>]|\"[^\"]*\"|'[^']*')*)(>))?"
                                        )
                                      ; ( "beginCaptures"
                                        , `Assoc
                                            [ ( "0"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "meta.tag.inline.math.$2.start.html"
                                                    )
                                                  ] )
                                            ; ( "1"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "punctuation.definition.tag.begin.html"
                                                    )
                                                  ] )
                                            ; ( "2"
                                              , `Assoc
                                                  [ "name", `String "entity.name.tag.html"
                                                  ] )
                                            ; ( "3"
                                              , `Assoc
                                                  [ ( "patterns"
                                                    , `List
                                                        [ `Assoc
                                                            [ ( "include"
                                                              , `String "#attribute" )
                                                            ]
                                                        ] )
                                                  ] )
                                            ; ( "5"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "punctuation.definition.tag.end.html"
                                                    )
                                                  ] )
                                            ] )
                                      ; ( "end"
                                        , `String "(?i)(</)(\\2)\\s*(>)|(/>)|(?=</\\w+)" )
                                      ; ( "endCaptures"
                                        , `Assoc
                                            [ ( "0"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "meta.tag.inline.math.$2.end.html"
                                                    )
                                                  ] )
                                            ; ( "1"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "punctuation.definition.tag.begin.html"
                                                    )
                                                  ] )
                                            ; ( "2"
                                              , `Assoc
                                                  [ "name", `String "entity.name.tag.html"
                                                  ] )
                                            ; ( "3"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "punctuation.definition.tag.end.html"
                                                    )
                                                  ] )
                                            ; ( "4"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "punctuation.definition.tag.end.html"
                                                    )
                                                  ] )
                                            ] )
                                      ; "name", `String "meta.element.inline.math.$2.html"
                                      ; ( "patterns"
                                        , `List
                                            [ `Assoc
                                                [ "begin", `String "(?<!>)\\G"
                                                ; "end", `String "(?=/>)|>"
                                                ; ( "endCaptures"
                                                  , `Assoc
                                                      [ ( "0"
                                                        , `Assoc
                                                            [ ( "name"
                                                              , `String
                                                                  "punctuation.definition.tag.end.html"
                                                              )
                                                            ] )
                                                      ] )
                                                ; ( "name"
                                                  , `String "meta.tag.inline.start.html" )
                                                ; ( "patterns"
                                                  , `List
                                                      [ `Assoc
                                                          [ ( "include"
                                                            , `String "#attribute" )
                                                          ]
                                                      ] )
                                                ]
                                            ; `Assoc [ "include", `String "#tags" ]
                                            ] )
                                      ]
                                  ; `Assoc
                                      [ ( "captures"
                                        , `Assoc
                                            [ ( "0"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "meta.tag.object.math.$2.void.html"
                                                    )
                                                  ] )
                                            ; ( "1"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "punctuation.definition.tag.begin.html"
                                                    )
                                                  ] )
                                            ; ( "2"
                                              , `Assoc
                                                  [ "name", `String "entity.name.tag.html"
                                                  ] )
                                            ; ( "3"
                                              , `Assoc
                                                  [ ( "patterns"
                                                    , `List
                                                        [ `Assoc
                                                            [ ( "include"
                                                              , `String "#attribute" )
                                                            ]
                                                        ] )
                                                  ] )
                                            ; ( "5"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "punctuation.definition.tag.end.html"
                                                    )
                                                  ] )
                                            ] )
                                      ; ( "match"
                                        , `String
                                            "(?i)(<)(mglyph)(?=\\s|/?>)(?:(([^\"'>]|\"[^\"]*\"|'[^']*')*)(/>))"
                                        )
                                      ; "name", `String "meta.element.object.math.$2.html"
                                      ]
                                  ; `Assoc
                                      [ ( "begin"
                                        , `String
                                            "(?i)(<)(mglyph)(?=\\s|/?>)(?:(([^\"'>]|\"[^\"]*\"|'[^']*')*)(>))?"
                                        )
                                      ; ( "beginCaptures"
                                        , `Assoc
                                            [ ( "0"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "meta.tag.object.math.$2.start.html"
                                                    )
                                                  ] )
                                            ; ( "1"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "punctuation.definition.tag.begin.html"
                                                    )
                                                  ] )
                                            ; ( "2"
                                              , `Assoc
                                                  [ "name", `String "entity.name.tag.html"
                                                  ] )
                                            ; ( "3"
                                              , `Assoc
                                                  [ ( "patterns"
                                                    , `List
                                                        [ `Assoc
                                                            [ ( "include"
                                                              , `String "#attribute" )
                                                            ]
                                                        ] )
                                                  ] )
                                            ; ( "5"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "punctuation.definition.tag.end.html"
                                                    )
                                                  ] )
                                            ] )
                                      ; ( "end"
                                        , `String "(?i)(</)(\\2)\\s*(>)|(/>)|(?=</\\w+)" )
                                      ; ( "endCaptures"
                                        , `Assoc
                                            [ ( "0"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "meta.tag.object.math.$2.end.html"
                                                    )
                                                  ] )
                                            ; ( "1"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "punctuation.definition.tag.begin.html"
                                                    )
                                                  ] )
                                            ; ( "2"
                                              , `Assoc
                                                  [ "name", `String "entity.name.tag.html"
                                                  ] )
                                            ; ( "3"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "punctuation.definition.tag.end.html"
                                                    )
                                                  ] )
                                            ; ( "4"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "punctuation.definition.tag.end.html"
                                                    )
                                                  ] )
                                            ] )
                                      ; "name", `String "meta.element.object.math.$2.html"
                                      ; ( "patterns"
                                        , `List
                                            [ `Assoc
                                                [ "begin", `String "(?<!>)\\G"
                                                ; "end", `String "(?=/>)|>"
                                                ; ( "endCaptures"
                                                  , `Assoc
                                                      [ ( "0"
                                                        , `Assoc
                                                            [ ( "name"
                                                              , `String
                                                                  "punctuation.definition.tag.end.html"
                                                              )
                                                            ] )
                                                      ] )
                                                ; ( "name"
                                                  , `String "meta.tag.object.start.html" )
                                                ; ( "patterns"
                                                  , `List
                                                      [ `Assoc
                                                          [ ( "include"
                                                            , `String "#attribute" )
                                                          ]
                                                      ] )
                                                ]
                                            ; `Assoc [ "include", `String "#tags" ]
                                            ] )
                                      ]
                                  ; `Assoc
                                      [ ( "captures"
                                        , `Assoc
                                            [ ( "0"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "meta.tag.other.invalid.void.html"
                                                    )
                                                  ] )
                                            ; ( "1"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "punctuation.definition.tag.begin.html"
                                                    )
                                                  ] )
                                            ; ( "2"
                                              , `Assoc
                                                  [ "name", `String "entity.name.tag.html"
                                                  ] )
                                            ; ( "3"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "invalid.illegal.unrecognized-tag.html"
                                                    )
                                                  ] )
                                            ; ( "4"
                                              , `Assoc
                                                  [ ( "patterns"
                                                    , `List
                                                        [ `Assoc
                                                            [ ( "include"
                                                              , `String "#attribute" )
                                                            ]
                                                        ] )
                                                  ] )
                                            ; ( "6"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "punctuation.definition.tag.end.html"
                                                    )
                                                  ] )
                                            ] )
                                      ; ( "match"
                                        , `String
                                            "(?i)(<)(([\\w:]+))(?=\\s|/?>)(?:(([^\"'>]|\"[^\"]*\"|'[^']*')*)(/>))"
                                        )
                                      ; "name", `String "meta.element.other.invalid.html"
                                      ]
                                  ; `Assoc
                                      [ ( "begin"
                                        , `String
                                            "(?i)(<)((\\w[^\\s>]*))(?=\\s|/?>)(?:(([^\"'>]|\"[^\"]*\"|'[^']*')*)(>))?"
                                        )
                                      ; ( "beginCaptures"
                                        , `Assoc
                                            [ ( "0"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "meta.tag.other.invalid.start.html"
                                                    )
                                                  ] )
                                            ; ( "1"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "punctuation.definition.tag.begin.html"
                                                    )
                                                  ] )
                                            ; ( "2"
                                              , `Assoc
                                                  [ "name", `String "entity.name.tag.html"
                                                  ] )
                                            ; ( "3"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "invalid.illegal.unrecognized-tag.html"
                                                    )
                                                  ] )
                                            ; ( "4"
                                              , `Assoc
                                                  [ ( "patterns"
                                                    , `List
                                                        [ `Assoc
                                                            [ ( "include"
                                                              , `String "#attribute" )
                                                            ]
                                                        ] )
                                                  ] )
                                            ; ( "6"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "punctuation.definition.tag.end.html"
                                                    )
                                                  ] )
                                            ] )
                                      ; ( "end"
                                        , `String "(?i)(</)((\\2))\\s*(>)|(/>)|(?=</\\w+)"
                                        )
                                      ; ( "endCaptures"
                                        , `Assoc
                                            [ ( "0"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "meta.tag.other.invalid.end.html"
                                                    )
                                                  ] )
                                            ; ( "1"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "punctuation.definition.tag.begin.html"
                                                    )
                                                  ] )
                                            ; ( "2"
                                              , `Assoc
                                                  [ "name", `String "entity.name.tag.html"
                                                  ] )
                                            ; ( "3"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "invalid.illegal.unrecognized-tag.html"
                                                    )
                                                  ] )
                                            ; ( "4"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "punctuation.definition.tag.end.html"
                                                    )
                                                  ] )
                                            ; ( "5"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "punctuation.definition.tag.end.html"
                                                    )
                                                  ] )
                                            ] )
                                      ; "name", `String "meta.element.other.invalid.html"
                                      ; ( "patterns"
                                        , `List
                                            [ `Assoc
                                                [ "begin", `String "(?<!>)\\G"
                                                ; "end", `String "(?=/>)|>"
                                                ; ( "endCaptures"
                                                  , `Assoc
                                                      [ ( "0"
                                                        , `Assoc
                                                            [ ( "name"
                                                              , `String
                                                                  "punctuation.definition.tag.end.html"
                                                              )
                                                            ] )
                                                      ] )
                                                ; ( "name"
                                                  , `String
                                                      "meta.tag.other.invalid.start.html"
                                                  )
                                                ; ( "patterns"
                                                  , `List
                                                      [ `Assoc
                                                          [ ( "include"
                                                            , `String "#attribute" )
                                                          ]
                                                      ] )
                                                ]
                                            ; `Assoc [ "include", `String "#tags" ]
                                            ] )
                                      ]
                                  ; `Assoc [ "include", `String "#tags-invalid" ]
                                  ] )
                            ] )
                      ] )
                ] )
          ; ( "svg"
            , `Assoc
                [ ( "patterns"
                  , `List
                      [ `Assoc
                          [ ( "begin"
                            , `String
                                "(?i)(<)(svg)(?=\\s|/?>)(?:(([^\"'>]|\"[^\"]*\"|'[^']*')*)(>))?"
                            )
                          ; ( "beginCaptures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ "name", `String "meta.tag.structure.$2.start.html"
                                      ] )
                                ; ( "1"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.definition.tag.begin.html"
                                        )
                                      ] )
                                ; "2", `Assoc [ "name", `String "entity.name.tag.html" ]
                                ; ( "3"
                                  , `Assoc
                                      [ ( "patterns"
                                        , `List
                                            [ `Assoc [ "include", `String "#attribute" ] ]
                                        )
                                      ] )
                                ; ( "5"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.definition.tag.end.html" )
                                      ] )
                                ] )
                          ; "end", `String "(?i)(</)(\\2)\\s*(>)"
                          ; ( "endCaptures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ "name", `String "meta.tag.structure.$2.end.html" ]
                                  )
                                ; ( "1"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.definition.tag.begin.html"
                                        )
                                      ] )
                                ; "2", `Assoc [ "name", `String "entity.name.tag.html" ]
                                ; ( "3"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.definition.tag.end.html" )
                                      ] )
                                ] )
                          ; "name", `String "meta.element.structure.$2.html"
                          ; ( "patterns"
                            , `List
                                [ `Assoc
                                    [ "begin", `String "(?<!>)\\G"
                                    ; "end", `String ">"
                                    ; ( "endCaptures"
                                      , `Assoc
                                          [ ( "0"
                                            , `Assoc
                                                [ ( "name"
                                                  , `String
                                                      "punctuation.definition.tag.end.html"
                                                  )
                                                ] )
                                          ] )
                                    ; "name", `String "meta.tag.structure.start.html"
                                    ; ( "patterns"
                                      , `List
                                          [ `Assoc [ "include", `String "#attribute" ] ] )
                                    ]
                                ; `Assoc [ "include", `String "#tags" ]
                                ] )
                          ]
                      ] )
                ; ( "repository"
                  , `Assoc
                      [ ( "attribute"
                        , `Assoc
                            [ ( "patterns"
                              , `List
                                  [ `Assoc
                                      [ ( "begin"
                                        , `String
                                            "(s(hape-rendering|ystemLanguage|cale|t(yle|itchTiles|op-(color|opacity)|dDeviation|em(h|v)|artOffset|r(i(ng|kethrough-(thickness|position))|oke(-(opacity|dash(offset|array)|width|line(cap|join)|miterlimit))?))|urfaceScale|p(e(cular(Constant|Exponent)|ed)|acing|readMethod)|eed|lope)|h(oriz-(origin-x|adv-x)|eight|anging|ref(lang)?)|y(1|2|ChannelSelector)?|n(umOctaves|ame)|c(y|o(ntentS(criptType|tyleType)|lor(-(interpolation(-filters)?|profile|rendering))?)|ursor|l(ip(-(path|rule)|PathUnits)?|ass)|a(p-height|lcMode)|x)|t(ype|o|ext(-(decoration|anchor|rendering)|Length)|a(rget(X|Y)?|b(index|leValues))|ransform)|i(n(tercept|2)?|d(eographic)?|mage-rendering)|z(oomAndPan)?|o(p(erator|acity)|ver(flow|line-(thickness|position))|ffset|r(i(ent(ation)?|gin)|der))|d(y|i(splay|visor|ffuseConstant|rection)|ominant-baseline|ur|e(scent|celerate)|x)?|u(1|n(i(code(-(range|bidi))?|ts-per-em)|derline-(thickness|position))|2)|p(ing|oint(s(At(X|Y|Z))?|er-events)|a(nose-1|t(h(Length)?|tern(ContentUnits|Transform|Units))|int-order)|r(imitiveUnits|eserveA(spectRatio|lpha)))|e(n(d|able-background)|dgeMode|levation|x(ternalResourcesRequired|ponent))|v(i(sibility|ew(Box|Target))|-(hanging|ideographic|alphabetic|mathematical)|e(ctor-effect|r(sion|t-(origin-(y|x)|adv-y)))|alues)|k(1|2|3|e(y(Splines|Times|Points)|rn(ing|el(Matrix|UnitLength)))|4)?|f(y|il(ter(Res|Units)?|l(-(opacity|rule))?)|o(nt-(s(t(yle|retch)|ize(-adjust)?)|variant|family|weight)|rmat)|lood-(color|opacity)|r(om)?|x)|w(idth(s)?|ord-spacing|riting-mode)|l(i(ghting-color|mitingConeAngle)|ocal|e(ngthAdjust|tter-spacing)|ang)|a(scent|cc(umulate|ent-height)|ttribute(Name|Type)|zimuth|dditive|utoReverse|l(ignment-baseline|phabetic|lowReorder)|rabic-form|mplitude)|r(y|otate|e(s(tart|ult)|ndering-intent|peat(Count|Dur)|quired(Extensions|Features)|f(X|Y|errerPolicy)|l)|adius|x)?|g(1|2|lyph(Ref|-(name|orientation-(horizontal|vertical)))|radient(Transform|Units))|x(1|2|ChannelSelector|-height|link:(show|href|t(ype|itle)|a(ctuate|rcrole)|role)|ml:(space|lang|base))?|m(in|ode|e(thod|dia)|a(sk(ContentUnits|Units)?|thematical|rker(Height|-(start|end|mid)|Units|Width)|x))|b(y|ias|egin|ase(Profile|line-shift|Frequency)|box))(?![\\w:-])"
                                        )
                                      ; ( "beginCaptures"
                                        , `Assoc
                                            [ ( "0"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "entity.other.attribute-name.html"
                                                    )
                                                  ] )
                                            ] )
                                      ; "end", `String "(?=\\s*+[^=\\s])"
                                      ; "name", `String "meta.attribute.$1.html"
                                      ; ( "patterns"
                                        , `List
                                            [ `Assoc
                                                [ "include", `String "#attribute-interior"
                                                ]
                                            ] )
                                      ]
                                  ; `Assoc
                                      [ ( "begin"
                                        , `String
                                            "([^\\x{0020}\"'<>/=\\x{0000}-\\x{001F}\\x{007F}-\\x{009F}\\x{FDD0}-\\x{FDEF}\\x{FFFE}\\x{FFFF}\\x{1FFFE}\\x{1FFFF}\\x{2FFFE}\\x{2FFFF}\\x{3FFFE}\\x{3FFFF}\\x{4FFFE}\\x{4FFFF}\\x{5FFFE}\\x{5FFFF}\\x{6FFFE}\\x{6FFFF}\\x{7FFFE}\\x{7FFFF}\\x{8FFFE}\\x{8FFFF}\\x{9FFFE}\\x{9FFFF}\\x{AFFFE}\\x{AFFFF}\\x{BFFFE}\\x{BFFFF}\\x{CFFFE}\\x{CFFFF}\\x{DFFFE}\\x{DFFFF}\\x{EFFFE}\\x{EFFFF}\\x{FFFFE}\\x{FFFFF}\\x{10FFFE}\\x{10FFFF}]+)"
                                        )
                                      ; ( "beginCaptures"
                                        , `Assoc
                                            [ ( "0"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "entity.other.attribute-name.html"
                                                    )
                                                  ] )
                                            ] )
                                      ; "comment", `String "Anything else that is valid"
                                      ; "end", `String "(?=\\s*+[^=\\s])"
                                      ; ( "name"
                                        , `String "meta.attribute.unrecognized.$1.html" )
                                      ; ( "patterns"
                                        , `List
                                            [ `Assoc
                                                [ "include", `String "#attribute-interior"
                                                ]
                                            ] )
                                      ]
                                  ; `Assoc
                                      [ "match", `String "[^\\s>]+"
                                      ; ( "name"
                                        , `String
                                            "invalid.illegal.character-not-allowed-here.html"
                                        )
                                      ]
                                  ] )
                            ] )
                      ; ( "tags"
                        , `Assoc
                            [ ( "patterns"
                              , `List
                                  [ `Assoc [ "include", `String "#comment" ]
                                  ; `Assoc [ "include", `String "#cdata" ]
                                  ; `Assoc
                                      [ ( "captures"
                                        , `Assoc
                                            [ ( "0"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "meta.tag.metadata.svg.$2.void.html"
                                                    )
                                                  ] )
                                            ; ( "1"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "punctuation.definition.tag.begin.html"
                                                    )
                                                  ] )
                                            ; ( "2"
                                              , `Assoc
                                                  [ "name", `String "entity.name.tag.html"
                                                  ] )
                                            ; ( "3"
                                              , `Assoc
                                                  [ ( "patterns"
                                                    , `List
                                                        [ `Assoc
                                                            [ ( "include"
                                                              , `String "#attribute" )
                                                            ]
                                                        ] )
                                                  ] )
                                            ; ( "5"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "punctuation.definition.tag.end.html"
                                                    )
                                                  ] )
                                            ] )
                                      ; ( "match"
                                        , `String
                                            "(?i)(<)(color-profile|desc|metadata|script|style|title)(?=\\s|/?>)(?:(([^\"'>]|\"[^\"]*\"|'[^']*')*)(/>))"
                                        )
                                      ; ( "name"
                                        , `String "meta.element.metadata.svg.$2.html" )
                                      ]
                                  ; `Assoc
                                      [ ( "begin"
                                        , `String
                                            "(?i)(<)(color-profile|desc|metadata|script|style|title)(?=\\s|/?>)(?:(([^\"'>]|\"[^\"]*\"|'[^']*')*)(>))?"
                                        )
                                      ; ( "beginCaptures"
                                        , `Assoc
                                            [ ( "0"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "meta.tag.metadata.svg.$2.start.html"
                                                    )
                                                  ] )
                                            ; ( "1"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "punctuation.definition.tag.begin.html"
                                                    )
                                                  ] )
                                            ; ( "2"
                                              , `Assoc
                                                  [ "name", `String "entity.name.tag.html"
                                                  ] )
                                            ; ( "3"
                                              , `Assoc
                                                  [ ( "patterns"
                                                    , `List
                                                        [ `Assoc
                                                            [ ( "include"
                                                              , `String "#attribute" )
                                                            ]
                                                        ] )
                                                  ] )
                                            ; ( "5"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "punctuation.definition.tag.end.html"
                                                    )
                                                  ] )
                                            ] )
                                      ; ( "end"
                                        , `String "(?i)(</)(\\2)\\s*(>)|(/>)|(?=</\\w+)" )
                                      ; ( "endCaptures"
                                        , `Assoc
                                            [ ( "0"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "meta.tag.metadata.svg.$2.end.html"
                                                    )
                                                  ] )
                                            ; ( "1"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "punctuation.definition.tag.begin.html"
                                                    )
                                                  ] )
                                            ; ( "2"
                                              , `Assoc
                                                  [ "name", `String "entity.name.tag.html"
                                                  ] )
                                            ; ( "3"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "punctuation.definition.tag.end.html"
                                                    )
                                                  ] )
                                            ; ( "4"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "punctuation.definition.tag.end.html"
                                                    )
                                                  ] )
                                            ] )
                                      ; ( "name"
                                        , `String "meta.element.metadata.svg.$2.html" )
                                      ; ( "patterns"
                                        , `List
                                            [ `Assoc
                                                [ "begin", `String "(?<!>)\\G"
                                                ; "end", `String "(?=/>)|>"
                                                ; ( "endCaptures"
                                                  , `Assoc
                                                      [ ( "0"
                                                        , `Assoc
                                                            [ ( "name"
                                                              , `String
                                                                  "punctuation.definition.tag.end.html"
                                                              )
                                                            ] )
                                                      ] )
                                                ; ( "name"
                                                  , `String "meta.tag.metadata.start.html"
                                                  )
                                                ; ( "patterns"
                                                  , `List
                                                      [ `Assoc
                                                          [ ( "include"
                                                            , `String "#attribute" )
                                                          ]
                                                      ] )
                                                ]
                                            ; `Assoc [ "include", `String "#tags" ]
                                            ] )
                                      ]
                                  ; `Assoc
                                      [ ( "captures"
                                        , `Assoc
                                            [ ( "0"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "meta.tag.structure.svg.$2.void.html"
                                                    )
                                                  ] )
                                            ; ( "1"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "punctuation.definition.tag.begin.html"
                                                    )
                                                  ] )
                                            ; ( "2"
                                              , `Assoc
                                                  [ "name", `String "entity.name.tag.html"
                                                  ] )
                                            ; ( "3"
                                              , `Assoc
                                                  [ ( "patterns"
                                                    , `List
                                                        [ `Assoc
                                                            [ ( "include"
                                                              , `String "#attribute" )
                                                            ]
                                                        ] )
                                                  ] )
                                            ; ( "5"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "punctuation.definition.tag.end.html"
                                                    )
                                                  ] )
                                            ] )
                                      ; ( "match"
                                        , `String
                                            "(?i)(<)(animateMotion|clipPath|defs|feComponentTransfer|feDiffuseLighting|feMerge|feSpecularLighting|filter|g|hatch|linearGradient|marker|mask|mesh|meshgradient|meshpatch|meshrow|pattern|radialGradient|switch|text|textPath)(?=\\s|/?>)(?:(([^\"'>]|\"[^\"]*\"|'[^']*')*)(/>))"
                                        )
                                      ; ( "name"
                                        , `String "meta.element.structure.svg.$2.html" )
                                      ]
                                  ; `Assoc
                                      [ ( "begin"
                                        , `String
                                            "(?i)(<)(animateMotion|clipPath|defs|feComponentTransfer|feDiffuseLighting|feMerge|feSpecularLighting|filter|g|hatch|linearGradient|marker|mask|mesh|meshgradient|meshpatch|meshrow|pattern|radialGradient|switch|text|textPath)(?=\\s|/?>)(?:(([^\"'>]|\"[^\"]*\"|'[^']*')*)(>))?"
                                        )
                                      ; ( "beginCaptures"
                                        , `Assoc
                                            [ ( "0"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "meta.tag.structure.svg.$2.start.html"
                                                    )
                                                  ] )
                                            ; ( "1"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "punctuation.definition.tag.begin.html"
                                                    )
                                                  ] )
                                            ; ( "2"
                                              , `Assoc
                                                  [ "name", `String "entity.name.tag.html"
                                                  ] )
                                            ; ( "3"
                                              , `Assoc
                                                  [ ( "patterns"
                                                    , `List
                                                        [ `Assoc
                                                            [ ( "include"
                                                              , `String "#attribute" )
                                                            ]
                                                        ] )
                                                  ] )
                                            ; ( "5"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "punctuation.definition.tag.end.html"
                                                    )
                                                  ] )
                                            ] )
                                      ; ( "end"
                                        , `String "(?i)(</)(\\2)\\s*(>)|(/>)|(?=</\\w+)" )
                                      ; ( "endCaptures"
                                        , `Assoc
                                            [ ( "0"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "meta.tag.structure.svg.$2.end.html"
                                                    )
                                                  ] )
                                            ; ( "1"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "punctuation.definition.tag.begin.html"
                                                    )
                                                  ] )
                                            ; ( "2"
                                              , `Assoc
                                                  [ "name", `String "entity.name.tag.html"
                                                  ] )
                                            ; ( "3"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "punctuation.definition.tag.end.html"
                                                    )
                                                  ] )
                                            ; ( "4"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "punctuation.definition.tag.end.html"
                                                    )
                                                  ] )
                                            ] )
                                      ; ( "name"
                                        , `String "meta.element.structure.svg.$2.html" )
                                      ; ( "patterns"
                                        , `List
                                            [ `Assoc
                                                [ "begin", `String "(?<!>)\\G"
                                                ; "end", `String "(?=/>)|>"
                                                ; ( "endCaptures"
                                                  , `Assoc
                                                      [ ( "0"
                                                        , `Assoc
                                                            [ ( "name"
                                                              , `String
                                                                  "punctuation.definition.tag.end.html"
                                                              )
                                                            ] )
                                                      ] )
                                                ; ( "name"
                                                  , `String
                                                      "meta.tag.structure.start.html" )
                                                ; ( "patterns"
                                                  , `List
                                                      [ `Assoc
                                                          [ ( "include"
                                                            , `String "#attribute" )
                                                          ]
                                                      ] )
                                                ]
                                            ; `Assoc [ "include", `String "#tags" ]
                                            ] )
                                      ]
                                  ; `Assoc
                                      [ ( "captures"
                                        , `Assoc
                                            [ ( "0"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "meta.tag.inline.svg.$2.void.html"
                                                    )
                                                  ] )
                                            ; ( "1"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "punctuation.definition.tag.begin.html"
                                                    )
                                                  ] )
                                            ; ( "2"
                                              , `Assoc
                                                  [ "name", `String "entity.name.tag.html"
                                                  ] )
                                            ; ( "3"
                                              , `Assoc
                                                  [ ( "patterns"
                                                    , `List
                                                        [ `Assoc
                                                            [ ( "include"
                                                              , `String "#attribute" )
                                                            ]
                                                        ] )
                                                  ] )
                                            ; ( "5"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "punctuation.definition.tag.end.html"
                                                    )
                                                  ] )
                                            ] )
                                      ; ( "match"
                                        , `String
                                            "(?i)(<)(a|animate|discard|feBlend|feColorMatrix|feComposite|feConvolveMatrix|feDisplacementMap|feDistantLight|feDropShadow|feFlood|feFuncA|feFuncB|feFuncG|feFuncR|feGaussianBlur|feMergeNode|feMorphology|feOffset|fePointLight|feSpotLight|feTile|feTurbulence|hatchPath|mpath|set|solidcolor|stop|tspan)(?=\\s|/?>)(?:(([^\"'>]|\"[^\"]*\"|'[^']*')*)(/>))"
                                        )
                                      ; "name", `String "meta.element.inline.svg.$2.html"
                                      ]
                                  ; `Assoc
                                      [ ( "begin"
                                        , `String
                                            "(?i)(<)(a|animate|discard|feBlend|feColorMatrix|feComposite|feConvolveMatrix|feDisplacementMap|feDistantLight|feDropShadow|feFlood|feFuncA|feFuncB|feFuncG|feFuncR|feGaussianBlur|feMergeNode|feMorphology|feOffset|fePointLight|feSpotLight|feTile|feTurbulence|hatchPath|mpath|set|solidcolor|stop|tspan)(?=\\s|/?>)(?:(([^\"'>]|\"[^\"]*\"|'[^']*')*)(>))?"
                                        )
                                      ; ( "beginCaptures"
                                        , `Assoc
                                            [ ( "0"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "meta.tag.inline.svg.$2.start.html"
                                                    )
                                                  ] )
                                            ; ( "1"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "punctuation.definition.tag.begin.html"
                                                    )
                                                  ] )
                                            ; ( "2"
                                              , `Assoc
                                                  [ "name", `String "entity.name.tag.html"
                                                  ] )
                                            ; ( "3"
                                              , `Assoc
                                                  [ ( "patterns"
                                                    , `List
                                                        [ `Assoc
                                                            [ ( "include"
                                                              , `String "#attribute" )
                                                            ]
                                                        ] )
                                                  ] )
                                            ; ( "5"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "punctuation.definition.tag.end.html"
                                                    )
                                                  ] )
                                            ] )
                                      ; ( "end"
                                        , `String "(?i)(</)(\\2)\\s*(>)|(/>)|(?=</\\w+)" )
                                      ; ( "endCaptures"
                                        , `Assoc
                                            [ ( "0"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "meta.tag.inline.svg.$2.end.html"
                                                    )
                                                  ] )
                                            ; ( "1"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "punctuation.definition.tag.begin.html"
                                                    )
                                                  ] )
                                            ; ( "2"
                                              , `Assoc
                                                  [ "name", `String "entity.name.tag.html"
                                                  ] )
                                            ; ( "3"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "punctuation.definition.tag.end.html"
                                                    )
                                                  ] )
                                            ; ( "4"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "punctuation.definition.tag.end.html"
                                                    )
                                                  ] )
                                            ] )
                                      ; "name", `String "meta.element.inline.svg.$2.html"
                                      ; ( "patterns"
                                        , `List
                                            [ `Assoc
                                                [ "begin", `String "(?<!>)\\G"
                                                ; "end", `String "(?=/>)|>"
                                                ; ( "endCaptures"
                                                  , `Assoc
                                                      [ ( "0"
                                                        , `Assoc
                                                            [ ( "name"
                                                              , `String
                                                                  "punctuation.definition.tag.end.html"
                                                              )
                                                            ] )
                                                      ] )
                                                ; ( "name"
                                                  , `String "meta.tag.inline.start.html" )
                                                ; ( "patterns"
                                                  , `List
                                                      [ `Assoc
                                                          [ ( "include"
                                                            , `String "#attribute" )
                                                          ]
                                                      ] )
                                                ]
                                            ; `Assoc [ "include", `String "#tags" ]
                                            ] )
                                      ]
                                  ; `Assoc
                                      [ ( "captures"
                                        , `Assoc
                                            [ ( "0"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "meta.tag.object.svg.$2.void.html"
                                                    )
                                                  ] )
                                            ; ( "1"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "punctuation.definition.tag.begin.html"
                                                    )
                                                  ] )
                                            ; ( "2"
                                              , `Assoc
                                                  [ "name", `String "entity.name.tag.html"
                                                  ] )
                                            ; ( "3"
                                              , `Assoc
                                                  [ ( "patterns"
                                                    , `List
                                                        [ `Assoc
                                                            [ ( "include"
                                                              , `String "#attribute" )
                                                            ]
                                                        ] )
                                                  ] )
                                            ; ( "5"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "punctuation.definition.tag.end.html"
                                                    )
                                                  ] )
                                            ] )
                                      ; ( "match"
                                        , `String
                                            "(?i)(<)(circle|ellipse|feImage|foreignObject|image|line|path|polygon|polyline|rect|symbol|use|view)(?=\\s|/?>)(?:(([^\"'>]|\"[^\"]*\"|'[^']*')*)(/>))"
                                        )
                                      ; "name", `String "meta.element.object.svg.$2.html"
                                      ]
                                  ; `Assoc
                                      [ ( "begin"
                                        , `String
                                            "(?i)(<)(a|circle|ellipse|feImage|foreignObject|image|line|path|polygon|polyline|rect|symbol|use|view)(?=\\s|/?>)(?:(([^\"'>]|\"[^\"]*\"|'[^']*')*)(>))?"
                                        )
                                      ; ( "beginCaptures"
                                        , `Assoc
                                            [ ( "0"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "meta.tag.object.svg.$2.start.html"
                                                    )
                                                  ] )
                                            ; ( "1"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "punctuation.definition.tag.begin.html"
                                                    )
                                                  ] )
                                            ; ( "2"
                                              , `Assoc
                                                  [ "name", `String "entity.name.tag.html"
                                                  ] )
                                            ; ( "3"
                                              , `Assoc
                                                  [ ( "patterns"
                                                    , `List
                                                        [ `Assoc
                                                            [ ( "include"
                                                              , `String "#attribute" )
                                                            ]
                                                        ] )
                                                  ] )
                                            ; ( "5"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "punctuation.definition.tag.end.html"
                                                    )
                                                  ] )
                                            ] )
                                      ; ( "end"
                                        , `String "(?i)(</)(\\2)\\s*(>)|(/>)|(?=</\\w+)" )
                                      ; ( "endCaptures"
                                        , `Assoc
                                            [ ( "0"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "meta.tag.object.svg.$2.end.html"
                                                    )
                                                  ] )
                                            ; ( "1"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "punctuation.definition.tag.begin.html"
                                                    )
                                                  ] )
                                            ; ( "2"
                                              , `Assoc
                                                  [ "name", `String "entity.name.tag.html"
                                                  ] )
                                            ; ( "3"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "punctuation.definition.tag.end.html"
                                                    )
                                                  ] )
                                            ; ( "4"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "punctuation.definition.tag.end.html"
                                                    )
                                                  ] )
                                            ] )
                                      ; "name", `String "meta.element.object.svg.$2.html"
                                      ; ( "patterns"
                                        , `List
                                            [ `Assoc
                                                [ "begin", `String "(?<!>)\\G"
                                                ; "end", `String "(?=/>)|>"
                                                ; ( "endCaptures"
                                                  , `Assoc
                                                      [ ( "0"
                                                        , `Assoc
                                                            [ ( "name"
                                                              , `String
                                                                  "punctuation.definition.tag.end.html"
                                                              )
                                                            ] )
                                                      ] )
                                                ; ( "name"
                                                  , `String "meta.tag.object.start.html" )
                                                ; ( "patterns"
                                                  , `List
                                                      [ `Assoc
                                                          [ ( "include"
                                                            , `String "#attribute" )
                                                          ]
                                                      ] )
                                                ]
                                            ; `Assoc [ "include", `String "#tags" ]
                                            ] )
                                      ]
                                  ; `Assoc
                                      [ ( "captures"
                                        , `Assoc
                                            [ ( "0"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "meta.tag.other.svg.$2.void.html"
                                                    )
                                                  ] )
                                            ; ( "1"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "punctuation.definition.tag.begin.html"
                                                    )
                                                  ] )
                                            ; ( "2"
                                              , `Assoc
                                                  [ "name", `String "entity.name.tag.html"
                                                  ] )
                                            ; ( "3"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String "invalid.deprecated.html" )
                                                  ] )
                                            ; ( "4"
                                              , `Assoc
                                                  [ ( "patterns"
                                                    , `List
                                                        [ `Assoc
                                                            [ ( "include"
                                                              , `String "#attribute" )
                                                            ]
                                                        ] )
                                                  ] )
                                            ; ( "6"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "punctuation.definition.tag.end.html"
                                                    )
                                                  ] )
                                            ] )
                                      ; ( "match"
                                        , `String
                                            "(?i)(<)((altGlyph|altGlyphDef|altGlyphItem|animateColor|animateTransform|cursor|font|font-face|font-face-format|font-face-name|font-face-src|font-face-uri|glyph|glyphRef|hkern|missing-glyph|tref|vkern))(?=\\s|/?>)(?:(([^\"'>]|\"[^\"]*\"|'[^']*')*)(/>))"
                                        )
                                      ; "name", `String "meta.element.other.svg.$2.html"
                                      ]
                                  ; `Assoc
                                      [ ( "begin"
                                        , `String
                                            "(?i)(<)((altGlyph|altGlyphDef|altGlyphItem|animateColor|animateTransform|cursor|font|font-face|font-face-format|font-face-name|font-face-src|font-face-uri|glyph|glyphRef|hkern|missing-glyph|tref|vkern))(?=\\s|/?>)(?:(([^\"'>]|\"[^\"]*\"|'[^']*')*)(>))?"
                                        )
                                      ; ( "beginCaptures"
                                        , `Assoc
                                            [ ( "0"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "meta.tag.other.svg.$2.start.html"
                                                    )
                                                  ] )
                                            ; ( "1"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "punctuation.definition.tag.begin.html"
                                                    )
                                                  ] )
                                            ; ( "2"
                                              , `Assoc
                                                  [ "name", `String "entity.name.tag.html"
                                                  ] )
                                            ; ( "3"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String "invalid.deprecated.html" )
                                                  ] )
                                            ; ( "4"
                                              , `Assoc
                                                  [ ( "patterns"
                                                    , `List
                                                        [ `Assoc
                                                            [ ( "include"
                                                              , `String "#attribute" )
                                                            ]
                                                        ] )
                                                  ] )
                                            ; ( "6"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "punctuation.definition.tag.end.html"
                                                    )
                                                  ] )
                                            ] )
                                      ; ( "end"
                                        , `String "(?i)(</)((\\2))\\s*(>)|(/>)|(?=</\\w+)"
                                        )
                                      ; ( "endCaptures"
                                        , `Assoc
                                            [ ( "0"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "meta.tag.other.svg.$2.end.html" )
                                                  ] )
                                            ; ( "1"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "punctuation.definition.tag.begin.html"
                                                    )
                                                  ] )
                                            ; ( "2"
                                              , `Assoc
                                                  [ "name", `String "entity.name.tag.html"
                                                  ] )
                                            ; ( "3"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String "invalid.deprecated.html" )
                                                  ] )
                                            ; ( "4"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "punctuation.definition.tag.end.html"
                                                    )
                                                  ] )
                                            ; ( "5"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "punctuation.definition.tag.end.html"
                                                    )
                                                  ] )
                                            ] )
                                      ; "name", `String "meta.element.other.svg.$2.html"
                                      ; ( "patterns"
                                        , `List
                                            [ `Assoc
                                                [ "begin", `String "(?<!>)\\G"
                                                ; "end", `String "(?=/>)|>"
                                                ; ( "endCaptures"
                                                  , `Assoc
                                                      [ ( "0"
                                                        , `Assoc
                                                            [ ( "name"
                                                              , `String
                                                                  "punctuation.definition.tag.end.html"
                                                              )
                                                            ] )
                                                      ] )
                                                ; ( "name"
                                                  , `String "meta.tag.other.start.html" )
                                                ; ( "patterns"
                                                  , `List
                                                      [ `Assoc
                                                          [ ( "include"
                                                            , `String "#attribute" )
                                                          ]
                                                      ] )
                                                ]
                                            ; `Assoc [ "include", `String "#tags" ]
                                            ] )
                                      ]
                                  ; `Assoc
                                      [ ( "captures"
                                        , `Assoc
                                            [ ( "0"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "meta.tag.other.invalid.void.html"
                                                    )
                                                  ] )
                                            ; ( "1"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "punctuation.definition.tag.begin.html"
                                                    )
                                                  ] )
                                            ; ( "2"
                                              , `Assoc
                                                  [ "name", `String "entity.name.tag.html"
                                                  ] )
                                            ; ( "3"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "invalid.illegal.unrecognized-tag.html"
                                                    )
                                                  ] )
                                            ; ( "4"
                                              , `Assoc
                                                  [ ( "patterns"
                                                    , `List
                                                        [ `Assoc
                                                            [ ( "include"
                                                              , `String "#attribute" )
                                                            ]
                                                        ] )
                                                  ] )
                                            ; ( "6"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "punctuation.definition.tag.end.html"
                                                    )
                                                  ] )
                                            ] )
                                      ; ( "match"
                                        , `String
                                            "(?i)(<)(([\\w:]+))(?=\\s|/?>)(?:(([^\"'>]|\"[^\"]*\"|'[^']*')*)(/>))"
                                        )
                                      ; "name", `String "meta.element.other.invalid.html"
                                      ]
                                  ; `Assoc
                                      [ ( "begin"
                                        , `String
                                            "(?i)(<)((\\w[^\\s>]*))(?=\\s|/?>)(?:(([^\"'>]|\"[^\"]*\"|'[^']*')*)(>))?"
                                        )
                                      ; ( "beginCaptures"
                                        , `Assoc
                                            [ ( "0"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "meta.tag.other.invalid.start.html"
                                                    )
                                                  ] )
                                            ; ( "1"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "punctuation.definition.tag.begin.html"
                                                    )
                                                  ] )
                                            ; ( "2"
                                              , `Assoc
                                                  [ "name", `String "entity.name.tag.html"
                                                  ] )
                                            ; ( "3"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "invalid.illegal.unrecognized-tag.html"
                                                    )
                                                  ] )
                                            ; ( "4"
                                              , `Assoc
                                                  [ ( "patterns"
                                                    , `List
                                                        [ `Assoc
                                                            [ ( "include"
                                                              , `String "#attribute" )
                                                            ]
                                                        ] )
                                                  ] )
                                            ; ( "6"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "punctuation.definition.tag.end.html"
                                                    )
                                                  ] )
                                            ] )
                                      ; ( "end"
                                        , `String "(?i)(</)((\\2))\\s*(>)|(/>)|(?=</\\w+)"
                                        )
                                      ; ( "endCaptures"
                                        , `Assoc
                                            [ ( "0"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "meta.tag.other.invalid.end.html"
                                                    )
                                                  ] )
                                            ; ( "1"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "punctuation.definition.tag.begin.html"
                                                    )
                                                  ] )
                                            ; ( "2"
                                              , `Assoc
                                                  [ "name", `String "entity.name.tag.html"
                                                  ] )
                                            ; ( "3"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "invalid.illegal.unrecognized-tag.html"
                                                    )
                                                  ] )
                                            ; ( "4"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "punctuation.definition.tag.end.html"
                                                    )
                                                  ] )
                                            ; ( "5"
                                              , `Assoc
                                                  [ ( "name"
                                                    , `String
                                                        "punctuation.definition.tag.end.html"
                                                    )
                                                  ] )
                                            ] )
                                      ; "name", `String "meta.element.other.invalid.html"
                                      ; ( "patterns"
                                        , `List
                                            [ `Assoc
                                                [ "begin", `String "(?<!>)\\G"
                                                ; "end", `String "(?=/>)|>"
                                                ; ( "endCaptures"
                                                  , `Assoc
                                                      [ ( "0"
                                                        , `Assoc
                                                            [ ( "name"
                                                              , `String
                                                                  "punctuation.definition.tag.end.html"
                                                              )
                                                            ] )
                                                      ] )
                                                ; ( "name"
                                                  , `String
                                                      "meta.tag.other.invalid.start.html"
                                                  )
                                                ; ( "patterns"
                                                  , `List
                                                      [ `Assoc
                                                          [ ( "include"
                                                            , `String "#attribute" )
                                                          ]
                                                      ] )
                                                ]
                                            ; `Assoc [ "include", `String "#tags" ]
                                            ] )
                                      ]
                                  ; `Assoc [ "include", `String "#tags-invalid" ]
                                  ] )
                            ] )
                      ] )
                ] )
          ; ( "tags-invalid"
            , `Assoc
                [ ( "patterns"
                  , `List
                      [ `Assoc
                          [ "begin", `String "(</?)((\\w[^\\s>]*))(?<!/)"
                          ; ( "beginCaptures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.definition.tag.begin.html"
                                        )
                                      ] )
                                ; "2", `Assoc [ "name", `String "entity.name.tag.html" ]
                                ; ( "3"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "invalid.illegal.unrecognized-tag.html"
                                        )
                                      ] )
                                ] )
                          ; "end", `String "((?: ?/)?>)"
                          ; ( "endCaptures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.definition.tag.end.html" )
                                      ] )
                                ] )
                          ; "name", `String "meta.tag.other.$2.html"
                          ; ( "patterns"
                            , `List [ `Assoc [ "include", `String "#attribute" ] ] )
                          ]
                      ] )
                ] )
          ; ( "tags-valid"
            , `Assoc
                [ ( "patterns"
                  , `List
                      [ `Assoc
                          [ "begin", `String "(^[ \\t]+)?(?=<(?i:style)\\b(?!-))"
                          ; ( "beginCaptures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ ( "name"
                                        , `String
                                            "punctuation.whitespace.embedded.leading.html"
                                        )
                                      ] )
                                ] )
                          ; "end", `String "(?!\\G)([ \\t]*$\\n?)?"
                          ; ( "endCaptures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ ( "name"
                                        , `String
                                            "punctuation.whitespace.embedded.trailing.html"
                                        )
                                      ] )
                                ] )
                          ; ( "patterns"
                            , `List
                                [ `Assoc
                                    [ "begin", `String "(?i)(<)(style)(?=\\s|/?>)"
                                    ; ( "beginCaptures"
                                      , `Assoc
                                          [ ( "0"
                                            , `Assoc
                                                [ ( "name"
                                                  , `String
                                                      "meta.tag.metadata.style.start.html"
                                                  )
                                                ] )
                                          ; ( "1"
                                            , `Assoc
                                                [ ( "name"
                                                  , `String
                                                      "punctuation.definition.tag.begin.html"
                                                  )
                                                ] )
                                          ; ( "2"
                                            , `Assoc
                                                [ "name", `String "entity.name.tag.html" ]
                                            )
                                          ] )
                                    ; "end", `String "(?i)((<)/)(style)\\s*(>)"
                                    ; ( "endCaptures"
                                      , `Assoc
                                          [ ( "0"
                                            , `Assoc
                                                [ ( "name"
                                                  , `String
                                                      "meta.tag.metadata.style.end.html" )
                                                ] )
                                          ; ( "1"
                                            , `Assoc
                                                [ ( "name"
                                                  , `String
                                                      "punctuation.definition.tag.begin.html"
                                                  )
                                                ] )
                                          ; ( "2"
                                            , `Assoc
                                                [ ( "name"
                                                  , `String "source.css-ignored-vscode" )
                                                ] )
                                          ; ( "3"
                                            , `Assoc
                                                [ "name", `String "entity.name.tag.html" ]
                                            )
                                          ; ( "4"
                                            , `Assoc
                                                [ ( "name"
                                                  , `String
                                                      "punctuation.definition.tag.end.html"
                                                  )
                                                ] )
                                          ] )
                                    ; "name", `String "meta.embedded.block.html"
                                    ; ( "patterns"
                                      , `List
                                          [ `Assoc
                                              [ "begin", `String "\\G"
                                              ; ( "captures"
                                                , `Assoc
                                                    [ ( "1"
                                                      , `Assoc
                                                          [ ( "name"
                                                            , `String
                                                                "punctuation.definition.tag.end.html"
                                                            )
                                                          ] )
                                                    ] )
                                              ; "end", `String "(>)"
                                              ; ( "name"
                                                , `String
                                                    "meta.tag.metadata.style.start.html" )
                                              ; ( "patterns"
                                                , `List
                                                    [ `Assoc
                                                        [ "include", `String "#attribute"
                                                        ]
                                                    ] )
                                              ]
                                          ; `Assoc
                                              [ "begin", `String "(?!\\G)"
                                              ; "end", `String "(?=</(?i:style))"
                                              ; "name", `String "source.css"
                                              ; ( "patterns"
                                                , `List
                                                    [ `Assoc
                                                        [ "include", `String "source.css"
                                                        ]
                                                    ] )
                                              ]
                                          ] )
                                    ]
                                ] )
                          ]
                      ; `Assoc
                          [ "begin", `String "(^[ \\t]+)?(?=<(?i:script)\\b(?!-))"
                          ; ( "beginCaptures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ ( "name"
                                        , `String
                                            "punctuation.whitespace.embedded.leading.html"
                                        )
                                      ] )
                                ] )
                          ; "end", `String "(?!\\G)([ \\t]*$\\n?)?"
                          ; ( "endCaptures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ ( "name"
                                        , `String
                                            "punctuation.whitespace.embedded.trailing.html"
                                        )
                                      ] )
                                ] )
                          ; ( "patterns"
                            , `List
                                [ `Assoc
                                    [ "begin", `String "(<)((?i:script))\\b"
                                    ; ( "beginCaptures"
                                      , `Assoc
                                          [ ( "0"
                                            , `Assoc
                                                [ ( "name"
                                                  , `String
                                                      "meta.tag.metadata.script.start.html"
                                                  )
                                                ] )
                                          ; ( "1"
                                            , `Assoc
                                                [ ( "name"
                                                  , `String
                                                      "punctuation.definition.tag.begin.html"
                                                  )
                                                ] )
                                          ; ( "2"
                                            , `Assoc
                                                [ "name", `String "entity.name.tag.html" ]
                                            )
                                          ] )
                                    ; "end", `String "(/)((?i:script))(>)"
                                    ; ( "endCaptures"
                                      , `Assoc
                                          [ ( "0"
                                            , `Assoc
                                                [ ( "name"
                                                  , `String
                                                      "meta.tag.metadata.script.end.html"
                                                  )
                                                ] )
                                          ; ( "1"
                                            , `Assoc
                                                [ ( "name"
                                                  , `String
                                                      "punctuation.definition.tag.begin.html"
                                                  )
                                                ] )
                                          ; ( "2"
                                            , `Assoc
                                                [ "name", `String "entity.name.tag.html" ]
                                            )
                                          ; ( "3"
                                            , `Assoc
                                                [ ( "name"
                                                  , `String
                                                      "punctuation.definition.tag.end.html"
                                                  )
                                                ] )
                                          ] )
                                    ; "name", `String "meta.embedded.block.html"
                                    ; ( "patterns"
                                      , `List
                                          [ `Assoc
                                              [ "begin", `String "\\G"
                                              ; "end", `String "(?=/)"
                                              ; ( "patterns"
                                                , `List
                                                    [ `Assoc
                                                        [ "begin", `String "(>)"
                                                        ; ( "beginCaptures"
                                                          , `Assoc
                                                              [ ( "0"
                                                                , `Assoc
                                                                    [ ( "name"
                                                                      , `String
                                                                          "meta.tag.metadata.script.start.html"
                                                                      )
                                                                    ] )
                                                              ; ( "1"
                                                                , `Assoc
                                                                    [ ( "name"
                                                                      , `String
                                                                          "punctuation.definition.tag.end.html"
                                                                      )
                                                                    ] )
                                                              ] )
                                                        ; ( "end"
                                                          , `String
                                                              "((<))(?=/(?i:script))" )
                                                        ; ( "endCaptures"
                                                          , `Assoc
                                                              [ ( "0"
                                                                , `Assoc
                                                                    [ ( "name"
                                                                      , `String
                                                                          "meta.tag.metadata.script.end.html"
                                                                      )
                                                                    ] )
                                                              ; ( "1"
                                                                , `Assoc
                                                                    [ ( "name"
                                                                      , `String
                                                                          "punctuation.definition.tag.begin.html"
                                                                      )
                                                                    ] )
                                                              ; ( "2"
                                                                , `Assoc
                                                                    [ ( "name"
                                                                      , `String
                                                                          "source.js-ignored-vscode"
                                                                      )
                                                                    ] )
                                                              ] )
                                                        ; ( "patterns"
                                                          , `List
                                                              [ `Assoc
                                                                  [ "begin", `String "\\G"
                                                                  ; ( "end"
                                                                    , `String
                                                                        "(?=</(?i:script))"
                                                                    )
                                                                  ; ( "name"
                                                                    , `String "source.js"
                                                                    )
                                                                  ; ( "patterns"
                                                                    , `List
                                                                        [ `Assoc
                                                                            [ ( "begin"
                                                                              , `String
                                                                                  "(^[ \
                                                                                   \\t]+)?(?=//)"
                                                                              )
                                                                            ; ( "beginCaptures"
                                                                              , `Assoc
                                                                                  [ ( "1"
                                                                                    , `Assoc
                                                                                        [ ( 
                                                                                          "name"
                                                                                        , `String
                                                                                          "punctuation.whitespace.comment.leading.js"
                                                                                          )
                                                                                        ]
                                                                                    )
                                                                                  ] )
                                                                            ; ( "end"
                                                                              , `String
                                                                                  "(?!\\G)"
                                                                              )
                                                                            ; ( "patterns"
                                                                              , `List
                                                                                  [ `Assoc
                                                                                      [ ( "begin"
                                                                                        , `String
                                                                                          "//"
                                                                                        )
                                                                                      ; ( "beginCaptures"
                                                                                        , `Assoc
                                                                                          [ 
                                                                                          ( 
                                                                                          "0"
                                                                                        , `Assoc
                                                                                          [ 
                                                                                          ( 
                                                                                          "name"
                                                                                        , `String
                                                                                          "punctuation.definition.comment.js"
                                                                                          )
                                                                                          ]
                                                                                          )
                                                                                          ]
                                                                                        )
                                                                                      ; ( "end"
                                                                                        , `String
                                                                                          "(?=</script)|\\n"
                                                                                        )
                                                                                      ; ( "name"
                                                                                        , `String
                                                                                          "comment.line.double-slash.js"
                                                                                        )
                                                                                      ]
                                                                                  ] )
                                                                            ]
                                                                        ; `Assoc
                                                                            [ ( "begin"
                                                                              , `String
                                                                                  "/\\*" )
                                                                            ; ( "captures"
                                                                              , `Assoc
                                                                                  [ ( "0"
                                                                                    , `Assoc
                                                                                        [ ( 
                                                                                          "name"
                                                                                        , `String
                                                                                          "punctuation.definition.comment.js"
                                                                                          )
                                                                                        ]
                                                                                    )
                                                                                  ] )
                                                                            ; ( "end"
                                                                              , `String
                                                                                  "\\*/|(?=</script)"
                                                                              )
                                                                            ; ( "name"
                                                                              , `String
                                                                                  "comment.block.js"
                                                                              )
                                                                            ]
                                                                        ; `Assoc
                                                                            [ ( "include"
                                                                              , `String
                                                                                  "source.js"
                                                                              )
                                                                            ]
                                                                        ] )
                                                                  ]
                                                              ] )
                                                        ]
                                                    ; `Assoc
                                                        [ "begin", `String "\\G"
                                                        ; ( "end"
                                                          , `String
                                                              "(?ix:\n\
                                                               \t\t\t\t\t\t\t\t\t\t\t\t(?=>\t\t\t\t\t\t\t\t\t\t\t# \
                                                               Tag without type attribute\n\
                                                               \t\t\t\t\t\t\t\t\t\t\t\t  \
                                                               | type(?=[\\s=])\n\
                                                               \t\t\t\t\t\t\t\t\t\t\t\t  \
                                                               \t(?!\\s*=\\s*\n\
                                                               \t\t\t\t\t\t\t\t\t\t\t\t\t\t(\n\
                                                               \t\t\t\t\t\t\t\t\t\t\t\t\t\t\t''\t\t\t\t\t\t\t\t# \
                                                               Empty\n\
                                                               \t\t\t\t\t\t\t\t\t\t\t\t\t\t  \
                                                               | \
                                                               \"\"\t\t\t\t\t\t\t\t\t#   \
                                                               Values\n\
                                                               \t\t\t\t\t\t\t\t\t\t\t\t\t\t  \
                                                               | ('|\"|)\n\
                                                               \t\t\t\t\t\t\t\t\t\t\t\t\t\t\t(\n\
                                                               \t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\ttext/\t\t\t\t\t\t\t# \
                                                               Text mime-types\n\
                                                               \t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t(\n\
                                                               \t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tjavascript(1\\.[0-5])?\n\
                                                               \t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t  \
                                                               | x-javascript\n\
                                                               \t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t  \
                                                               | jscript\n\
                                                               \t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t  \
                                                               | livescript\n\
                                                               \t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t  \
                                                               | (x-)?ecmascript\n\
                                                               \t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t  \
                                                               | babel\t\t\t\t\t\t# \
                                                               Javascript variant \
                                                               currently\n\
                                                               \t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t  \
                                                               \t\t\t\t\t\t\t\t#   \
                                                               recognized as such\n\
                                                               \t\t\t\t\t\t\t\t\t\t\t\t\t\t\t  \
                                                               \t)\n\
                                                               \t\t\t\t\t\t\t\t\t\t\t\t\t\t\t  \
                                                               | application/\t\t\t\t\t# \
                                                               Application mime-types\n\
                                                               \t\t\t\t\t\t\t\t\t\t\t\t\t\t\t  \
                                                               \t(\n\
                                                               \t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t(x-)?javascript\n\
                                                               \t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t  \
                                                               | (x-)?ecmascript\n\
                                                               \t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t)\n\
                                                               \t\t\t\t\t\t\t\t\t\t\t\t\t\t\t  \
                                                               | module\n\
                                                               \t\t\t\t\t\t\t\t\t\t\t\t\t\t  \
                                                               \t)\n\
                                                               \t\t\t\t\t\t\t\t\t\t\t\t\t\t\t[\\s\"'>]\n\
                                                               \t\t\t\t\t\t\t\t\t\t\t\t\t\t)\n\
                                                               \t\t\t\t\t\t\t\t\t\t\t\t\t)\n\
                                                               \t\t\t\t\t\t\t\t\t\t\t\t)\n\
                                                               \t\t\t\t\t\t\t\t\t\t\t)" )
                                                        ; ( "name"
                                                          , `String
                                                              "meta.tag.metadata.script.start.html"
                                                          )
                                                        ; ( "patterns"
                                                          , `List
                                                              [ `Assoc
                                                                  [ ( "include"
                                                                    , `String "#attribute"
                                                                    )
                                                                  ]
                                                              ] )
                                                        ]
                                                    ; `Assoc
                                                        [ ( "begin"
                                                          , `String
                                                              "(?ix:\n\
                                                               \t\t\t\t\t\t\t\t\t\t\t\t(?=\n\
                                                               \t\t\t\t\t\t\t\t\t\t\t\t\ttype\\s*=\\s*\n\
                                                               \t\t\t\t\t\t\t\t\t\t\t\t\t('|\"|)\n\
                                                               \t\t\t\t\t\t\t\t\t\t\t\t\ttext/\n\
                                                               \t\t\t\t\t\t\t\t\t\t\t\t\t(\n\
                                                               \t\t\t\t\t\t\t\t\t\t\t\t\t\tx-handlebars\n\
                                                               \t\t\t\t\t\t\t\t\t\t\t\t\t  \
                                                               | \
                                                               (x-(handlebars-)?|ng-)?template\n\
                                                               \t\t\t\t\t\t\t\t\t\t\t\t\t  \
                                                               | html\n\
                                                               \t\t\t\t\t\t\t\t\t\t\t\t\t)\n\
                                                               \t\t\t\t\t\t\t\t\t\t\t\t\t[\\s\"'>]\n\
                                                               \t\t\t\t\t\t\t\t\t\t\t\t)\n\
                                                               \t\t\t\t\t\t\t\t\t\t\t)" )
                                                        ; ( "end"
                                                          , `String
                                                              "((<))(?=/(?i:script))" )
                                                        ; ( "endCaptures"
                                                          , `Assoc
                                                              [ ( "0"
                                                                , `Assoc
                                                                    [ ( "name"
                                                                      , `String
                                                                          "meta.tag.metadata.script.end.html"
                                                                      )
                                                                    ] )
                                                              ; ( "1"
                                                                , `Assoc
                                                                    [ ( "name"
                                                                      , `String
                                                                          "punctuation.definition.tag.begin.html"
                                                                      )
                                                                    ] )
                                                              ; ( "2"
                                                                , `Assoc
                                                                    [ ( "name"
                                                                      , `String
                                                                          "text.html.basic"
                                                                      )
                                                                    ] )
                                                              ] )
                                                        ; ( "patterns"
                                                          , `List
                                                              [ `Assoc
                                                                  [ "begin", `String "\\G"
                                                                  ; "end", `String "(>)"
                                                                  ; ( "endCaptures"
                                                                    , `Assoc
                                                                        [ ( "1"
                                                                          , `Assoc
                                                                              [ ( "name"
                                                                                , `String
                                                                                    "punctuation.definition.tag.end.html"
                                                                                )
                                                                              ] )
                                                                        ] )
                                                                  ; ( "name"
                                                                    , `String
                                                                        "meta.tag.metadata.script.start.html"
                                                                    )
                                                                  ; ( "patterns"
                                                                    , `List
                                                                        [ `Assoc
                                                                            [ ( "include"
                                                                              , `String
                                                                                  "#attribute"
                                                                              )
                                                                            ]
                                                                        ] )
                                                                  ]
                                                              ; `Assoc
                                                                  [ ( "begin"
                                                                    , `String "(?!\\G)" )
                                                                  ; ( "end"
                                                                    , `String
                                                                        "(?=</(?i:script))"
                                                                    )
                                                                  ; ( "name"
                                                                    , `String
                                                                        "text.html.basic"
                                                                    )
                                                                  ; ( "patterns"
                                                                    , `List
                                                                        [ `Assoc
                                                                            [ ( "include"
                                                                              , `String
                                                                                  "text.html.basic"
                                                                              )
                                                                            ]
                                                                        ] )
                                                                  ]
                                                              ] )
                                                        ]
                                                    ; `Assoc
                                                        [ "begin", `String "(?=(?i:type))"
                                                        ; ( "end"
                                                          , `String "(<)(?=/(?i:script))"
                                                          )
                                                        ; ( "endCaptures"
                                                          , `Assoc
                                                              [ ( "0"
                                                                , `Assoc
                                                                    [ ( "name"
                                                                      , `String
                                                                          "meta.tag.metadata.script.end.html"
                                                                      )
                                                                    ] )
                                                              ; ( "1"
                                                                , `Assoc
                                                                    [ ( "name"
                                                                      , `String
                                                                          "punctuation.definition.tag.begin.html"
                                                                      )
                                                                    ] )
                                                              ] )
                                                        ; ( "patterns"
                                                          , `List
                                                              [ `Assoc
                                                                  [ "begin", `String "\\G"
                                                                  ; "end", `String "(>)"
                                                                  ; ( "endCaptures"
                                                                    , `Assoc
                                                                        [ ( "1"
                                                                          , `Assoc
                                                                              [ ( "name"
                                                                                , `String
                                                                                    "punctuation.definition.tag.end.html"
                                                                                )
                                                                              ] )
                                                                        ] )
                                                                  ; ( "name"
                                                                    , `String
                                                                        "meta.tag.metadata.script.start.html"
                                                                    )
                                                                  ; ( "patterns"
                                                                    , `List
                                                                        [ `Assoc
                                                                            [ ( "include"
                                                                              , `String
                                                                                  "#attribute"
                                                                              )
                                                                            ]
                                                                        ] )
                                                                  ]
                                                              ; `Assoc
                                                                  [ ( "begin"
                                                                    , `String "(?!\\G)" )
                                                                  ; ( "end"
                                                                    , `String
                                                                        "(?=</(?i:script))"
                                                                    )
                                                                  ; ( "name"
                                                                    , `String
                                                                        "source.unknown" )
                                                                  ]
                                                              ] )
                                                        ]
                                                    ] )
                                              ]
                                          ] )
                                    ]
                                ] )
                          ]
                      ; `Assoc
                          [ "begin", `String "(?i)(<)(base|link|meta)(?=\\s|/?>)"
                          ; ( "beginCaptures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.definition.tag.begin.html"
                                        )
                                      ] )
                                ; "2", `Assoc [ "name", `String "entity.name.tag.html" ]
                                ] )
                          ; "end", `String "/?>"
                          ; ( "endCaptures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.definition.tag.end.html" )
                                      ] )
                                ] )
                          ; "name", `String "meta.tag.metadata.$2.void.html"
                          ; ( "patterns"
                            , `List [ `Assoc [ "include", `String "#attribute" ] ] )
                          ]
                      ; `Assoc
                          [ "begin", `String "(?i)(<)(noscript|title)(?=\\s|/?>)"
                          ; ( "beginCaptures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.definition.tag.begin.html"
                                        )
                                      ] )
                                ; "2", `Assoc [ "name", `String "entity.name.tag.html" ]
                                ] )
                          ; "end", `String ">"
                          ; ( "endCaptures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.definition.tag.end.html" )
                                      ] )
                                ] )
                          ; "name", `String "meta.tag.metadata.$2.start.html"
                          ; ( "patterns"
                            , `List [ `Assoc [ "include", `String "#attribute" ] ] )
                          ]
                      ; `Assoc
                          [ "begin", `String "(?i)(</)(noscript|title)(?=\\s|/?>)"
                          ; ( "beginCaptures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.definition.tag.begin.html"
                                        )
                                      ] )
                                ; "2", `Assoc [ "name", `String "entity.name.tag.html" ]
                                ] )
                          ; "end", `String ">"
                          ; ( "endCaptures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.definition.tag.end.html" )
                                      ] )
                                ] )
                          ; "name", `String "meta.tag.metadata.$2.end.html"
                          ; ( "patterns"
                            , `List [ `Assoc [ "include", `String "#attribute" ] ] )
                          ]
                      ; `Assoc
                          [ "begin", `String "(?i)(<)(col|hr|input)(?=\\s|/?>)"
                          ; ( "beginCaptures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.definition.tag.begin.html"
                                        )
                                      ] )
                                ; "2", `Assoc [ "name", `String "entity.name.tag.html" ]
                                ] )
                          ; "end", `String "/?>"
                          ; ( "endCaptures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.definition.tag.end.html" )
                                      ] )
                                ] )
                          ; "name", `String "meta.tag.structure.$2.void.html"
                          ; ( "patterns"
                            , `List [ `Assoc [ "include", `String "#attribute" ] ] )
                          ]
                      ; `Assoc
                          [ ( "begin"
                            , `String
                                "(?i)(<)(address|article|aside|blockquote|body|button|caption|colgroup|datalist|dd|details|dialog|div|dl|dt|fieldset|figcaption|figure|footer|form|head|header|hgroup|html|h[1-6]|label|legend|li|main|map|menu|meter|nav|ol|optgroup|option|output|p|pre|progress|section|select|slot|summary|table|tbody|td|template|textarea|tfoot|th|thead|tr|ul)(?=\\s|/?>)"
                            )
                          ; ( "beginCaptures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.definition.tag.begin.html"
                                        )
                                      ] )
                                ; "2", `Assoc [ "name", `String "entity.name.tag.html" ]
                                ] )
                          ; "end", `String ">"
                          ; ( "endCaptures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.definition.tag.end.html" )
                                      ] )
                                ] )
                          ; "name", `String "meta.tag.structure.$2.start.html"
                          ; ( "patterns"
                            , `List [ `Assoc [ "include", `String "#attribute" ] ] )
                          ]
                      ; `Assoc
                          [ ( "begin"
                            , `String
                                "(?i)(</)(address|article|aside|blockquote|body|button|caption|colgroup|datalist|dd|details|dialog|div|dl|dt|fieldset|figcaption|figure|footer|form|head|header|hgroup|html|h[1-6]|label|legend|li|main|map|menu|meter|nav|ol|optgroup|option|output|p|pre|progress|section|select|slot|summary|table|tbody|td|template|textarea|tfoot|th|thead|tr|ul)(?=\\s|/?>)"
                            )
                          ; ( "beginCaptures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.definition.tag.begin.html"
                                        )
                                      ] )
                                ; "2", `Assoc [ "name", `String "entity.name.tag.html" ]
                                ] )
                          ; "end", `String ">"
                          ; ( "endCaptures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.definition.tag.end.html" )
                                      ] )
                                ] )
                          ; "name", `String "meta.tag.structure.$2.end.html"
                          ; ( "patterns"
                            , `List [ `Assoc [ "include", `String "#attribute" ] ] )
                          ]
                      ; `Assoc
                          [ "begin", `String "(?i)(<)(area|br|wbr)(?=\\s|/?>)"
                          ; ( "beginCaptures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.definition.tag.begin.html"
                                        )
                                      ] )
                                ; "2", `Assoc [ "name", `String "entity.name.tag.html" ]
                                ] )
                          ; "end", `String "/?>"
                          ; ( "endCaptures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.definition.tag.end.html" )
                                      ] )
                                ] )
                          ; "name", `String "meta.tag.inline.$2.void.html"
                          ; ( "patterns"
                            , `List [ `Assoc [ "include", `String "#attribute" ] ] )
                          ]
                      ; `Assoc
                          [ ( "begin"
                            , `String
                                "(?i)(<)(a|abbr|b|bdi|bdo|cite|code|data|del|dfn|em|i|ins|kbd|mark|q|rp|rt|ruby|s|samp|small|span|strong|sub|sup|time|u|var)(?=\\s|/?>)"
                            )
                          ; ( "beginCaptures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.definition.tag.begin.html"
                                        )
                                      ] )
                                ; "2", `Assoc [ "name", `String "entity.name.tag.html" ]
                                ] )
                          ; "end", `String ">"
                          ; ( "endCaptures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.definition.tag.end.html" )
                                      ] )
                                ] )
                          ; "name", `String "meta.tag.inline.$2.start.html"
                          ; ( "patterns"
                            , `List [ `Assoc [ "include", `String "#attribute" ] ] )
                          ]
                      ; `Assoc
                          [ ( "begin"
                            , `String
                                "(?i)(</)(a|abbr|b|bdi|bdo|cite|code|data|del|dfn|em|i|ins|kbd|mark|q|rp|rt|ruby|s|samp|small|span|strong|sub|sup|time|u|var)(?=\\s|/?>)"
                            )
                          ; ( "beginCaptures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.definition.tag.begin.html"
                                        )
                                      ] )
                                ; "2", `Assoc [ "name", `String "entity.name.tag.html" ]
                                ] )
                          ; "end", `String ">"
                          ; ( "endCaptures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.definition.tag.end.html" )
                                      ] )
                                ] )
                          ; "name", `String "meta.tag.inline.$2.end.html"
                          ; ( "patterns"
                            , `List [ `Assoc [ "include", `String "#attribute" ] ] )
                          ]
                      ; `Assoc
                          [ ( "begin"
                            , `String "(?i)(<)(embed|img|param|source|track)(?=\\s|/?>)" )
                          ; ( "beginCaptures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.definition.tag.begin.html"
                                        )
                                      ] )
                                ; "2", `Assoc [ "name", `String "entity.name.tag.html" ]
                                ] )
                          ; "end", `String "/?>"
                          ; ( "endCaptures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.definition.tag.end.html" )
                                      ] )
                                ] )
                          ; "name", `String "meta.tag.object.$2.void.html"
                          ; ( "patterns"
                            , `List [ `Assoc [ "include", `String "#attribute" ] ] )
                          ]
                      ; `Assoc
                          [ ( "begin"
                            , `String
                                "(?i)(<)(audio|canvas|iframe|object|picture|video)(?=\\s|/?>)"
                            )
                          ; ( "beginCaptures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.definition.tag.begin.html"
                                        )
                                      ] )
                                ; "2", `Assoc [ "name", `String "entity.name.tag.html" ]
                                ] )
                          ; "end", `String ">"
                          ; ( "endCaptures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.definition.tag.end.html" )
                                      ] )
                                ] )
                          ; "name", `String "meta.tag.object.$2.start.html"
                          ; ( "patterns"
                            , `List [ `Assoc [ "include", `String "#attribute" ] ] )
                          ]
                      ; `Assoc
                          [ ( "begin"
                            , `String
                                "(?i)(</)(audio|canvas|iframe|object|picture|video)(?=\\s|/?>)"
                            )
                          ; ( "beginCaptures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.definition.tag.begin.html"
                                        )
                                      ] )
                                ; "2", `Assoc [ "name", `String "entity.name.tag.html" ]
                                ] )
                          ; "end", `String ">"
                          ; ( "endCaptures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.definition.tag.end.html" )
                                      ] )
                                ] )
                          ; "name", `String "meta.tag.object.$2.end.html"
                          ; ( "patterns"
                            , `List [ `Assoc [ "include", `String "#attribute" ] ] )
                          ]
                      ; `Assoc
                          [ "begin", `String "(?i)(<)((basefont|isindex))(?=\\s|/?>)"
                          ; ( "beginCaptures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.definition.tag.begin.html"
                                        )
                                      ] )
                                ; "2", `Assoc [ "name", `String "entity.name.tag.html" ]
                                ; ( "3"
                                  , `Assoc [ "name", `String "invalid.deprecated.html" ] )
                                ] )
                          ; "end", `String "/?>"
                          ; ( "endCaptures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.definition.tag.end.html" )
                                      ] )
                                ] )
                          ; "name", `String "meta.tag.metadata.$2.void.html"
                          ; ( "patterns"
                            , `List [ `Assoc [ "include", `String "#attribute" ] ] )
                          ]
                      ; `Assoc
                          [ ( "begin"
                            , `String
                                "(?i)(<)((center|frameset|noembed|noframes))(?=\\s|/?>)" )
                          ; ( "beginCaptures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.definition.tag.begin.html"
                                        )
                                      ] )
                                ; "2", `Assoc [ "name", `String "entity.name.tag.html" ]
                                ; ( "3"
                                  , `Assoc [ "name", `String "invalid.deprecated.html" ] )
                                ] )
                          ; "end", `String ">"
                          ; ( "endCaptures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.definition.tag.end.html" )
                                      ] )
                                ] )
                          ; "name", `String "meta.tag.structure.$2.start.html"
                          ; ( "patterns"
                            , `List [ `Assoc [ "include", `String "#attribute" ] ] )
                          ]
                      ; `Assoc
                          [ ( "begin"
                            , `String
                                "(?i)(</)((center|frameset|noembed|noframes))(?=\\s|/?>)"
                            )
                          ; ( "beginCaptures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.definition.tag.begin.html"
                                        )
                                      ] )
                                ; "2", `Assoc [ "name", `String "entity.name.tag.html" ]
                                ; ( "3"
                                  , `Assoc [ "name", `String "invalid.deprecated.html" ] )
                                ] )
                          ; "end", `String ">"
                          ; ( "endCaptures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.definition.tag.end.html" )
                                      ] )
                                ] )
                          ; "name", `String "meta.tag.structure.$2.end.html"
                          ; ( "patterns"
                            , `List [ `Assoc [ "include", `String "#attribute" ] ] )
                          ]
                      ; `Assoc
                          [ ( "begin"
                            , `String
                                "(?i)(<)((acronym|big|blink|font|strike|tt|xmp))(?=\\s|/?>)"
                            )
                          ; ( "beginCaptures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.definition.tag.begin.html"
                                        )
                                      ] )
                                ; "2", `Assoc [ "name", `String "entity.name.tag.html" ]
                                ; ( "3"
                                  , `Assoc [ "name", `String "invalid.deprecated.html" ] )
                                ] )
                          ; "end", `String ">"
                          ; ( "endCaptures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.definition.tag.end.html" )
                                      ] )
                                ] )
                          ; "name", `String "meta.tag.inline.$2.start.html"
                          ; ( "patterns"
                            , `List [ `Assoc [ "include", `String "#attribute" ] ] )
                          ]
                      ; `Assoc
                          [ ( "begin"
                            , `String
                                "(?i)(</)((acronym|big|blink|font|strike|tt|xmp))(?=\\s|/?>)"
                            )
                          ; ( "beginCaptures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.definition.tag.begin.html"
                                        )
                                      ] )
                                ; "2", `Assoc [ "name", `String "entity.name.tag.html" ]
                                ; ( "3"
                                  , `Assoc [ "name", `String "invalid.deprecated.html" ] )
                                ] )
                          ; "end", `String ">"
                          ; ( "endCaptures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.definition.tag.end.html" )
                                      ] )
                                ] )
                          ; "name", `String "meta.tag.inline.$2.end.html"
                          ; ( "patterns"
                            , `List [ `Assoc [ "include", `String "#attribute" ] ] )
                          ]
                      ; `Assoc
                          [ "begin", `String "(?i)(<)((frame))(?=\\s|/?>)"
                          ; ( "beginCaptures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.definition.tag.begin.html"
                                        )
                                      ] )
                                ; "2", `Assoc [ "name", `String "entity.name.tag.html" ]
                                ; ( "3"
                                  , `Assoc [ "name", `String "invalid.deprecated.html" ] )
                                ] )
                          ; "end", `String "/?>"
                          ; ( "endCaptures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.definition.tag.end.html" )
                                      ] )
                                ] )
                          ; "name", `String "meta.tag.object.$2.void.html"
                          ; ( "patterns"
                            , `List [ `Assoc [ "include", `String "#attribute" ] ] )
                          ]
                      ; `Assoc
                          [ "begin", `String "(?i)(<)((applet))(?=\\s|/?>)"
                          ; ( "beginCaptures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.definition.tag.begin.html"
                                        )
                                      ] )
                                ; "2", `Assoc [ "name", `String "entity.name.tag.html" ]
                                ; ( "3"
                                  , `Assoc [ "name", `String "invalid.deprecated.html" ] )
                                ] )
                          ; "end", `String ">"
                          ; ( "endCaptures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.definition.tag.end.html" )
                                      ] )
                                ] )
                          ; "name", `String "meta.tag.object.$2.start.html"
                          ; ( "patterns"
                            , `List [ `Assoc [ "include", `String "#attribute" ] ] )
                          ]
                      ; `Assoc
                          [ "begin", `String "(?i)(</)((applet))(?=\\s|/?>)"
                          ; ( "beginCaptures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.definition.tag.begin.html"
                                        )
                                      ] )
                                ; "2", `Assoc [ "name", `String "entity.name.tag.html" ]
                                ; ( "3"
                                  , `Assoc [ "name", `String "invalid.deprecated.html" ] )
                                ] )
                          ; "end", `String ">"
                          ; ( "endCaptures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.definition.tag.end.html" )
                                      ] )
                                ] )
                          ; "name", `String "meta.tag.object.$2.end.html"
                          ; ( "patterns"
                            , `List [ `Assoc [ "include", `String "#attribute" ] ] )
                          ]
                      ; `Assoc
                          [ ( "begin"
                            , `String
                                "(?i)(<)((dir|keygen|listing|menuitem|plaintext|spacer))(?=\\s|/?>)"
                            )
                          ; ( "beginCaptures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.definition.tag.begin.html"
                                        )
                                      ] )
                                ; "2", `Assoc [ "name", `String "entity.name.tag.html" ]
                                ; ( "3"
                                  , `Assoc
                                      [ ( "name"
                                        , `String
                                            "invalid.illegal.no-longer-supported.html" )
                                      ] )
                                ] )
                          ; "end", `String ">"
                          ; ( "endCaptures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.definition.tag.end.html" )
                                      ] )
                                ] )
                          ; "name", `String "meta.tag.other.$2.start.html"
                          ; ( "patterns"
                            , `List [ `Assoc [ "include", `String "#attribute" ] ] )
                          ]
                      ; `Assoc
                          [ ( "begin"
                            , `String
                                "(?i)(</)((dir|keygen|listing|menuitem|plaintext|spacer))(?=\\s|/?>)"
                            )
                          ; ( "beginCaptures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.definition.tag.begin.html"
                                        )
                                      ] )
                                ; "2", `Assoc [ "name", `String "entity.name.tag.html" ]
                                ; ( "3"
                                  , `Assoc
                                      [ ( "name"
                                        , `String
                                            "invalid.illegal.no-longer-supported.html" )
                                      ] )
                                ] )
                          ; "end", `String ">"
                          ; ( "endCaptures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.definition.tag.end.html" )
                                      ] )
                                ] )
                          ; "name", `String "meta.tag.other.$2.end.html"
                          ; ( "patterns"
                            , `List [ `Assoc [ "include", `String "#attribute" ] ] )
                          ]
                      ; `Assoc [ "include", `String "#math" ]
                      ; `Assoc [ "include", `String "#svg" ]
                      ; `Assoc
                          [ ( "begin"
                            , `String
                                "(<)([a-zA-Z][.0-9_a-zA-Z\\x{00B7}\\x{00C0}-\\x{00D6}\\x{00D8}-\\x{00F6}\\x{00F8}-\\x{037D}\\x{037F}-\\x{1FFF}\\x{200C}-\\x{200D}\\x{203F}-\\x{2040}\\x{2070}-\\x{218F}\\x{2C00}-\\x{2FEF}\\x{3001}-\\x{D7FF}\\x{F900}-\\x{FDCF}\\x{FDF0}-\\x{FFFD}\\x{10000}-\\x{EFFFF}]*-[\\-.0-9_a-zA-Z\\x{00B7}\\x{00C0}-\\x{00D6}\\x{00D8}-\\x{00F6}\\x{00F8}-\\x{037D}\\x{037F}-\\x{1FFF}\\x{200C}-\\x{200D}\\x{203F}-\\x{2040}\\x{2070}-\\x{218F}\\x{2C00}-\\x{2FEF}\\x{3001}-\\x{D7FF}\\x{F900}-\\x{FDCF}\\x{FDF0}-\\x{FFFD}\\x{10000}-\\x{EFFFF}]*)(?=\\s|/?>)"
                            )
                          ; ( "beginCaptures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.definition.tag.begin.html"
                                        )
                                      ] )
                                ; "2", `Assoc [ "name", `String "entity.name.tag.html" ]
                                ] )
                          ; "end", `String "/?>"
                          ; ( "endCaptures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.definition.tag.end.html" )
                                      ] )
                                ] )
                          ; "name", `String "meta.tag.custom.start.html"
                          ; ( "patterns"
                            , `List [ `Assoc [ "include", `String "#attribute" ] ] )
                          ]
                      ; `Assoc
                          [ ( "begin"
                            , `String
                                "(</)([a-zA-Z][.0-9_a-zA-Z\\x{00B7}\\x{00C0}-\\x{00D6}\\x{00D8}-\\x{00F6}\\x{00F8}-\\x{037D}\\x{037F}-\\x{1FFF}\\x{200C}-\\x{200D}\\x{203F}-\\x{2040}\\x{2070}-\\x{218F}\\x{2C00}-\\x{2FEF}\\x{3001}-\\x{D7FF}\\x{F900}-\\x{FDCF}\\x{FDF0}-\\x{FFFD}\\x{10000}-\\x{EFFFF}]*-[\\-.0-9_a-zA-Z\\x{00B7}\\x{00C0}-\\x{00D6}\\x{00D8}-\\x{00F6}\\x{00F8}-\\x{037D}\\x{037F}-\\x{1FFF}\\x{200C}-\\x{200D}\\x{203F}-\\x{2040}\\x{2070}-\\x{218F}\\x{2C00}-\\x{2FEF}\\x{3001}-\\x{D7FF}\\x{F900}-\\x{FDCF}\\x{FDF0}-\\x{FFFD}\\x{10000}-\\x{EFFFF}]*)(?=\\s|/?>)"
                            )
                          ; ( "beginCaptures"
                            , `Assoc
                                [ ( "1"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.definition.tag.begin.html"
                                        )
                                      ] )
                                ; "2", `Assoc [ "name", `String "entity.name.tag.html" ]
                                ] )
                          ; "end", `String ">"
                          ; ( "endCaptures"
                            , `Assoc
                                [ ( "0"
                                  , `Assoc
                                      [ ( "name"
                                        , `String "punctuation.definition.tag.end.html" )
                                      ] )
                                ] )
                          ; "name", `String "meta.tag.custom.end.html"
                          ; ( "patterns"
                            , `List [ `Assoc [ "include", `String "#attribute" ] ] )
                          ]
                      ] )
                ] )
          ; ( "xml-processing"
            , `Assoc
                [ "begin", `String "(<\\?)(xml)"
                ; ( "captures"
                  , `Assoc
                      [ "1", `Assoc [ "name", `String "punctuation.definition.tag.html" ]
                      ; "2", `Assoc [ "name", `String "entity.name.tag.html" ]
                      ] )
                ; "end", `String "(\\?>)"
                ; "name", `String "meta.tag.metadata.processing.xml.html"
                ; "patterns", `List [ `Assoc [ "include", `String "#attribute" ] ]
                ] )
          ] )
    ]
;;
