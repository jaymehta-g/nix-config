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
  ];
  mods.obsidian.enable = lib.mkDefault true;
  mods.thunar-fm.enable = lib.mkDefault true;
}
