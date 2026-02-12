---
date: 2025-08-05
description: Yifei Sun - 孫 奕飛 (そん いーふぇい)
title: Yifei Sun
url: /index.html
---

Before you read on, here's my weird flex: I have 3 `.arpa` zones (1 `.ip6.arpa` and 2 `.in-addr.arpa`).
These are typically delegated by [RIRs](https://en.wikipedia.org/wiki/Regional_Internet_registry) to ISPs, but Im using them for various networking experiments.
This site is served via [anycast](https://en.wikipedia.org/wiki/Anycast) on my homemade CDN built on top of [couple NixOS servers](https://bsky.app/profile/stepbrobd.com/post/3m25pwp26q223).

Since TLS certs for `.arpa` zones are generally not issued by public CAs, I configured [Caddy](https://github.com/caddyserver/caddy) to serve the site over plain HTTP.
After following [this guide](https://vojk.au/posts/how_to_get_a_ip6_arpa_tls_certificate/), I managed to get Cloudflare to issue trusted certs [^1] on their end (tho I can't download them) and proxy traffic on top of my own CDN (AS10779 --(HTTP)--> AS13335 --(HTTPS)--> You).

- [0.0.9.5.f.2.0.6.2.ip6.arpa](https://0.0.9.5.f.2.0.6.2.ip6.arpa)
- [104.161.23.in-addr.arpa](https://104.161.23.in-addr.arpa)
- [136.104.192.in-addr.arpa](https://136.104.192.in-addr.arpa)

[^1]: Cloudflare [Universal SSL](https://developers.cloudflare.com/ssl/edge-certificates/universal-ssl/) will only work for `.ip6.arpa` zones. If you have `.in-addr.arpa` zones and want to get certs with Cloudflare, you need to enroll in [Advanced Certificate Manager](https://developers.cloudflare.com/ssl/edge-certificates/advanced-certificate-manager/) (paid feature) as `.in-addr.arpa` certs are not covered under Universal SSL.

---

I am a PhD student at [INRIA](https://www.inria.fr) [DataMove Team](https://team.inria.fr/datamove) under [Olivier Richard](https://datamove.imag.fr/olivier.richard) and [Christian Perez](https://avalon.ens-lyon.fr/~cperez/web/doku.php/start) ([Avalon Team](https://avalon.ens-lyon.fr)).
I got my master's from Northeastern University advised by [Ji-Yong Shin](https://www.jiyongshin.info) at [Systems Research Group](https://srg.khoury.northeastern.edu).
I visited [Computing Software Group](https://www.csg.ci.i.u-tokyo.ac.jp/en) advised by [Tomoharu Ugawa](https://tugawa.github.io/index-e.html) at University of Tokyo during the summer of 2024.
I finished my undergrad at University of Utah advised by [Shad Roundy](https://iss.mech.utah.edu/shad-roundy) and co-advisor [Tucker Hermans](https://robot-learning.cs.utah.edu/thermans).

I'm generally interested in system and theory ([CV](/cv)), topics include:

- Verifications on consistency semantic constraints in distributed systems.
- Constructive type theory and mechanized proofs.
- [Reproducible (build) system](https://reproducible-builds.org) in HPC environments.

My contact info is hidden within the [source code of this site](https://github.com/search?q=repo%3Astepbrobd%2Fysun+%22hidden%3A+true%22+%22redirect%3A+https%3A%2F%2F%22+%22layout%3A+redirect%22&type=code).
Search for the platform you want to reach me on in all lowercase (e.g. [`github`](/github), [`linkedin`](/linkedin), etc.).
You can reach me directly with [Matrix](/matrix), Discord (use my GitHub username), or email (`echo -n 'eXN1bkBoZXkuY29tCg==' | base64 --decode`).

![Weekend outing with labmates (Walden Pond)](/assets/static/img/home-1.avif)

I ride a Trek Fuel EX 5 for fun and commute, and I daily-drive a Framework Laptop 13 with NixOS and a 14-inch MacBook Pro on the go.
I own and operate [AS10779](/10779) ([PeeringDB](/peeringdb), [looking glass](https://bgp.tools/lg/10779)) with two IP assignments from ARIN.
I maintain [about 150 packages](https://repology.org/maintainers/?search=ysun%40hey.com) and [actively](https://github.com/NixOS/nixpkgs/issues?q=involves%3Astepbrobd) contribute to the Nix ecosystem.
During my free time, I enjoy swimming, [cycling](/strava), archery, and playing [osu!](/osu) (mostly mania and std with Wacom Intuos Pro).
Streaming services? Apple Music all the way ([playlist](/music))!

![You just have to go out and touch grass once in a while (Uji Shrine)](/assets/static/img/home-2.avif)

Cloudflare generously sponsors me an [Enterprise plan](https://www.cloudflare.com/plans/enterprise/) under [Project Alexandria](https://www.cloudflare.com/lp/project-alexandria/).
Go check it out if you have open source projects!
But... I host a backup of this site on Fastly [ysun.global.ssl.fastly.net](https://ysun.global.ssl.fastly.net) ;)

Random recommendations (unordered):

- Paid search engine [Kagi](https://kagi.com), you control the ranking
- [NixOS](https://nixos.org) for your next OS
- Self-hostable code search engine [Zoekt](https://github.com/sourcegraph/zoekt)
- Get an amateur radio license, my callsign is KC1VZR
- Email over radio with [Winlink](https://winlink.org) + [Pat](https://github.com/la5nta/pat)
- [Tailscale](https://tailscale.com), [Headscale](https://github.com/juanfont/headscale), or at least [WireGuard](https://www.wireguard.com)
- [Kanidm](https://kanidm.com) for OAuth/OIDC and read-only LDAP
- Learn [OCaml](https://ocaml.org) with [Dune](https://dune.build)
- Write a toy language?
- Learn how to mechanize proofs?
- Static site generator [Lume](https://github.com/lumeland/lume) + [Cloudflare Pages](https://pages.cloudflare.com)
- [Cobalt](https://cobalt.tools/about/general), yet another FFmpeg wrapper, but nice
- Cloudflare's [public RTR server](https://github.com/cloudflare/rpki-rtr-client) for route filtering
- Secure NTP (NTS) with [`ntpd-rs`](https://github.com/pendulum-project/ntpd-rs), and Cloudflare's [NTS capable](https://developers.cloudflare.com/time-services/nts/) NTP server
