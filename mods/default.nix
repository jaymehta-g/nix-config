{ pkgs, lib, ... }:
{
  imports = [
    ./development
    ./programs
    ./de
    ./services
    ./fixes
    ./all-hosts.nix
    ./custom-fonts.nix
    ./grub-theme.nix
    ./ipfs.nix
    ./virtualbox.nix
  ];
}
