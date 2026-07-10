A nixos system and home manager configuration repo.

Under .dotfiles/ are dotfiles that are symlinked into ~ with stow.

At .dotfiles/.config/home-manager is nix home manager configuration.

Under hosts/ are per-system configuration files. flake.nix loads these based on the current hostname.

Under mods/ are modules that get imported into all hosts' config, and can be enabled with custom options.