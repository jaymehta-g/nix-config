
{pkgs, lib, ...}:
{
    imports = [
        ./thunar.nix
        ./normcap.nix
        ./obsidian.nix
        ./instant-messaging.nix
        ./gaming.nix
    ];
    obsidian.enable = lib.mkDefault true;
    thunar-fm.enable = lib.mkDefault true;
}
