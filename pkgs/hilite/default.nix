{ buildDunePackage
, fetchzip
, cmarkit
, mdx
, textmate-language
}:

buildDunePackage (finalAttrs: {
  pname = "hilite";
  version = "0.5.0";

  src = fetchzip {
    url = "https://github.com/patricoferris/hilite/releases/download/v${finalAttrs.version}/hilite-${finalAttrs.version}.tbz";
    hash = "sha256-By9WlYCUr0whYOdFCIkICwCqclmsKGQ+X9WOsUA13yg=";
  };

  env.DUNE_CACHE = "disabled";

  propagatedBuildInputs = [
    cmarkit
    textmate-language
  ];

  doCheck = true;

  nativeCheckInputs = [
    mdx.bin
  ];

  checkInputs = [
    mdx
  ];
})
