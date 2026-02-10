{pkgs, lib, config, ...}:
{
    options = {
        thunar-fm.enable =
            lib.mkEnableOption "enables";
    };

    config = lib.mkIf config.thunar-fm.enable {
        programs.thunar.enable = true;
        programs.xfconf.enable = true;
        programs.thunar.plugins = with pkgs.xfce; [
            thunar-media-tags-plugin
        ];
    };
}
