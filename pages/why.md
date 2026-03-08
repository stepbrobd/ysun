---
created: 2026-03-03
updated: 2026-03-03
description: Why do I have the second largest Nix monorepo? I'll cover how I setup a weird configuration structure that allowed me to override arbitrary nixpkgs.lib functions and any nix packages.
title: Why do I have the second largest Nix monorepo?
---

So... First of all, clickbait title ;) I'm certain there are larger Nix monorepo
than what I have here, but still, 14k LoC of Nix for config is still kinda
insane!

## Philosophy

I want MY library functions and package definitions to have the highest
priority, and be made available wherever I am. This means, in `flake-parts`
flake modules, in overridden library scope, in NixOS/Darwin modules, modules for
Terranix, package definitions, etc., when I refer to `pkgs` or `lib`, I would
want to have the version with my overlays applied + whatever extensions I
injected.

To make this possible, the evaluation must start at library functions, and
ideally, everything in `lib` should be pure (i.e. no side effects), and depends
only on `builtins`, `nixpkgs.lib`, and the extensions I imported through
`autopilot`.

## Autopilot

Autopilot is a thin `flake-parts` wrapper that's talared to my taste of how a
"nix flake" (damn I feel cringe writing this, for stable Nix users, I don't care
what your think how Nix should work, I pick my own shit and I picked the one
that suits me the best) should look like.

In the repo, I wrote:

> Autopilot evaluates user defined library before letting `flake-parts`
> takeover. User defined library (including extensions) will be passed as
> `specialArgs` to `flake-parts`, i.e. `lib` will be made available to
> `flake-parts` modules and `perSystem` configurations.

And a sample `flake.nix` (with `inputs` stripped to save some space):

```nix
{
  outputs = inputs: inputs.autopilot.lib.mkFlake
  {
    inherit inputs;

    autopilot = {
      lib = {
        path = ./lib;
        excludes = [ ];
        extender = inputs.nixpkgs.lib;
        extensions = with inputs; [ autopilot.lib parts.lib ];
      };

      nixpkgs = {
        config.allowUnfree = true;
        overlays = [ ];
        instances = [
          { pkgs = inputs.nixpkgs; }
          { unstable = inputs.unstable; }
        ];
      };

      parts = { path = ./modules/flake; excludes = [ ]; };
    };
  }
  { systems = import inputs.systems; };
}
```

In the most simple case, I want the repo to look like this:

```
- flake.nix
- lib
  - add-one.nix
- modules
  - flake
    - formatter.nix
```

Where:

```nix
# ./lib/add-one.nix # will be made available as `lib.addOne`
{ lib }: x: x + 1
```

```nix
# ./modules/flake/formatter.nix
{
  perSystem = { unstable, ... }: {
    formatter = unstable.nixpkgs-fmt;
  };
}
```
