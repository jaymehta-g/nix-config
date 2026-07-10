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
    environment.systemPackages = with pkgs; [
      (inputs.nixvim.legacyPackages."${pkgs.stdenv.hostPlatform.system}".makeNixvim nvim-conf)
    ];
  };
}
