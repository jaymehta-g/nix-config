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
    environment.systemPackages =
      with pkgs;
      [
        bottles
        everest-mons
      ]
      ++ (
        if !config.mods.gaming.minecraft.enable then
          [ ]
        else
          [
            unstable.prismlauncher
          ]
      );

    programs.nix-ld.enable = true;

    programs.nix-ld.libraries = [ ];

    programs.steam.enable = true;
  };
}
