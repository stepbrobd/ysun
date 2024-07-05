_:

{
  perSystem = { lib, pkgs, ... }: {
    packages.caddy =
      let
        inherit (pkgs) caddy git go stdenv xcaddy;
        plugins = [ "github.com/caddyserver/cache-handler" ];
      in
      stdenv.mkDerivation {
        pname = "caddy";
        inherit (caddy) version;

        dontUnpack = true;

        configurePhase = ''
          runHook preConfigure
          export GOCACHE=$TMPDIR/go-cache
          export GOPATH="$TMPDIR/go"
          runHook postConfigure
        '';

        nativeBuildInputs = [ git go xcaddy ];

        buildPhase =
          let
            pluginArgs = lib.concatMapStringsSep " " (plugin: "--with ${plugin}") plugins;
          in
          ''
            runHook preBuild
            ${xcaddy}/bin/xcaddy build v${caddy.version} ${pluginArgs}
            runHook postBuild
          '';

        installPhase = ''
          runHook preInstall
          mkdir -p $out/bin
          mv caddy $out/bin
          runHook postInstall
        '';

        meta.mainProgram = "caddy";
      };
  };
}
