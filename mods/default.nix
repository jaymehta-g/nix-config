{pkgs, lib, ...}:
{
    imports = [
        ./rebuild-script.nix
        ./gaming.nix
        ./sublime.nix
        ./development.nix
        ./nushell.nix
        ./normcap.nix
        ./kde-plasma.nix
        ./balena-etcher.nix
        ./i3wm.nix
        ./custom-fonts.nix
        ./grub-theme.nix
        ./waydroid.nix
        ./gnome-desktop.nix
        ./instant-messaging.nix
    ];
}
