{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    gnome-rdp.enable = lib.mkEnableOption "enables";
  };

  config = lib.mkIf config.gnome-rdp.enable {
    # # Remote desktop
    # services.xrdp.enable = true;
    # services.xrdp.defaultWindowManager = "${pkgs.gnome-session}/bin/gnome-session";
    # services.xrdp.openFirewall = true;

    # # Disable the GNOME3/GDM auto-suspend feature that cannot be disabled in GUI!
    # # If no user is logged in, the machine will power down after 20 minutes.
    # systemd.targets.sleep.enable = false;
    # systemd.targets.suspend.enable = false;
    # systemd.targets.hibernate.enable = false;
    # systemd.targets.hybrid-sleep.enable = false;
    # Enable the GNOME RDP components
    services.gnome.gnome-remote-desktop.enable = true;

    # Ensure the service starts automatically at boot so the settings panel appears
    systemd.services.gnome-remote-desktop = {
      wantedBy = [ "graphical.target" ];
    };

    # Open the default RDP port (3389)
    networking.firewall.allowedTCPPorts = [ 3389 ];

    # Disable autologin to avoid session conflicts
    services.displayManager.autoLogin.enable = false;
    services.getty.autologinUser = null;
  };
}
