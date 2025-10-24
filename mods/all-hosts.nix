# stuff that all hosts need
{pkgs, lib, ...}:
{
  environment.systemPackages = with pkgs; [
    vim
    git
    wget
    home-manager
    stow
  ];
}