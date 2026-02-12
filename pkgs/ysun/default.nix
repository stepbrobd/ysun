{ lib
, buildDunePackage
, cmdliner
, dune-build-info
, minhtml
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
    minhtml
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

    dune install --prefix $out --libdir $OCAMLFIND_DESTDIR ${finalAttrs.pname}

    rm outputs/cache
    (shopt -s globstar; minhtml --minify-css --minify-js outputs/**/*.html)
    mkdir -p $out/var/www/html
    cp -r outputs/* $out/var/www/html/

    runHook postInstall
  '';
})
