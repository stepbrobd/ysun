{ buildDunePackage
, fetchFromGitHub
, bstr
, cachet
, checkseum
, decompress
, duff
, logs
, ohex
, optint
}:

buildDunePackage (finalAttrs: {
  pname = "carton";
  version = "1.2.0";

  src = fetchFromGitHub {
    owner = "robur-coop";
    repo = "carton";
    tag = finalAttrs.version;
    hash = "sha256-mBSkO8spcwfu+WUWNPbkPBMJ2DKQQ1Ec6DXjhjHWcV8=";
  };

  env.DUNE_CACHE = "disabled";

  propagatedBuildInputs = [
    bstr
    cachet
    checkseum
    decompress
    duff
    logs
    ohex
    optint
  ];

  doCheck = true;
})
