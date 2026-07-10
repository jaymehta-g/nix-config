{
  pkgs,
  lib,
  unstable,
  config,
  ...
}:
{
  options = {
    mods.instant-messaging.enable = lib.mkEnableOption "enables";
  };

  config = lib.mkIf config.mods.instant-messaging.enable {
    environment.systemPackages = with pkgs; [
      signal-desktop
      (unstable.vesktop.override { withSystemVencord = false; })
    ];
  };
}
