_:

{
  perSystem = { pkgs, ... }: {
    packages.site =
      let
        inherit (_.configs) name;
      in
      pkgs.stdenvNoCC.mkDerivation {
        inherit name;
        src = ../.;
        configurePhase = ''
          runHook preConfigure
          unset HOME
          unset XDG_CACHE_HOME
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
