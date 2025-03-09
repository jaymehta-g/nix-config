{pkgs, lib, config, ...}:
{
  options = {
      utility-scripts.enable =
          lib.mkEnableOption "enables";
  };

  imports = [
    ./winreboot.nix
    ./rebuild.nix
  ];
}