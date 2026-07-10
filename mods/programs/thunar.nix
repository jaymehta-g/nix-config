{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    mods.thunar-fm.enable = lib.mkEnableOption "enables";
  };

  config = lib.mkIf config.mods.thunar-fm.enable {
    programs.thunar.enable = true;
    programs.xfconf.enable = true;
    programs.thunar.plugins = with pkgs.xfce; [
      thunar-media-tags-plugin
      tumbler
    ];
  };
}
