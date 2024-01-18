let
  pkgs = import ./nixpkgs.nix;

in pkgs.haskellPackages.shellFor {
  packages = hpkgs:
    [
      # call our generated Nix expression manually
      (import ./backend.nix)
    ];

  # development tools we use
  buildInputs = with pkgs; [
    cabal-install
    ghc
    haskell-language-server
    ghcid
    haskellPackages.fourmolu
    nixfmt
    git
    openssh
    coreutils
    less
    nano
    nodejs
    which
    lsof
    vim
  ];

  withHoogle = false;

}
