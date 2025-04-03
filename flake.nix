{
  outputs = { nixpkgs, parts, systems, deno, ... } @ inputs: parts.lib.mkFlake { inherit inputs; } {
    systems = import systems;

    perSystem = { pkgs, system, ... }: {
      _module.args = {
        lib = builtins // nixpkgs.lib // parts.lib;
        pkgs = import nixpkgs {
          inherit system;
          overlays = [ deno.overlays.default ];
        };
      };

      devShells.default = pkgs.mkShell {
        packages = [
          pkgs.deno
          pkgs.direnv
          pkgs.git
          pkgs.nix-direnv
        ];
      };

      formatter = pkgs.writeShellScriptBin "formatter" ''
        ${pkgs.deno}/bin/deno fmt .
        ${pkgs.nixpkgs-fmt}/bin/nixpkgs-fmt .
      '';

      packages.default = pkgs.denoPlatform.mkDenoDerivation {
        name = "ysun";
        stdenv = pkgs.stdenvNoCC;
        src = ./.;
        buildPhase = ''
          deno task build
        '';
        installPhase = ''
          mkdir -p $out
          cp -r outputs/* $out
        '';
        meta.broken = true;
      };
    };
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    parts.url = "github:hercules-ci/flake-parts";
    parts.inputs.nixpkgs-lib.follows = "nixpkgs";
    systems.url = "github:nix-systems/default";
    deno.url = "github:nekowinston/nix-deno";
    deno.inputs.nixpkgs.follows = "nixpkgs";
  };
}
