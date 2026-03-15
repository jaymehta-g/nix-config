{pkgs, lib, config, ...}:
{
    options = {
        hibernate.enable =
            lib.mkEnableOption "enables";
    };

    config = lib.mkIf config.hibernate.enable {
        swapDevices = [{
            device = "/swap";
            size = 30*1024;  # MB
            options = ["discard"];
        }];  
        boot.initrd.systemd.enable = true;
    };
}
