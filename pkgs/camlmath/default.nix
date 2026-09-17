{ buildDunePackage
, fetchFromGitHub
, alcotest
}:

buildDunePackage (finalAttrs: {
  pname = "camlmath";
  version = "2026.917.0";

  src = fetchFromGitHub {
    owner = "stepbrobd";
    repo = "camlmath";
    tag = finalAttrs.version;
    hash = "sha256-0T0zA+3ZGDxJpYiX08r8cHmslTY3dRuvhlrjcnd9Nqc=";
  };

  env.DUNE_CACHE = "disabled";

  doCheck = true;

  checkInputs = [
    alcotest
  ];
})
