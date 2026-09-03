{ lib
, buildDunePackage
, camlmath
, dune-build-info
, hilite
, imgmeta
, ppx_expect
, uucp
, uunf
, uutf
}:

buildDunePackage (finalAttrs: {
  pname = "omd";
  version = with lib; pipe ./dune-project [
    readFile
    (match ".*\\(version ([^\n]+)\\).*")
    head
  ];

  src = with lib.fileset; toSource {
    root = ./.;
    fileset = unions [
      ./bin
      ./src
      ./tests
      ./tools
      ./dune-project
      ./license.txt
    ];
  };

  env.DUNE_CACHE = "disabled";

  propagatedBuildInputs = [
    camlmath
    dune-build-info
    hilite
    imgmeta
    uucp
    uunf
    uutf
  ];

  doCheck = true;

  checkInputs = [
    ppx_expect
  ];
})
