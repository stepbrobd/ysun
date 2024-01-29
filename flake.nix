{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    { self
    , nixpkgs
    , flake-utils
    }: flake-utils.lib.eachDefaultSystem
      (system:
      let
        rev = self.rev or self.dirtyRev;
        pkgs = import nixpkgs { inherit system; };

        run = pkgs.writeShellApplication rec {
          name = "ysun";
          runtimeInputs = with pkgs; [ deno ];
          text = ''
            pushd "$(dirname "$0")" > /dev/null
            DENO_DEPLOYMENT_ID=${rev} deno run --allow-all main.ts
            popd
          '';
        };

        app = pkgs.stdenvNoCC.mkDerivation {
          pname = "ysun";
          version = self.shortRev or self.dirtyShortRev;
          src = ./.;
          nativeBuildInputs = with pkgs; [ deno jq ];
          configurePhase = ''
            unset HOME
            unset XDG_CACHE_HOME
            export HOME=$TMPDIR/home
            export DENO_DIR=$TMPDIR/deno
          '';
          buildPhase = ''
            ${pkgs.deno}/bin/deno cache dev.ts main.ts
            ${pkgs.deno}/bin/deno run --allow-all dev.ts build
          '';
          installPhase = ''
            mkdir -p $out/bin
            cp -r . $out/bin
          '';
        };

        drv = pkgs.symlinkJoin {
          name = "ysun";
          paths = [ app run ];
        };
      in
      {
        formatter = pkgs.writeShellScriptBin "formatter" ''
          ${pkgs.deno}/bin/deno fmt .
          ${pkgs.nixpkgs-fmt}/bin/nixpkgs-fmt .
        '';

        packages.default = drv;

        apps.default = flake-utils.lib.mkApp { drv = self.packages.${system}.default; };

        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            deno
            direnv
            git
            nix-direnv
          ];
        };
      }) // {
      hydraJobs = {
        inherit (self)
          packages devShells;
      };
    };
}
