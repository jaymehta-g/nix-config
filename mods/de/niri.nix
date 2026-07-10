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
    mods."${opt_name}".enable = lib.mkEnableOption "enables";
  };

  config = lib.mkIf config.mods."${opt_name}".enable {
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

    # mod key overview
    services.keyd = {
      enable = true;
      keyboards.default = {
        ids = [ "*" ];
        settings.global = {
          overload_tap_timeout = 200; # Milliseconds to register a tap before timeout
        };
        settings.main = {
          leftmeta = "overload(meta, macro(leftmeta+o))"; # Make left meta tap open overview keybind
        };
      };
    };
  };
}
