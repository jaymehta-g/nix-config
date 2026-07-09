# stuff that all hosts need
{ pkgs, lib, ... }:
{
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
