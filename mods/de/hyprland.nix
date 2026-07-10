{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    mods.hyprland.enable = lib.mkEnableOption "enables";
  };

  config = lib.mkIf config.mods.hyprland.enable {
    programs.hyprland.enable = true;
    environment.systemPackages = [ pkgs.kitty ];
    environment.sessionVariables.NIXOS_OZONE_WL = "1";
  };
}
