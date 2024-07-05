_:

{
  perSystem = { pkgs, ... }: {
    devShells.default = pkgs.mkShell {
      packages = with pkgs; [
        deno
        direnv
        git
        nix-direnv
      ];
    };
  };
}
