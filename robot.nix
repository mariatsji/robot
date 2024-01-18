let
  nixpkgs = import ./nixpkgs.nix;

in with nixpkgs;
  (haskellPackages.callCabal2nix "robot"
    (nixpkgs.lib.sourceFilesBySuffices ./. [
      ".hs"
      ".cabal"
      "CHANGELOG.md"
      "LICENSE"
    ]) { })
