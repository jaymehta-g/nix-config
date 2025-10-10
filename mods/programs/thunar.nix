{pkgs, lib, config, ...}:
{
    options = {
        thunar-fm.enable =
            lib.mkEnableOption "enables";
    };

    config = lib.mkIf config.thunar-fm.enable {
        environment.systemPackages = [
            pkgs.xfce.thunar
        ];
        services.dbus.packages = with pkgs; [
            xfce.xfconf
        ];
    };
}
