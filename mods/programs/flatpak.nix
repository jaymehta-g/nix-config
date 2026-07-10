{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:
let
  opt_name = "flatpak";
in
{
  imports = [ inputs.flatpak.nixosModules.nix-flatpak ];
  options = {
    mods."${opt_name}".enable = lib.mkEnableOption "enables";
  };

  config = lib.mkIf config.mods."${opt_name}".enable {
    services.flatpak.enable = true;
    services.flatpak.packages = [
      "com.surfshark.Surfshark"
    ];
  };
}
