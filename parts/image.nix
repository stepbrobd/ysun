{ configs, ... }:

{
  perSystem = { pkgs, self', ... }: {
    packages.image =
      let
        inherit (pkgs) deno;
        inherit (self'.packages) caddy site;
        inherit (configs) name port cms;

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

              handle_path /admin/* {
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
            (pkgs.writeShellScript "start" ''
              ${caddy}/bin/caddy run --config ${caddyfile} --adapter caddyfile &
              cd ${site}/var/www/source && ${deno}/bin/deno task lume cms
            '')
          ];
          ExposedPorts = {
            "${builtins.toString port}/tcp" = { };
          };
        };
      };
  };
}
