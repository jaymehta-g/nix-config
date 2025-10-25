{pkgs, lib, config, ...}:
{
    options = {
        ssh.enable =
            lib.mkEnableOption "enables";
    };

    config = lib.mkIf config.ssh.enable {
        services.openssh = {
            enable = true;
            ports = [1234];
            settings = {
                PermitRootLogin = "no";
                AllowUsers = ["jay"];
            };
        };

        services.endlessh = {
            enable = true;
            port = 22;
            openFirewall = true;
        };
    };
}
