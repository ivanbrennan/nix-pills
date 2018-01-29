fix = f: let fixpoint = f fixpoint; in fixpoint

h = s: with s; { x = "abc"; x2 = x + "123"; }

fix h == h (h (...))
      == { x = "abc"; x2 = (h (...)).x + "123"; }
      == { x = "abc"; x2 = "abc" + "123"; }
      == { x = "abc"; x2 = "abc123"; }
