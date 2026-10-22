{
  pkgs,
  lib,
  unstable,
  config,
  ...
}:
{
  options = {
    mods.social.enable = lib.mkEnableOption "enables";
  };

  config = lib.mkIf config.mods.social.enable {
    environment.systemPackages = with pkgs; [
      signal-desktop
      (unstable.vesktop.override { withSystemVencord = false; })
    ];
  };
}
