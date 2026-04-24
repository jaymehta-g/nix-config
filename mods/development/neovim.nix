{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:
let
  nvim-conf = {
    colorschemes.gruvbox.enable = true;
  };
in
{
  options = {
    neovim.enable = lib.mkEnableOption "enables";
  };

  config = lib.mkIf config.neovim.enable {
    environment.systemPackages = with pkgs; [
      (inputs.nixvim.legacyPackages."${pkgs.stdenv.hostPlatform.system}".makeNixvim nvim-conf)
    ];
  };
}
