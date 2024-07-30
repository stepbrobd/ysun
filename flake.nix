{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    parts.url = "github:hercules-ci/flake-parts";
    parts.inputs.nixpkgs-lib.follows = "nixpkgs";
    systems.url = "github:nix-systems/default";
  };

  outputs = inputs: inputs.parts.lib.mkFlake
    {
      inherit inputs;
      specialArgs.configs = {
        name = "ysun";
        port = 8080;
        cms = 3000;
      };
    }
    {
      systems = import inputs.systems;
      imports = [ ./parts ];
    };
}
