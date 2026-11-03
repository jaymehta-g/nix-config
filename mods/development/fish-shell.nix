{
  pkgs,
  lib,
  config,
  ...
}:
let
  opt_name = "fish";
in
{
  options = {
    mods."${opt_name}".enable = lib.mkEnableOption "enables";
  };

  config = lib.mkIf config.mods."${opt_name}".enable {
    environment.systemPackages = [
    ];

    programs.fish.enable = true;

    users.users.jay.shell = pkgs.fish;
  };
}
