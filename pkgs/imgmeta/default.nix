{ buildDunePackage
, fetchFromGitHub
, alcotest
}:

buildDunePackage (finalAttrs: {
  pname = "imgmeta";
  version = "2026.903.0";

  src = fetchFromGitHub {
    owner = "stepbrobd";
    repo = "imgmeta";
    tag = finalAttrs.version;
    hash = "sha256-+ZXbjBdA8Qoz4C98LLdKfFpkAaOUYPT3daNnCp7pN3A=";
  };

  env.DUNE_CACHE = "disabled";

  doCheck = true;

  checkInputs = [
    alcotest
  ];
})
