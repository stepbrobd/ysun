{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    deno2nix = {
      url = "github:stepbrobd/deno2nix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-utils.follows = "flake-utils";
    };
  };

  outputs =
    { self
    , nixpkgs
    , flake-utils
    , deno2nix
    }: flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs = import nixpkgs {
        inherit system;
        overlays = [
          deno2nix.overlays.default
        ];
      };

      drv = pkgs.stdenvNoCC.mkDerivation rec {
        pname = "ysun";
        version = self.shortRev or self.dirtyShortRev;
        src = ./.;
        nativeBuildInputs = with pkgs; [ deno jq ];
        buildPhase = ''
          export DENO_DIR=$(mktemp -d)
          ln -s "${pkgs.deno2nix.internal.mkDepsLink (src+"/deno.lock")}" $(deno info --json | jq -r .modulesCache)
          ln -s "${pkgs.deno2nix.internal.mkNpmLink  (src+"/deno.lock")}" $(deno info --json | jq -r .npmCache)
          # TODO: fix "Expected a JavaScript or TypeScript module, but identified a Unknown module. Importing these types of modules is currently not supported."
          deno run --cached-only --allow-all --lock $src/deno.lock $src/dev.ts build
        '';
        installPhase = ''
          # TODO: test if only _fresh/ and static/ are needed
        '';
      };
    in
    {
      formatter = pkgs.nixpkgs-fmt;

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
    });
}
