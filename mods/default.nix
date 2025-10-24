{pkgs, lib, ...}:
{
    imports = [
        ./development
        ./programs
        ./de
        ./all-hosts.nix
        ./balena-etcher.nix
        ./custom-fonts.nix
        ./grub-theme.nix
        ./ipfs.nix
        ./virtualbox.nix
    ];
}
