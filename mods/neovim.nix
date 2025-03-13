{pkgs, lib, config, ...}:
{
    options = {
        neovim.enable =
            lib.mkEnableOption "enables";
    };

    config = lib.mkIf config.neovim.enable {
        environment.systemPackages = with pkgs; [
            neovim
            gcc
            fzf
            ripgrep
            fd
        ];
    };
}
