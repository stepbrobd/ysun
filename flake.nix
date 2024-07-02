{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    utils.url = "github:numtide/flake-utils";
  };

  outputs =
    { self
    , nixpkgs
    , utils
    }: utils.lib.eachDefaultSystem
      (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        packages.default = pkgs.stdenvNoCC.mkDerivation {
          name = "ysun";
          src = ./.;
          configurePhase = ''
            runHook preConfigure
            unset HOME
            unset XDG_CACHE_HOME
            export HOME=$TMPDIR/home
            export DENO_DIR=$TMPDIR/deno
            runHook postConfigure
          '';
          nativeBuildInputs = with pkgs; [ deno ];
          buildPhase = ''
            runHook preBuild
            deno task lume
            runHook postBuild
          '';
          installPhase = ''
            runHook preInstall
            mkdir -p $out/var/www/html
            cp -r outputs/* $out/var/www/html
            runHook postInstall
          '';
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
          ${pkgs.deno}/bin/deno fmt .
          ${pkgs.nixpkgs-fmt}/bin/nixpkgs-fmt .
        '';
      }) // {
      hydraJobs = {
        inherit (self)
          packages devShells formatter;
      };
    };
}
