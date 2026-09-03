{ buildDunePackage
, fetchFromGitHub
, alcotest
}:

buildDunePackage (finalAttrs: {
  pname = "camlmath";
  version = "2026.903.1";

  src = fetchFromGitHub {
    owner = "stepbrobd";
    repo = "camlmath";
    tag = finalAttrs.version;
    hash = "sha256-+E4xXsN70o5j7JQLvM6onyuAzE9JQ1v/aDGXVNSvAf4=";
  };

  env.DUNE_CACHE = "disabled";

  doCheck = true;

  checkInputs = [
    alcotest
  ];
})
