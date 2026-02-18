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
            starship
            tailscale
            xonsh
            gnumake
            docker
            tmux
            dig
            nodejs
        ];

        #services.tailscale.enable = true;
    };
}
