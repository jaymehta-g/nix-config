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
    ];
}
