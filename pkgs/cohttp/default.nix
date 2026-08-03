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
  version = "6.2.2";

  src = fetchzip {
    url = "https://github.com/mirage/ocaml-cohttp/releases/download/v${finalAttrs.version}/cohttp-${finalAttrs.version}.tbz";
    hash = "sha256-BhtJJlwV6Y7O854U8j4ZPgBNU3Yx3cxkKc9KJva2JK8=";
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
