let
  pkgs = import <nixpkgs> {};
  mkDerivation = import ./autotools.nix pkgs;
in mkDerivation {
  name = "graphviz";
  src = ./graphviz.tar.gz;
  buildInputs = wiht pkgs; [ gd fontconfig libjpeg bzip2 ];
}
