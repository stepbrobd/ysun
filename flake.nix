{
  outputs = { self, nixpkgs, parts, systems } @ inputs: parts.lib.mkFlake { inherit inputs; } {
    systems = import systems;

    perSystem = { lib, pkgs, system, ... }: {
      _module.args = {
        lib = builtins // parts.lib // nixpkgs.lib;
        pkgs = import nixpkgs { inherit system; };
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
        ${lib.getExe pkgs.deno} fmt .
        ${lib.getExe pkgs.nixpkgs-fmt} .
      '';

      packages.default = pkgs.stdenvNoCC.mkDerivation {
        pname = "ysun";
        version = "0-git";
        src = ./.;
        outputHashAlgo = "sha256";
        outputHashMode = "recursive";
        outputHash = "sha256-H5kd0je/6DDLJTQM1y0PeYZA8B0YRu5cb/pU6KHd3sw=";
        nativeBuildInputs = [ pkgs.deno ];
        buildPhase = ''
          runHook preBuild
          export HOME=$TMPDIR
          deno task build
          runHook postBuild
        '';
        installPhase = ''
          runHook preInstall
          mkdir -p $out/var/www/html
          cp -r outputs/* $out/var/www/html/
          runHook postInstall
        '';
      };
    };
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    parts.url = "github:hercules-ci/flake-parts";
    parts.inputs.nixpkgs-lib.follows = "nixpkgs";
    systems.url = "github:nix-systems/default";
  };
}
