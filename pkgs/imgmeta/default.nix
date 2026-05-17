{ buildDunePackage
, fetchFromGitHub
, alcotest
}:

buildDunePackage (finalAttrs: {
  pname = "imgmeta";
  version = "2026.517.0";

  src = fetchFromGitHub {
    owner = "stepbrobd";
    repo = "imgmeta";
    tag = finalAttrs.version;
    hash = "sha256-M66FUp3YI9WIq9A0grhHfy9OCU3DuBlcxIwa3I0zLbg=";
  };

  env.DUNE_CACHE = "disabled";


  doCheck = true;

  checkInputs = [
    alcotest
  ];
})
