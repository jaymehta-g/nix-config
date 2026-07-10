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
    mods.neovim.enable = lib.mkEnableOption "enables";
  };

  config = lib.mkIf config.mods.neovim.enable {
    programs.neovim = {
      enable = true;
    };
  };
}
