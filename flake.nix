{
  outputs = { self, nixpkgs, parts, systems, deno } @ inputs: parts.lib.mkFlake { inherit inputs; } {
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

      packages.site = pkgs.denoPlatform.mkDenoDerivation {
        name = "site";
        stdenv = pkgs.stdenvNoCC;
        src = ./.;
        buildPhase = "deno task build";
        installPhase = ''
          mkdir -p $out
          cp -r outputs/* $out
        '';
      };

      packages.exec = pkgs.denoPlatform.mkDenoBinary rec {
        name = "exec";
        src = ./.;
        unstable = true;
        permissions.allow = {
          env = true;
          sys = true;
          net = true;
          read = true;
        };
        entryPoint = "_main.ts";
        buildPhase = ''
          deno compile ${pkgs.denoPlatform.lib.generateFlags {
            inherit permissions unstable entryPoint;
            additionalDenoArgs = ["--output" name];
          }}
        '';
      };

      # workaround
      # build without sandbox on gha
      # and import as pure derivation
      packages.default =
        let
          importnar = name: url: hash: import <nix/fetchurl.nix> {
            inherit name url hash;
            unpack = true;
          };
          exec = importnar
            "exec"
            "https://github.com/stepbrobd/ysun/releases/download/2025.04.03.18.06.19/exec.nar"
            "sha256-0dAXdWdJPaf7Cqc3FSKKCRFdj/Wpuk4VCwjtvv2Oysk=";
          site = importnar
            "site"
            "https://github.com/stepbrobd/ysun/releases/download/2025.04.03.18.06.19/site.nar"
            "sha256-lTahzI6A9Rbuu7yF2XoQQPNQRBgSyiMWxBqBPeW/gyk=";
        in
        pkgs.writeShellApplication {
          meta.platforms = [ "x86_64-linux" ];
          name = "ysun";
          runtimeInputs = [ exec site ];
          text = ''
            exec ${exec}/bin/exec ${site} "$@"
          '';
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
