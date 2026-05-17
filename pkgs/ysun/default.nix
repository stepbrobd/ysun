{ lib
, buildDunePackage
, cmdliner
, deno
, dune-build-info
, tailwindcss_4
, yocaml
, yocaml_eio
, yocaml_liquid
, yocaml_omd
, yocaml_syndication
, yocaml_yaml
}:

buildDunePackage (finalAttrs: {
  pname = "ysun";
  version = with lib; pipe ./dune-project [
    readFile
    (match ".*\\(version ([^\n]+)\\).*")
    head
  ];

  src = with lib.fileset; toSource {
    root = ../../.;
    fileset = unions [
      # generator
      ./bin
      ./lib
      ./dune-project
      # site data
      ../../assets
      ../../pages
      ../../dune-workspace
    ];
  };

  env.DUNE_CACHE = "disabled";

  nativeBuildInputs = [
    deno
    tailwindcss_4
  ];

  buildInputs = [
    cmdliner
    dune-build-info
    yocaml
    yocaml_eio
    yocaml_liquid
    yocaml_omd
    yocaml_syndication
    yocaml_yaml
  ];

  buildPhase = ''
    runHook preBuild

    dune build -p ${finalAttrs.pname} ''${enableParallelBuilding:+-j $NIX_BUILD_CORES}
    dune exec pkgs/ysun/bin/ysun.exe -- build

    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall

    rm outputs/cache
    DENO_DIR=$(mktemp -d) deno fmt outputs
    mkdir -p $out/var/www/html
    cp -r outputs/* $out/var/www/html/

    runHook postInstall
  '';
})
