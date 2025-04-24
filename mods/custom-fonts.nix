{pkgs, lib, config, ...}:
{
    options = {
        custom-fonts.enable =
            lib.mkEnableOption "enables";
    };

    config = lib.mkIf config.custom-fonts.enable {
        fonts.packages = with pkgs; [ 
            fira-code 
            (nerdfonts.override { fonts = [ "FiraCode" ]; })
            inter-nerdfont
            karla
        ];
        
    };
}
