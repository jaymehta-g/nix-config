{
  pkgs,
  unstable,
  lib,
  config,
  inputs,
  ...
}:
{
  imports = [
    inputs.playit.nixosModules.default
  ];
  options = {
    mods.gaming.enable = lib.mkEnableOption "enables";
    mods.gaming.minecraft.enable = lib.mkEnableOption "enables";
  };

  config = lib.mkIf config.mods.gaming.enable {
    environment.systemPackages = with pkgs; [
      unstable.prismlauncher
      unstable.itch
    ];
    programs.nix-ld.enable = true;

    programs.nix-ld.libraries = [ ];

    programs.steam.enable = true;

    services.playit = {
      enable = true;
      secretPath = "/home/jay/.config/playit_gg/playit.toml";
    };

    users.groups.playit.members = [ "jay" ];

  };
}
