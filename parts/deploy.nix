{ configs, ... }:

{
  perSystem = { lib, pkgs, self', ... }: {
    packages.deploy =
      let
        inherit (self'.packages) image;
        inherit (configs) name port;

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
}
