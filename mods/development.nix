{pkgs, unstable, lib, config, ...}:
{

    options = {
        development.enable =
            lib.mkEnableOption "enables";
    };

    config = lib.mkIf config.development.enable {
        environment.systemPackages = with pkgs; [
            vscode
            unstable.python3
            python312Packages.numpy
            cargo
            rustc
            rustup
            unstable.go
            burpsuite
            unstable.python312Packages.pip
            gcc
            godot_4
            sl
            starship
        ];

        #services.tailscale.enable = true;
    };
}
