{ buildDunePackage
, fetchzip
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
  version = "6.3.0";

  src = fetchzip {
    url = "https://github.com/mirage/ocaml-cohttp/releases/download/v${finalAttrs.version}/cohttp-${finalAttrs.version}.tbz";
    hash = "sha256-z0N/ABNwPADmt1r8IGthaLjFQUezyHaRferoE6Nz3DA=";
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
