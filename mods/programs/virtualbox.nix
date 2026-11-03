{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    mods.virtualbox.enable = lib.mkEnableOption "enables VirtualBox virtualization";
  };

  config = lib.mkIf config.mods.virtualbox.enable {
    virtualisation.virtualbox = {
      host = {
        enable = true;
        enableExtensionPack = true;
        enableHardening = true;
      };
      guest = {
        enable = false;
      };
    };

    users.groups.vboxusers.members = [ "jay" ];
  };
}
