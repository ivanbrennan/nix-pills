unset PATH
for p in $baseInputs $buildInputs; do
  if [ -d $p/bin ]; then
    export PATH=$p/bin${PATH:+:}$PATH
  fi
  if [ -d $p/include ]; then
    export NIX_CFLAGS_COMPILE="-I $p/include${NIX_CFLAGS_COMPILE:+ }$NIX_CFLAGS_COMPILE"
  fi
  if [ -d $p/lib ]; then
    export NIX_LDFLAGS="-rpath $p/lib -L $p/lib${NIX_LDFLAGS:+ }$NIX_LDFLAGS"
  fi
done

unpackPhase() {
  tar -xf $src

  for d in *; do
    if [ -d $d ]; then
      cd "$d"
      break
    fi
  done
}

configurePhase() {
  flags="--prefix=$out"

  for e in $extraConfigureFlags; do
    flags="$flags $e"
  done

  ./configure $flags
}

buildPhase() {
  make
}

installPhase() {
  make install
}

fixupPhase() {
  find $out -type f -exec patchelf --shrink-rpath '{}' \; -exec strip '{}' \; 2>/dev/null
}

genericBuild() {
  unpackPhase
  configurePhase
  buildPhase
  installPhase
  fixupPhase
}
