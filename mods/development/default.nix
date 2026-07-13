{
  pkgs,
  unstable,
  lib,
  config,
  ...
}:
{
  imports = [
    ./neovim.nix
    ./python.nix
    ./pi-agent.nix
  ];

  options = {
    mods.development.enable = lib.mkEnableOption "enables";
  };

  config = lib.mkIf config.mods.development.enable {
    environment.systemPackages = with pkgs; [
      unstable.vscode
      rustup
      unstable.go
      burpsuite
      gcc
      unstable.godot_4
      starship
      tailscale
      unstable.dumbpipe
      unstable.xonsh
      gnumake
      docker
      podman
      tmux
      dig
      nodejs

    ];

    #services.tailscale.enable = true;
  };
}
