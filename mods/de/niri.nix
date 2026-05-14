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
    ];
    # niri de
    gnome-desktop.enable = false;
    programs.niri.enable = true;
  };
}
