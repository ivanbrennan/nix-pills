{
  packageOverrides = pkgs: {
    graphviz = pkgs.graphviz.override { xlibs = null; };
    jq = pkgs.jq.override { oniguruma = null; };
  };
}
