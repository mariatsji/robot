let
  nixpkgs = import ./nixpkgs.nix;
  thinner = nixpkgs.haskell.lib.dontHaddock;
in with nixpkgs;
  thinner ((haskellPackages.callCabal2nix "robot"
    (nixpkgs.lib.sourceFilesBySuffices ./. [
      ".hs"
      ".cabal"
      "CHANGELOG.md"
      "LICENSE"
    ]) { }))
