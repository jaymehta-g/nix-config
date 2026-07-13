A nixos system and home manager configuration repo.

Under .dotfiles/ are dotfiles that are symlinked into ~ with stow.

At .dotfiles/.config/home-manager is nix home manager configuration.

Under hosts/ are per-system configuration files. flake.nix loads these based on the current hostname. Use `uname` to check which config to modify

Under mods/ are modules that get imported into all hosts' config, and can be enabled with custom options.

Do not make changes the user didn't ask for without explicitly asking first

After making changes to nixos system config, autoformat with `nix shell nixpkgs#nixfmt-tree -c treefmt`