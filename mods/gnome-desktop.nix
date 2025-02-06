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
        environment.systemPackages = with pkgs; [
            bibata-cursors
            gnomeExtensions.panel-workspace-scroll
            blackbox-terminal
            nemo-with-extensions
            gnomeExtensions.compiz-windows-effect
            gnomeExtensions.compiz-alike-magic-lamp-effect
        ];
        # https://discourse.nixos.org/t/howto-disable-most-gnome-default-applications-and-what-they-are/13505
        environment.gnome.excludePackages = with pkgs; [
            baobab      # disk usage analyzer
            cheese      # photo booth
            eog         # image viewer
            epiphany    # web browser
            simple-scan # document scanner
            totem       # video player
            yelp        # help viewer
            evince      # document viewer
            file-roller # archive manager
            geary       # email client
            seahorse    # password manager

            # these should be self explanatory
            gnome-maps
            gnome-music
        ];
    };
}
