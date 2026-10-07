{
  pkgs,
  unstable,
  lib,
  config,
  ...
}:
{
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
  };
}
