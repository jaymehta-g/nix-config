{
  pkgs,
  unstable,
  lib,
  config,
  ...
}:
let
  opt_name = "niri";
in
{
  options = {
    "${opt_name}".enable = lib.mkEnableOption "enables";
  };

  config = lib.mkIf config."${opt_name}".enable {
    environment.systemPackages = with pkgs; [
      unstable.noctalia-shell
      alacritty
      fuzzel
      xwayland-satellite
    ];
    # niri de
    programs.niri.enable = true;
    services.power-profiles-daemon.enable = true;
    services.upower.enable = true;

    programs.xwayland.enable = true;
  };
}
