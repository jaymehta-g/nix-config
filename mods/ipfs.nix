{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    mods.ipfs.enable = lib.mkEnableOption "enables";
  };

  config = lib.mkIf config.mods.ipfs.enable {
    services.kubo.enable = true;
    users.users.jay.extraGroups = [ config.services.kubo.group ];
  };
}
