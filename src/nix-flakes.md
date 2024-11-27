## Notes on Nix Flakes

### What's a flake?

In practice, a Nix flake is a directory with a flake.nix and flake.lock.

Flakes take inputs and output things that Nix can use,
like package definitions, development environments, or NixOS configurations.
