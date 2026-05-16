{ pkgs, inputs, ... }:
{
  imports = [
    inputs.timewall.homeManagerModules.default
  ];

  home.packages = [
    pkgs.swww
  ];

  services.timewall = {
    enable = true;
    wallpaperPath = "/home/jay/Pictures/Wallpapers/wallpaper.heic";
  };
}
