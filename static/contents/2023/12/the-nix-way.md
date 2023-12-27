---
title: The Nix Way
description: Nix, a deterministic and reproducible package manager and system configuration tool. Nix Flakes, the correct/only way of using Nix.
modified: 2023-12-08
---

# The Nix Way

This is a guide to my personal [dotfiles repo](https://github.com/stepbrobd/dotfiles) (for NixOS and Darwin systems),
use it as a reference to create your own.

## Installation

I suggest anyone that wants to try out Nix not to use the official installer, but to use the
[Nix Installer](https://github.com/determinatesystems/nix-installer) by Determinate Systems.
It installs Nix, while providing a way to remove it from your system.

```shell
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install --no-confirm
```

## The Only Correct Way of Using Nix

If you are following online guides, a lot of those will probably tell you to run some commands start with `nix-env` or `nix-channel`, don't use it!
Those `nix-` commands are [channel based](https://nixos.wiki/wiki/Nix_channels), while "reproducible", but hard to maintain.
Instead, use [Nix Flakes](https://nixos.wiki/wiki/Flakes), think of it as a way to pin channels to a specific commit,
so you can get the same result every time if the same flake inputs are given.
While Nix Flakes are still marked as "experimental", but [it does not mean it's unstable](https://determinate.systems/posts/experimental-does-not-mean-unstable).
Members of the Nix community are already using flakes at scale, I don't really see any way of flakes being removed from Nix.

If you installed Nix using the Nix Installer, you should already have flakes enabled.
If not, prefix all `nix` commands with `nix --extra-experimental-features "nix-command flakes"`.
If you see something like `echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf` in a guide, don't do it either.
Instead, in your flake configurations, enable experimental features like this (in the module format):

```nix
{ ... }:

{
    nix.settings.experimental-features = [
        "flakes"
        "nix-command"
    ];
}
```

Read more about flakes:

- [standard schemas](https://arc.net/l/quote/agerqwyq)
- [extensible schemas](https://determinate.systems/posts/flake-schemas)

## Modules

In the example above, `flakes` and `nix-command` are enabled in the format of a module.
Modules can be imported into system configurations, and they are usually considered as the most basic building blocks of nix-based configurations.
They can be attrsets, or a function that returns an attrset.

Generally, modules are imported directly from flake outputs inside a system configuration:

```nix
{
    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
        nix-darwin = {
            url = "github:lnl7/nix-darwin";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = { self, nixpkgs, nix-darwin } @ inputs:
    let
        inherit (self) outputs;
        lib = nixpkgs.lib // nix-darwin.lib;
    in
    {
        nixosConfigurations."nixos-machine-name" = lib.nixosSystem {
            specialArgs = { inherit inputs outputs; };
            modules = [
                ... # put modules here
            ];
        };
        darwinConfigurations."darwin-machine-name" = lib.darwinSystem {
            specialArgs = { inherit inputs outputs; };
            modules = [
                ... # put modules here
            ];
        };
    };
}
```

The `specialArgs` is used to pass arguments to modules, we added `inputs` and `outputs` to it so we can use them in modules like this:

```nix
{ inputs, outputs, ... }:

{
    ... # inputs and outputs are available here
    # example: inputs.nixpkgs or inputs.nix-darwin
    # example: outputs.nixosConfigurations."nixos-machine-name"
    # be very careful when using outputs, it can cause infinite recursion
}
```

[Standard arguments](https://arc.net/l/quote/fkjnloyb) like `config`, `pkgs`, `modulePath`, ... are passed to modules automatically.

## Getting Started on Configurations

...WIP
