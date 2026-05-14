{ pkgs, lib, ... }:
{
  imports = [
    ./gnome-desktop.nix
    ./hyprland.nix
    ./kde-plasma.nix
    ./niri.nix
  ];
  gnome-desktop.enable = lib.mkDefault true;
}
