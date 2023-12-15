---
title: The Nix Way
description: Nix, a deterministic and reproducible package manager and system configuration tool. Nix Flakes, the correct/only way of using Nix.
modified: 2023-12-08
---

# The Nix Way

This is a guide to my personal [dotfiles repo](https://github.com/stepbrobd/dotfiles) (for NixOS and Darwin systems),
use it as a reference to create your own.

What's Nix? It's a "functional" package manager. With Nix Flakes, you provide a `flake.nix` file that describes your
system, with input, couple "functions" that define your system, then it outputs a "derivation" that describes your
system. Like a function, if you give it the same input, you get the same output.

## Installation

I suggest anyone that wants to try out Nix not to use the official installer, but to use the
[Nix Installer](https://github.com/DeterminateSystems/nix-installer) by Determinate Systems. It installs Nix, but also
gives you an easy way to fully remove it.

```shell
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```

After this, if you are following online guides, they'll probably tell you to run some commands start with `nix-env` or
`nix-channel`, don't use it! As mentioned above, Nix Flakes is the new way to use Nix, it's more deterministic and
reproducible, `nix-` commands are considered legacy and will be deprecated in the future.

Since we'll be using Nix Flakes, to prevent typing a lot of `--experimental-features` flags, we can set it in our
`~/.config/nix/nix.conf` file.

```shell
echo "experimental-features = nix-command flakes" > ~/.config/nix/nix.conf
```

To build the system configuration, we'll use the `nix build` command.

```shell
nix build github:stepbrobd/dotfiles#darwinConfigurations.$(nix --extra-experimental-features nix-command eval --impure --raw --expr "builtins.currentSystem") --show-trace
```

...WIP