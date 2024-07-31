{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    parts.url = "github:hercules-ci/flake-parts";
    parts.inputs.nixpkgs-lib.follows = "nixpkgs";
    systems.url = "github:nix-systems/default";
    autopilot.url = "github:stepbrobd/autopilot";
    autopilot.inputs.nixpkgs.follows = "nixpkgs";
    autopilot.inputs.parts.follows = "parts";
    autopilot.inputs.systems.follows = "systems";
  };

  outputs = inputs: inputs.autopilot.lib.mkFlake
    {
      inherit inputs;

      specialArgs.configs = {
        name = "ysun";
        port = 8080;
        cms = 3000;
      };

      autopilot.parts.path = ./parts;
    }
    { systems = import inputs.systems; };
}
