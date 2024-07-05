{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    parts.url = "github:hercules-ci/flake-parts";
    parts.inputs.nixpkgs-lib.follows = "nixpkgs";
    systems.url = "github:nix-systems/default";
  };

  outputs = { self, ... } @ inputs:
    let inherit (self) outputs; in
    inputs.parts.lib.mkFlake
      {
        inherit inputs;
        specialArgs = {
          inherit outputs;
          configs = {
            name = "ysun";
            port = 8080;
          };
        };
      }
      {
        systems = import inputs.systems;
        imports = [ ./parts ];
      };
}
