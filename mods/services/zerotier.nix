{
  pkgs,
  lib,
  config,
  ...
}:
let
  opt_name = "zerotier";
in
{
  options = {
    mods."${opt_name}".enable = lib.mkEnableOption "enables";
  };

  config = lib.mkIf config.mods."${opt_name}".enable {
    services.zerotierone = {
      enable = true;
      joinNetworks = [
        "166359304ecd0da6"
      ];
    };
  };
}
