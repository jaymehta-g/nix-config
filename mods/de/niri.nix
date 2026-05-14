{
  pkgs,
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
      wl-clipboard
    ];
    # niri de
    gnome-desktop.enable = false;
    programs.niri.enable = true;
    # services = {
    #   xserver.enable = true;
    #   displayManager.gdm.enable = true;
    # };

  };
}
