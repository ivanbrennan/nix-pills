{ mkDerivation, withOniguruma ? false, oniguruma }:

mkDerivation {
  name = "jq";
  src = ./jq-1.5.tar.gz;
  buildInputs = if withOniguruma then [ oniguruma ] else [];
  extraConfigureFlags = if withOniguruma then [ "--with-oniguruma=${oniguruma}" ] else [];
}
