A nixos system and home manager configuration repo.

Under .dotfiles/ are dotfiles that are symlinked into ~ with stow.

At .dotfiles/.config/home-manager is nix home manager configuration.

Under hosts/ are per-system configuration files. flake.nix loads these based on the current hostname. Use `uname` to check which config to modify

Under mods/ are modules that get imported into all hosts' config, and can be enabled with custom options.

After making changes to nixos system config, use `nixos-rebuild dry-activate` to validate changes. (this will only validate the current system's config). Then autoformat with `nix shell nixpkgs#nixfmt-tree -c treefmt`