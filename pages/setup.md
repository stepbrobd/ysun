---
title: Nix Binary Cache
description: Nix Binary Cache
created: 2026-05-30
updated: 2026-05-30
hidden: true
---

## Public Key

Add these trusted public keys to your Nix/NixOS/nix-darwin configuration to
verify packages from this cache:

```txt
cache.ysun.co-1:WxPYwT5g3kt9XhUhHPpNLZKI9HIOsVVAuqSHpok8Qt4=
```

## Usage Instructions

Huge thanks to [Fastly](https://www.fastly.com) for the sponsorship! Follow
below instructions to use the cache:

### Option 1: Command Line (Temporary)

Use this cache for a single Nix command:

```shell
nix run \
  --substituters 'https://cache.ysun.co' \
  --trusted-public-keys 'cache.ysun.co-1:WxPYwT5g3kt9XhUhHPpNLZKI9HIOsVVAuqSHpok8Qt4=' \
  nixpkgs#osu-lazer-bin
```

### Option 2: Nix Configuration (Persistent)

Add to your `~/.config/nix/nix.conf` or `/etc/nix/nix.conf`:

```txt
extra-substituters = https://cache.ysun.co
extra-trusted-public-keys = cache.ysun.co-1:WxPYwT5g3kt9XhUhHPpNLZKI9HIOsVVAuqSHpok8Qt4=
```

### Option 3: NixOS/nix-darwin Configuration

Add to your `/etc/nixos/configuration.nix` or
`/etc/nix-darwin/configuration.nix`:

```nix
nix.settings = {
  extra-substituters = [ "https://cache.ysun.co" ];
  extra-trusted-public-keys = [ "cache.ysun.co-1:WxPYwT5g3kt9XhUhHPpNLZKI9HIOsVVAuqSHpok8Qt4=" ];
};
```

### Option 4: Flake

Add to your `flake.nix`:

```nix
{
  nixConfig = {
    extra-substituters = [ "https://cache.ysun.co" ];
    extra-trusted-public-keys = [ "cache.ysun.co-1:WxPYwT5g3kt9XhUhHPpNLZKI9HIOsVVAuqSHpok8Qt4=" ];
  };

  # ... rest of your flake
}
```

Note: Using `extra-*` settings will add this cache alongside the default
`cache.nixos.org` cache.
