{ pkgs, lib, ... }:
{
  imports = [
    ./hibernate.nix
    ./mumble.nix
    ./audio-crackle.nix
  ];
}
