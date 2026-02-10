{pkgs, lib, config, ...}:
{
    options = {
        thunar-fm.enable =
            lib.mkEnableOption "enables";
    };

    config = lib.mkIf config.thunar-fm.enable {
        environment.systemPackages = [
            pkgs.xfce.thunar
            pkgs.xfce.xfconf
            pkgs.xfce.thunar-media-tags-plugin
        ];
        services.dbus.packages = with pkgs; [
            xfce.xfconf
        ];
    };
}
