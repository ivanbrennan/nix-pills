# update package expressions
nix-channel --update

# update user environment
nix-env -u --always

# Before:
#   /nix/var/nix/gcroots/auto/xxx -> ~/foo/result
#   ~/foo/result                  -> /nix/store/yyy-foo
rm /nix/var/nix/gcroots/auto/*
# After:
#   ~/foo/result -> /nix/store/yyy-foo
#
# Nix is no longer aware that anything references yyy-foo.
# It will be garbage-collected, leaving ~/foo/result a dangling link.

# It might be better to remove the targets of gcroots/auto/ symlinks

# delete all old generations in /nix/var/nix/profiles
nix-collect-garbage --delete-old
