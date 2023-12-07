{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    deno2nix = {
      url = "github:snO2wman/deno2nix";
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

      drv = pkgs.deno2nix.mkExecutable {
        pname = "ysun.co";
        version = self.shortRev or self.dirtyShortRev;
        src = ./.;
        allow.all = true;
        config = "./deno.jsonc";
        entrypoint = "./main.ts";
        lockfile = "./deno.lock";
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
