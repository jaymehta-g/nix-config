{
  pkgs,
  unstable,
  lib,
  config,
  ...
}:
{
  options = {
    mods.normcap.enable = lib.mkEnableOption "enables";
  };

  config = lib.mkIf config.mods.normcap.enable {
    environment.systemPackages = [
      pkgs.normcap
      pkgs.xsel
    ];
  };
}
