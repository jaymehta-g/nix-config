{
  pkgs,
  inputs,
  config,
  ...
}:
{
  imports = [
    inputs.timewall.homeManagerModules.default
  ];

  home.packages = [
    pkgs.awww
  ];

  services.timewall = {
    enable = true;
    wallpaperPath = "/home/jay/Pictures/Wallpapers/wallpaper.heic";
    config = {
      location = {
        lat = 31.3;
        lon = -99.9;
      };
      setter.command = [
        "${pkgs.awww}/bin/awww"
        "img"
        "%f"
      ];
    };
  };
}
