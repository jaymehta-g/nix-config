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
    "${opt_name}".enable = lib.mkEnableOption "enables";
  };

  config = lib.mkIf config."${opt_name}".enable {
    services.sunshine = {
      enable = true;
      autoStart = true;
      capSysAdmin = true; # only needed for Wayland -- omit this when using with Xorg
      openFirewall = true;
    };
  };
}
