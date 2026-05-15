{
  pkgs,
  lib,
  unstable,
  config,
  ...
}:
{
  options = {
    instant-messaging.enable = lib.mkEnableOption "enables";
  };

  config = lib.mkIf config.instant-messaging.enable {
    environment.systemPackages = with pkgs; [
      signal-desktop
      (vesktop.override { withSystemVencord = false; })
    ];
  };
}
