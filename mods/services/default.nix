{ pkgs, config, ... }:
{
  imports = [
    ./ssh.nix
    ./zerotier.nix
  ];
}
