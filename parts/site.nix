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
        mkdir -p $out/var/www/html
        cp -r outputs/* $out/var/www/html
        runHook postInstall
      '';
    };
  };
}
