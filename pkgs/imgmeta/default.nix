{ buildDunePackage
, fetchFromGitHub
, alcotest
}:

buildDunePackage (finalAttrs: {
  pname = "imgmeta";
  version = "2026.517.1";

  src = fetchFromGitHub {
    owner = "stepbrobd";
    repo = "imgmeta";
    tag = finalAttrs.version;
    hash = "sha256-QHirsCTGgMX3rxFD0kIL7PANCcIlY8bi5wjulgO8cTI=";
  };

  env.DUNE_CACHE = "disabled";

  doCheck = true;

  checkInputs = [
    alcotest
  ];
})
