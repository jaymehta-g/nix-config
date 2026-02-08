{pkgs, unstable, lib, config, ...}:
{
    imports = [
        ./neovim.nix
        ./python.nix
    ];

    options = {
        development.enable =
            lib.mkEnableOption "enables";
    };

    config = lib.mkIf config.development.enable {
        environment.systemPackages = with pkgs; [
            unstable.vscode
            cargo
            rustc
            rustup
            unstable.go
            burpsuite
            gcc
            unstable.godot_4
            sl
            starship
            tailscale
            xonsh
            gnumake
        ];

        #services.tailscale.enable = true;
    };
}
