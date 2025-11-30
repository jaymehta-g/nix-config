{pkgs, lib, config, ...}:
{
    options = {
        mullvad.enable =
            lib.mkEnableOption "enables";
    };

    config = lib.mkIf config.mullvad.enable {
      services.mullvad-vpn.enable = true;
      services.mullvad-vpn.package = pkgs.mullvad-vpn;
      services.resolved.enable = true;
    };
}
