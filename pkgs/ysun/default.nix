{ lib
, buildDunePackage
, cmdliner
, dune-build-info
, yocaml
, yocaml_eio
, yocaml_jingoo
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
    root = ./.;
    fileset = unions [
      ./bin
      ./data
      ./dune-project
      ./lib
      ./static
    ];
  };

  env.DUNE_CACHE = "disabled";

  buildInputs = [
    cmdliner
    dune-build-info
    yocaml
    yocaml_eio
    yocaml_jingoo
    yocaml_liquid
    yocaml_omd
    yocaml_syndication
    yocaml_yaml
  ];

  buildPhase = ''
    runHook preBuild
    dune build -p ${finalAttrs.pname} ''${enableParallelBuilding:+-j $NIX_BUILD_CORES}
    dune exec bin/ysun.exe -- build
    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall
    dune install --prefix $out --libdir $OCAMLFIND_DESTDIR ${finalAttrs.pname}
    mkdir -p $out/var/www/html
    cp -r outputs/* $out/var/www/html/
    runHook postInstall
  '';
})
