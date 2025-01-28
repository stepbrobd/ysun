{
  outputs = { nixpkgs, parts, systems, ... } @ inputs: parts.lib.mkFlake { inherit inputs; } {
    systems = import systems;

    perSystem = { pkgs, ... }: {
      _module.args.lib = builtins // nixpkgs.lib // parts.lib;

      devShells.default = pkgs.mkShell {
        packages = with pkgs; [
          deno
          direnv
          git
          nix-direnv
        ];
      };

      formatter = pkgs.writeShellScriptBin "formatter" ''
        ${pkgs.deno}/bin/deno fmt .
        ${pkgs.nixpkgs-fmt}/bin/nixpkgs-fmt .
      '';
    };
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    parts.url = "github:hercules-ci/flake-parts";
    parts.inputs.nixpkgs-lib.follows = "nixpkgs";
    systems.url = "github:nix-systems/default";
  };
}
