## Initialization

### 1. Install Nix package manager

```shell
# Install Nix via the recommended [multi-user installation](https://nixos.org/manual/nix/stable/installation/multi-user):
$ sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install) --daemon
```

### 2. Clone the repository

```shell

```

### 3. Apply your home configuration by issuing:

```shell
$ home-manager switch --flake .#username@hostname
```

:warning: If you don't have home-manager installed, try first `nix shell nixpkgs#home-manager`.

