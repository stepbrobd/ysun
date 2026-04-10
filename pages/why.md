---
title: Why do I have the second largest Nix monorepo?
description: Why do I have the second largest Nix monorepo? I'll cover how I setup a weird configuration structure that allowed me to override arbitrary nixpkgs.lib functions and any nix packages.
created: 2026-03-03
updated: 2026-04-10
hidden: true
---

So... First of all, clickbait title ;) I'm certain there are larger Nix monorepo
than what I have here, but still, 17k LoC of Nix (at the time of writing) for
config is still kinda insane!

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

In the simplest case, I want the repo to look like this:

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

The above is from the users' perspective, under the hood:

## Fixpoint?

The whole thing is one `extend` call in autopilot with a specific merge order:

```nix
finalLib = cfg.lib.extender.extend (final: prev: mergeAttrsList (
  # builtins minus whatever's already in the extender
  [ (removeAttrs builtins (intersectLists
      (attrNames cfg.lib.extender)
      (attrNames builtins))) ]
  # user provided extensions e.g. colmena.lib, parts.lib, terranix.lib, ...
  ++ cfg.lib.extensions
  # user's own ./lib/*.nix, loaded with `{ lib = final; }`
  ++ [ (loadAll {
        dir = cfg.lib.path;
        transformer = kebabToCamel;
        args = { lib = final; };
      }) ]
));
```

`mergeAttrsList` precedence goes `builtins` and `nixpkgs.lib` (the default
extender) < extensions < my stuff, e.g. if user defined a `lib/map.nix` that
does something weird, the newly defined function will shadow `builtins.map` and
`nixpkgs.lib.map`.

Note that every file under `./lib/` is loaded with `{ lib = final; }`, not
`{ lib = prev; }`. This way `lib/has-tag.nix` can reach into
`lib.blueprint.hosts.${hostName}` even though `lib/blueprint/default.nix` is a
sibling file loaded in the same pass.

Once `finalLib` exists, autopilot glues it onto `flake-parts`'s `specialArgs`:

```nix
finalArgs = recursiveUpdate args { specialArgs.lib = finalLib; };
```

From this point on, every `{ lib, ... }:` inside any flake-parts module or
`perSystem` or via `importApplyWithArgs` (to be covered below) (i.e. every
NixOS/darwin/home-manager/ terranix module) gets _my_ `lib` instead of whatever
downstream module system wanted to hand me.
