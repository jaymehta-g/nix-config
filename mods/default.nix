{pkgs, lib, ...}:
{
    imports = [
        ./gaming.nix
        ./sublime.nix
        ./development.nix
        ./nushell.nix
        ./normcap.nix
        ./kde-plasma.nix
        ./balena-etcher.nix
        ./i3wm.nix
        ./fonts.nix
    ];
}
