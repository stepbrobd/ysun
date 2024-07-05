_:

{
  perSystem = { pkgs, system, ... }: {
    packages.image =
      let
        inherit (_.configs) name port;
        inherit (_.outputs.packages.${system}) caddy site;

        caddyfile = pkgs.writeTextFile {
          name = "caddyfile";
          text = ''
            {
                admin off
                auto_https off
                cache
            }

            :${builtins.toString port} {
                cache
                encode zstd gzip
                file_server
                root * {$SITE_ROOT}

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
            "${caddy}/bin/caddy"
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
  };
}
