## Notes on Nix Flakes {.Notes}

### What's a flake?

In practice, a Nix flake is a directory with a flake.nix and flake.lock.

Flakes take inputs and output things that Nix can use,
like package definitions, development environments, or NixOS configurations.

### Flake reference

You can reference a flake using a string.

The reference is used when the flake is an input to other flakes,
or as command arguments to commands like `nix run`, `nix flake show`, `nix build` ecc...

Some reference examples are:

* `path:/home/nix-stuff/my-flake` for a flake on the local machine
* `github:Organization/a_repo` a git repository
* `github:Organization/a_repo/a_branch` a git branch
* `github:Organization/a_repo/d51c83a` a git commit

And more...

### Flake registries

Flake registries are kind of aliases to references.

The most common ones are:

* `nixpkgs` which refers to `github:NixOS/nixpkgs/nixpkgs-unstable`
* `flake-utils` which refers to `github:numtide/flake-utils`

### flake.nix structure

```
{
	description = package description
	inputs = dependencies
	outputs = what the flake produces
	nixConfig = advanced configuration options
}
```

### inputs

The inputs set specifies which inputs are needed to build the flake,
with this syntax:

```
inputs = {
	nixpkgs = {url = "github:NixOS/nixpkgs"};
	flake-utils = {url = "github:numtide/flake-utils"};
	<name_of_input> = <flake_reference>
};
```
