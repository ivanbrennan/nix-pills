set: f: overrides:
let
  args = builtins.functionArgs f;
  attrs = builtins.intersectAttrs args;
in
  f ((attrs set) // (attrs overrides))
