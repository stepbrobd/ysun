{ buildDunePackage
, fetchFromGitHub
, alcotest
, base64
, crowbar
, fmt
, http
, ipaddr
, logs
, ppx_expect
, ppx_sexp_conv
, re
, stringext
, uri
, uri-sexp
,
}:

buildDunePackage (finalAttrs: {
  pname = "cohttp";
  version = "6.2.1";

  src = fetchFromGitHub {
    owner = "mirage";
    repo = "ocaml-cohttp";
    tag = "v${finalAttrs.version}";
    hash = "sha256-3cFSnhaQHlQcVMbEA6wSPvzp/6C5OTBepyz/6ksKJLM=";
  };

  env.DUNE_CACHE = "disabled";

  propagatedBuildInputs = [
    base64
    http
    ipaddr
    logs
    ppx_sexp_conv
    re
    stringext
    uri
    uri-sexp
  ];

  doCheck = true;

  checkInputs = [
    alcotest
    crowbar
    fmt
    ppx_expect
  ];
})
