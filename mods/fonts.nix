{pkgs, lib, config, ...}:
{
    options = {
        NAME.enable =
            lib.mkEnableOption "enables";
    };

    config = lib.mkIf config.NAME.enable {
        fonts.packages = with pkgs; [ fira-code ];
    };
}
