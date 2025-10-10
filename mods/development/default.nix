{pkgs, unstable, lib, config, ...}:
{
    imports = [
        ./neovim.nix
    ];

    options = {
        development.enable =
            lib.mkEnableOption "enables";
    };

    config = lib.mkIf config.development.enable {
        environment.systemPackages = with pkgs; [
            unstable.vscode
            python3
            python313Packages.numpy
            python313Packages.pyzmq
            cargo
            rustc
            rustup
            unstable.go
            burpsuite
            python313Packages.pip
            gcc
            unstable.godot_4
            sl
            starship
        ];

        #services.tailscale.enable = true;
    };
}
