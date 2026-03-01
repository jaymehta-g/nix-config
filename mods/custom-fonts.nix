{pkgs, lib, config, ...}:
{
    options = {
        custom-fonts.enable =
            lib.mkEnableOption "enables";
    };

    config = lib.mkIf config.custom-fonts.enable {
        fonts.packages = with pkgs; [ 
            fira-code 
            nerd-fonts.fira-code
            inter-nerdfont
            karla
            atkinson-hyperlegible
            atkinson-monolegible
            nerd-fonts.jetbrains-mono
        ];
        
    };
}
