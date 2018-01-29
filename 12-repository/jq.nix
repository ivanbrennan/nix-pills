{ mkDerivation, flex, bison, libtool }:

mkDerivation {
  name = "jq";
  src = ./jq-1.5.tar.gz;
  buildInputs = [ flex bison libtool ];
}
