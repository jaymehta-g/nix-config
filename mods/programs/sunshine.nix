{
  pkgs,
  lib,
  config,
  ...
}:
let
  opt_name = "sunshine";
in
{
  options = {
    mods."${opt_name}".enable = lib.mkEnableOption "enables";
  };

  config = lib.mkIf config.mods."${opt_name}".enable {
    services.sunshine = {
      enable = true;
      autoStart = true;
      capSysAdmin = true; # only needed for Wayland -- omit this when using with Xorg
      openFirewall = true;
    };
  };
}
