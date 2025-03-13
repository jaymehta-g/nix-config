{pkgs, lib, config, ...}:
{
    options = {
        neovim.enable =
            lib.mkEnableOption "enables";
    };

    config = lib.mkIf config.neovim.enable {
        environment.systemPackages = [
            pkgs.neovim
        ];
    };
}
