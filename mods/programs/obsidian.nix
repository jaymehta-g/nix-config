{
  pkgs,
  unstable,
  lib,
  config,
  ...
}:
{
  options = {
    mods.obsidian.enable = lib.mkEnableOption "enables";
  };

  config = lib.mkIf config.mods.obsidian.enable {
    environment.systemPackages = with pkgs; [
      unstable.obsidian
    ];

    services.syncthing =
      let
        user = "jay";
      in
      {
        enable = true;
        openDefaultPorts = true;
        inherit user;
        dataDir = "/home/${user}/Syncthing";
        configDir = "/home/${user}/.config/syncthing";
      };
  };
}
