{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    utils.url = "github:numtide/flake-utils";
  };

  outputs =
    { self
    , nixpkgs
    , utils
    }: utils.lib.eachDefaultSystem
      (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        lib = nixpkgs.lib;
        name = "ysun";
        port = 8080;
      in
      {
        packages = rec {
          default = site;

          site = pkgs.stdenvNoCC.mkDerivation {
            inherit name;
            src = ./.;
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

          image =
            let
              caddyfile = pkgs.writeTextFile {
                name = "caddyfile";
                text = ''
                  {
                      admin off
                      auto_https off
                  }

                  :${builtins.toString port} {
                      root * {$SITE_ROOT}
                      file_server
                      encode zstd gzip

                      handle_errors {
                          rewrite * /
                          file_server
                      }
                  }
                '';
              };
            in
            pkgs.dockerTools.buildImage {
              inherit name;
              tag = "latest";
              config = {
                Env = [
                  "ENABLE_TELEMETRY=false"
                  "SITE_ROOT=${site}/var/www/html"
                ];
                Cmd = [
                  "${pkgs.caddy}/bin/caddy"
                  "run"
                  "--config"
                  "${caddyfile}"
                  "--adapter"
                  "caddyfile"
                  "--environ"
                ];
                ExposedPorts = {
                  "${builtins.toString port}/tcp" = { };
                };
              };
            };

          deploy =
            let
              config = pkgs.writeTextFile {
                name = "fly.toml";
                text = ''
                  app = "${name}"

                  [build]
                  ignorefile = ".gitignore"

                  [http_service]
                  internal_port = ${builtins.toString port}
                  force_https = true
                  auto_stop_machines = true
                  auto_start_machines = true
                  min_machines_running = 0

                  [[http_service.checks]]
                  timeout = "5s"
                  grace_period = "15s"
                  interval = "30s"
                  method = "GET"
                  path = "/"
                '';
              };
            in
            pkgs.writeShellScriptBin "deploy" ''
              set -euxo pipefail
              export PATH="${lib.makeBinPath [(pkgs.docker.override { clientOnly = true; }) pkgs.flyctl]}:$PATH"
              image=$(docker load < ${image} | awk '{ print $3; }')
              flyctl deploy --config ${config} --local-only --no-cache --image $image
              docker image rm $image
            '';
        };

        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            deno
            direnv
            git
            nix-direnv
          ];
        };

        formatter = pkgs.writeShellScriptBin "formatter" ''
          ${pkgs.deno}/bin/deno fmt .
          ${pkgs.nixpkgs-fmt}/bin/nixpkgs-fmt .
        '';
      }) // {
      hydraJobs = {
        inherit (self)
          packages devShells formatter;
      };
    };
}
