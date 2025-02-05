{pkgs, lib, config, ...}:
{
    options = {
        gnome-desktop.enable =
            lib.mkEnableOption "enables";
    };

    config = lib.mkIf config.gnome-desktop.enable {
        environment.systemPackages = [

        ];
    };
}
