{ mkDerivation, gdSupport ? true, gd, fontconfig, libjpeg, bzip2 }:

mkDerivation {
  name = "graphviz";
  src = ./graphviz.tar.gz;
  buildInputs = if gdSupport then [ gd fontconfig libjpeg bzip2 ] else [];
}
