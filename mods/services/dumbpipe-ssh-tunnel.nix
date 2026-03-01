{pkgs, unstable, lib, config, ...}: {
  config = {
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