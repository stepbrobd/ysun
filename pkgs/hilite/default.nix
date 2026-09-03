{ lib
, buildDunePackage
, cmarkit
, textmate-language
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

  propagatedBuildInputs = [
    cmarkit
    textmate-language
  ];

  doCheck = true;
})
