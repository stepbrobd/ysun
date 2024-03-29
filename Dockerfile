	
FROM	nixos/nix:latest	AS	builder
COPY	.	/tmp/build
WORKDIR	/tmp/build
RUN	nix     --extra-experimental-features "nix-command flakes"     build
RUN	mkdir /tmp/closure
RUN	cp -R $(nix-store -qR result/) /tmp/closure
FROM	scratch	AS	runner
WORKDIR	/run
COPY	/tmp/closure	/nix/store
COPY	/tmp/build/result	/run
CMD	["/run/bin/ysun"]
