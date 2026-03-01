{pkgs, unstable, lib, config, ...}:
{
    options = {
        ssh.enable =
            lib.mkEnableOption "enables";
        ssh.dumbpipe.enable =
            lib.mkEnableOption "enables";
    };

    config = lib.mkIf config.ssh.enable {
        services.openssh = {
            enable = true;
            ports = [1234];
            settings = {
                PasswordAuthentication = false;
                KbdInteractiveAuthentication = false;
                PermitRootLogin = "no";
                AllowUsers = ["jay"];
            };
        };

        services.endlessh = {
            enable = true;
            port = 22;
            openFirewall = true;
        };
    } // lib.mkIf config.ssh.dumbpipe.enable {
        systemd.services.dumbpipe-ssh-tunnel = {
            wantedBy = [ "multi-user.target" ];
            after = [ "network.target" ];
            serviceConfig = 
            let
                tmux = "${pkgs.tmux}/bin/tmux";
                dp = "${unstable.dumbpipe}/bin/dumbpipe";
            in
            {
                Type = "forking";
                ExecStart = "${tmux} new -ds dumbpipe-ssh ${dp} listen-tcp --host localhost:1234";
                ExecStop = "${tmux} kill-session -t dumbpipe-ssh";
            };
        };
    };
}
