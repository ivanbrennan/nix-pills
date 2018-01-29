with import ./lib.nix;

let
  nixpkgs = import <nixpkgs> {};
  allPkgs = nixpkgs // pkgs;
  callPackage = path: overrides:
    let f = import path;
        argsFrom = builtins.intersectAttrs (builtins.functionArgs f);
        args = ((argsFrom allPkgs) // (argsFrom overrides));
    in
      makeOverridable f args;
  pkgs = with nixpkgs; rec {
    mkDerivation = import ./autotools.nix nixpkgs;
    hello = callPackage ./hello.nix { };
    graphviz = callPackage ./graphviz.nix { };
    graphvizCore = callPackage ./graphviz.nix { gdSupport = false; };
    jq = callPackage ./jq.nix { };
    jqOni = jq.override { withOniguruma = true; };
  };
in pkgs
