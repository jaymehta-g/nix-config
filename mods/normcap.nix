{pkgs, unstable, lib, config, ...}:
{
    options = {
        normcap.enable =
            lib.mkEnableOption "enables";
    };

    config = lib.mkIf config.normcap.enable {
        environment.systemPackages = [ 
            unstable.normcap
            pkgs.xsel
        ];
    };
}
