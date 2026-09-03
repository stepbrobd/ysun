{ lib
, buildDunePackage
, cmarkit
, textmate-language
, yojson
}:

buildDunePackage (finalAttrs: {
  pname = "hilite";
  version = with lib; pipe ./dune-project [
    readFile
    (match ".*\\(version ([^\n]+)\\).*")
    head
  ];

  src = with lib.fileset; toSource {
    root = ./.;
    fileset = unions [
      ./src
      ./test
      ./dune-project
      ./license.txt
    ];
  };

  env.DUNE_CACHE = "disabled";

  # yojson only builds src/pp, which turns the textmate grammars into jsons.ml
  buildInputs = [
    yojson
  ];

  propagatedBuildInputs = [
    cmarkit
    textmate-language
  ];

  doCheck = true;
})
