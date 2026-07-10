{ pkgs, lib, ... }:
{
  imports = [
    ./development
    ./programs
    ./de
    ./services
    ./fixes
    ./custom-fonts.nix
    ./grub-theme.nix
    ./ipfs.nix
    ./virtualbox.nix
  ];
  environment.systemPackages = with pkgs; [
    vim
    git
    wget
    ripgrep
    home-manager
    stow
    unixtools.ifconfig
    busybox
  ];
}
