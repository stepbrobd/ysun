_:

{
  perSystem = { pkgs, system, ... }: {
    packages.image =
      let
        inherit (_.configs) name port;
        inherit (_.outputs.packages.${system}) site;

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
  };
}
