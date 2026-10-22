{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    mods.wireshark.enable = lib.mkEnableOption "enables";
  };

  config = lib.mkIf config.mods.wireshark.enable {
    programs.wireshark = {
      enable = true;
      package = pkgs.wireshark;
      dumpcap.enable = true;
      usbmon.enable = true;
    };
    users.users.jay.extraGroups = [ "wireshark" ];
  };
}
