_:

{
  perSystem = { pkgs, self', ... }: {
    packages.image =
      let
        inherit (self'.packages) caddy site;
        inherit (_.configs) name port cms;

        caddyfile = pkgs.writeTextFile {
          name = "caddyfile";
          text = ''
            {
            	admin off
            	auto_https off
            	order rewrite before cache
            	cache
            }

            :${builtins.toString port} {
            	cache
            	encode zstd gzip

              handle_path /cms/* {
                reverse_proxy http://localhost:${builtins.toString cms}
              }

              handle {
                file_server
                root * {$SITE_ROOT}
              }

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
            "SITE_ROOT=${site}/var/www/rendered"
          ];
          Cmd = [
            "${caddy}/bin/caddy"
            "run"
            "--config"
            "${caddyfile}"
            "--adapter"
            "caddyfile"
            "&"
            "PWD=${site}/var/www/source"
            "${pkgs.deno}/bin/deno"
            "tasks"
            "lume"
            "cms"
          ];
          ExposedPorts = {
            "${builtins.toString port}/tcp" = { };
          };
        };
      };
  };
}
