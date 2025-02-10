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
            gnomeExtensions.blur-my-shell
            # gnomeExtensions.dock-from-dash
            # (gnomeExtensions.buildGnomeExtension {
            #     uuid="dash-to-dock@micxgx.gmail.com";
            #     pname="dash-to-dock";
            #     name="Dash to Dock";
            #     description=".";
            #     link="https://micheleg.github.io/dash-to-dock/";
            #     version=99;
            #     sha256="";
            #     metadata="ew0KInNoZWxsLXZlcnNpb24iOiBbDQogICAgIjQ1IiwNCiAgICAiNDYiLA0KICAgICI0NyIsDQogICAgIjQ4Ig0KXSwNCiJ1dWlkIjogImRhc2gtdG8tZG9ja0BtaWN4Z3guZ21haWwuY29tIiwNCiJuYW1lIjogIkRhc2ggdG8gRG9jayIsDQoiZGVzY3JpcHRpb24iOiAiQSBkb2NrIGZvciB0aGUgR25vbWUgU2hlbGwuIFRoaXMgZXh0ZW5zaW9uIG1vdmVzIHRoZSBkYXNoIG91dCBvZiB0aGUgb3ZlcnZpZXcgdHJhbnNmb3JtaW5nIGl0IGluIGEgZG9jayBmb3IgYW4gZWFzaWVyIGxhdW5jaGluZyBvZiBhcHBsaWNhdGlvbnMgYW5kIGEgZmFzdGVyIHN3aXRjaGluZyBiZXR3ZWVuIHdpbmRvd3MgYW5kIGRlc2t0b3BzLiBTaWRlIGFuZCBib3R0b20gcGxhY2VtZW50IG9wdGlvbnMgYXJlIGF2YWlsYWJsZS4iLA0KIm9yaWdpbmFsLWF1dGhvciI6ICJtaWN4Z3hAZ21haWwuY29tIiwNCiJ1cmwiOiAiaHR0cHM6Ly9taWNoZWxlZy5naXRodWIuaW8vZGFzaC10by1kb2NrLyIsDQoiZ2V0dGV4dC1kb21haW4iOiAiZGFzaHRvZG9jayIsDQoidmVyc2lvbiI6IDk5DQp9";
            # })
            gnome47Extensions."dash-to-dock@micxgx.gmail.com"
            gnomeExtensions.coverflow-alt-tab
        ];
        # https://discourse.nixos.org/t/howto-disable-most-gnome-default-applications-and-what-they-are/13505
        environment.gnome.excludePackages = with pkgs; [
            baobab      # disk usage analyzer
            cheese      # photo booth
            # eog         # image viewer
            epiphany    # web browser
            simple-scan # document scanner
            totem       # video player
            yelp        # help viewer
            evince      # document viewer
            file-roller # archive manager
            geary       # email client
            seahorse    # password manager
            nautilus    # files
            xterm       # console

            # these should be self explanatory
            gnome-maps
            gnome-music
            gnome-console
        ];
    };
}
