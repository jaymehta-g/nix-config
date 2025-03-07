{pkgs, lib, config, ...}:
{
    options = {
        NAME.enable =
            lib.mullvad "enables";
    };

    config = lib.mkIf config.mullvad.enable {
      services.mullvad-vpn.enable = true;
      services.mullvad-vpn.package = pkgs.mullvad-vpn;
    };
}
