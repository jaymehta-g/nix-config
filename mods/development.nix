{pkgs, lib, config, ...}:
{
    options = {
        development.enable =
            lib.mkEnableOption "enables";
    };

    config = lib.mkIf config.development.enable {
        environment.systemPackages = with pkgs; [
            vscode
            python3
            cargo
            go
        ];
    };
}
