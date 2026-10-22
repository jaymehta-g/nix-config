{ pkgs, lib, ... }:
{
  imports = [
    ./thunar.nix
    ./normcap.nix
    ./obsidian.nix
    ./social.nix
    ./gaming.nix
    ./mullvad.nix
    ./flatpak.nix
    ./virtualbox.nix
    ./wireshark.nix
  ];
  mods.obsidian.enable = lib.mkDefault true;
  mods.thunar-fm.enable = lib.mkDefault true;
}
