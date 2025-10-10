{pkgs, lib, ...}:
{
    imports = [
        ./utility-scripts
        ./gaming.nix
        ./sublime.nix
        ./development
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
        ./mullvad.nix
        ./neovim.nix
        ./obsidian.nix
        ./ipfs.nix
        ./virtualbox.nix
    ];
}
