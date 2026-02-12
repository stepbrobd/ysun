{ lib
, buildDunePackage
, dune-build-info
, imagemagick
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
    dune-build-info
    uucp
    uunf
    uutf
  ];

  propagatedNativeBuildInputs = [
    imagemagick
  ];

  doCheck = true;

  checkInputs = [
    ppx_expect
  ];
})
