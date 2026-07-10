{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    mods.custom-fonts.enable = lib.mkEnableOption "enables";
  };

  config = lib.mkIf config.mods.custom-fonts.enable {
    fonts.packages = with pkgs; [
      fira-code
      nerd-fonts.fira-code
      inter-nerdfont
      karla
      atkinson-hyperlegible
      atkinson-monolegible
      nerd-fonts.jetbrains-mono
    ];

  };
}
