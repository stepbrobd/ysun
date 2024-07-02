FROM nixos/nix:latest AS builder
COPY . /tmp/build
WORKDIR /tmp/build
RUN nix --extra-experimental-features "nix-command flakes" build

FROM caddy:latest AS runner
COPY --from=builder /tmp/build/caddyfile /etc/caddy/Caddyfile
COPY --from=builder /tmp/build/result/var/www/html /var/www/html
ENV SITE_PORT=80
ENV SITE_ROOT=/var/www/html
EXPOSE 80
CMD ["caddy", "run"]
