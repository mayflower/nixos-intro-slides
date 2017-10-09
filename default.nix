let
  inherit (import <nixpkgs> {}) callPackage;
  slidesNodePkgs = import ./reveal/default.nix {};
in {
  dist = callPackage ({ stdenv, nodejs-6_x, unzip }:
    stdenv.mkDerivation {
      name = "nixos-intro-slides";
      src = slidesNodePkgs.package;

      nativeBuildInputs = [ nodejs-6_x unzip ];

      buildPhase = ''
        cd lib/node_modules/reveal.js
        ./node_modules/.bin/grunt package
      '';

      installPhase = ''
        install -d $out/share
        unzip reveal-js-presentation.zip -d $out/share
      '';
    }) {};
}
