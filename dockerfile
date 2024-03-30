FROM nixos/nix:latest AS builder
COPY . /tmp/build
WORKDIR /tmp/build
RUN nix --extra-experimental-features "nix-command flakes" build
RUN mkdir /tmp/closure && cp -R $(nix-store -qR result/) /tmp/closure
RUN realpath /tmp/build/result >/tmp/target

FROM busybox AS runner
COPY --from=builder /tmp/closure /nix/store
COPY --from=builder /tmp/target /tmp/target
CMD $(cat /tmp/target)/bin/ysun
