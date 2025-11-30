{pkgs, lib, ...}:
{
  imports = [
    ./gnome-desktop.nix
    ./hyprland.nix
    ./kde-plasma.nix
  ];
  gnome-desktop.enable = lib.mkDefault true;
}