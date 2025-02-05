{pkgs, lib, config, ...}:
{
    options = {
        gnome-desktop.enable =
            lib.mkEnableOption "enables";
    };

    config = lib.mkIf config.gnome-desktop.enable {
        services.xserver = {
          enable = true;
          displayManager.gdm.enable = true;
          desktopManager.gnome.enable = true;
        };
        environment.systemPackages = [

        ];
    };
}
