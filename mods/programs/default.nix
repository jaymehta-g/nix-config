
{pkgs, lib, ...}:
{
    imports = [
        ./thunar.nix
        ./normcap.nix
        ./obsidian.nix
        ./instant-messaging.nix
        ./gaming.nix
    ];
}