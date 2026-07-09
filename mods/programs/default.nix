{ pkgs, lib, ... }:
{
  imports = [
    ./thunar.nix
    ./normcap.nix
    ./obsidian.nix
    ./instant-messaging.nix
    ./gaming.nix
    ./mullvad.nix
    ./flatpak.nix
    ./sunshine.nix
    ./pi-agent.nix
  ];
  obsidian.enable = lib.mkDefault true;
  thunar-fm.enable = lib.mkDefault true;
}
