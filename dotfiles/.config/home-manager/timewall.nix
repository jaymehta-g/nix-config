{ pkgs, inputs, ... }:
{
  imports = [

    inputs.timewall.homeManagerModules.default
  ];

  services.timewall = {
    enable = true;
    wallpaperPath = "/home/jay/Pictures/Wallpapers/wallpaper.heic";
  };
}
