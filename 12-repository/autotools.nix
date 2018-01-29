nixpkgs: attrs:
  with nixpkgs;
  let defaultAttrs = {
    builder = "${bash}/bin/bash";
    args = [ ./builder.sh ];
    setup = ./setup.sh;
    baseInputs = [ gnutar gzip gnumake gcc binutils coreutils gawk gnused gnugrep findutils patchelf ];
    buildInputs = [];
    extraConfigureFlags = [];
    system = builtins.currentSystem;
  };
  in
  derivation (defaultAttrs // attrs)
