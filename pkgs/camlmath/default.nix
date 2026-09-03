{ buildDunePackage
, fetchFromGitHub
, alcotest
}:

buildDunePackage (finalAttrs: {
  pname = "camlmath";
  version = "2026.903.0";

  src = fetchFromGitHub {
    owner = "stepbrobd";
    repo = "camlmath";
    tag = finalAttrs.version;
    hash = "sha256-yNCEpoXDOn+lJMquvVvZTeMcKETBjw3yz+ht9toFHqk=";
  };

  env.DUNE_CACHE = "disabled";

  doCheck = true;

  checkInputs = [
    alcotest
  ];
})
