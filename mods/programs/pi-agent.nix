{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:
let
  opt_name = "pi-agent";
in
{
  imports = [ inputs.pi.nixosModules.default ];

  options = {
    mods."${opt_name}".enable = lib.mkEnableOption "enables";
  };

  config = lib.mkIf config.mods."${opt_name}".enable {
    programs.pi.coding-agent.enable = true;
    environment.systemPackages = [
      pkgs.bubblewrap
      pkgs.socat
      pkgs.ripgrep
    ];
  };
}
