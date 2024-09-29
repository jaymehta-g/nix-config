{pkgs, lib, config, ...}:
{
    options = {
        waydroid.enable =
            lib.mkEnableOption "enables";
    };

    config = lib.mkIf config.waydroid.enable {
      virtualisation.waydroid.enable = true;
    };
}
