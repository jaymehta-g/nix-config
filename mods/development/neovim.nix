{pkgs, lib, config, ...}:
{
    options = {
        neovim.enable =
            lib.mkEnableOption "enables";
    };

    config = lib.mkIf config.neovim.enable {
        environment.systemPackages = with pkgs; [
            # these programs only available to nvim
            # because they are only added to path before running neovim binary
            (writeShellScriptBin "nvim" 
            ''
                PATH=${lib.makeBinPath [
                    gcc
                    fzf
                    ripgrep
                    fd
                    luajitPackages.luarocks
                    lazygit
                ]}:$PATH ${neovim}/bin/nvim $@
            '')
        ];
    };
}
