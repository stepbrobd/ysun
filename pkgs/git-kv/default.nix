{ buildDunePackage
, fetchFromGitHub
, alcotest
, base64
, bstr
, carton
, carton-git-lwt
, cstruct
, digestif
, emile
, encore
, fmt
, fpath
, hxd
, ke
, logs
, lwt
, mimic
, mirage-kv
, mirage-ptime
, psq
, ptime
, uri
}:

buildDunePackage (finalAttrs: {
  pname = "git-kv";
  version = "0.2.1";

  src = fetchFromGitHub {
    owner = "robur-coop";
    repo = "git-kv";
    tag = "v${finalAttrs.version}";
    hash = "sha256-KzWeRsmm9U5wSJMn9xFtic9VJKtYa9bNQq31NPFFv88=";
  };

  env.DUNE_CACHE = "disabled";

  propagatedBuildInputs = [
    base64
    bstr
    carton
    carton-git-lwt
    cstruct
    digestif
    emile
    encore
    fmt
    fpath
    hxd
    ke
    logs
    lwt
    mimic
    mirage-kv
    mirage-ptime
    psq
    ptime
    uri
  ];

  doCheck = true;

  checkInputs = [
    alcotest
  ];
})
