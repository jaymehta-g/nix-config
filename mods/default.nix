{ pkgs, lib, ... }:
{
  imports = [
    ./development
    ./programs
    ./de
    ./services
    ./fixes
    ./custom-fonts.nix
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
