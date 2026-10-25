{ pkgs, config, ... }:
{
  imports = [
    ./ssh.nix
    ./zerotier.nix
    ./avahi.nix
  ];
}
