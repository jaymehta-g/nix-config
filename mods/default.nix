{pkgs, lib, ...}:
{
    imports = [
        ./utility-scripts
        ./development
        ./programs
        ./kde-plasma.nix
        ./balena-etcher.nix
        ./custom-fonts.nix
        ./grub-theme.nix
        ./gnome-desktop.nix
        ./mullvad.nix
        ./ipfs.nix
        ./virtualbox.nix
    ];
}
