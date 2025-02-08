{pkgs, lib, config, ...}:
{
    options = {
        normcap.enable =
            lib.mkEnableOption "enables";
    };

    config = lib.mkIf config.normcap.enable {
        environment.systemPackages = [ 
            pkgs.normcap
            pkgs.xsel
        ];
    };
}
