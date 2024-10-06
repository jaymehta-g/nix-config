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
            unstable.cargo
            unstable.go
            burpsuite
        ];
    };
}
