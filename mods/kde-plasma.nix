{pkgs, lib, config, ...}:
{
    options = {
        kde-plasma.enable =
            lib.mkEnableOption "enables";
    };

    config = lib.mkIf config.kde-plasma.enable {
        # Enable the KDE Plasma Desktop Environment.
        services.displayManager.sddm.enable = true;
        services.desktopManager.plasma6.enable = true;

        # KDE text editor
        environment.systemPackages = with pkgs; [
            libsForQt5.qtstyleplugin-kvantum
            kdePackages.kate
            kdePackages.kdialog
            dracula-theme
        ];
    };
}
