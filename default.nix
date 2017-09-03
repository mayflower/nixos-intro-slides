let
  inherit (import <nixpkgs> {}) callPackage;
in callPackage ({ stdenv, nodejs }:
stdenv.mkDerivation {
  name = "nixos-intro-slides";

  buildInputs = [ nodejs ];

  shellHook = ''
    cd reveal
    npm install
    npm start
  '';
}) {}
