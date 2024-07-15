_:

{
  perSystem = { pkgs, ... }: {
    packages.site = pkgs.stdenvNoCC.mkDerivation {
      inherit (_.configs) name;
      src = ../.;
      configurePhase = ''
        runHook preConfigure
        export HOME=$TMPDIR/home
        export DENO_DIR=$TMPDIR/deno
        runHook postConfigure
      '';
      nativeBuildInputs = with pkgs; [ deno ];
      buildPhase = ''
        runHook preBuild
        deno task lume
        runHook postBuild
      '';
      installPhase = ''
        runHook preInstall
        mkdir -p $out/var/www/{source,rendered}
        cp -r $src/* $out/var/www/source
        cp -r outputs/* $out/var/www/rendered
        runHook postInstall
      '';
    };
  };
}
