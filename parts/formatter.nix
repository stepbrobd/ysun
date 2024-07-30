{
  perSystem = { pkgs, ... }: {
    formatter = pkgs.writeShellScriptBin "formatter" ''
      ${pkgs.deno}/bin/deno fmt .
      ${pkgs.nixpkgs-fmt}/bin/nixpkgs-fmt .
    '';
  };
}
