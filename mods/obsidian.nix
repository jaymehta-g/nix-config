{pkgs, lib, config, ...}:
{
    options = {
        obsidian.enable =
            lib.mkEnableOption "enables";
    };

    config = lib.mkIf config.obsidian.enable {
        environment.systemPackages = with pkgs; [
            obsidian
        ];

        services.syncthing = 
        let
            user = "jay";
        in
        {
            enable = true;
            openDefaultPorts = true;
            inherit user;
            dataDir = "/home/${user}/Syncthing";
            configDir = "/home/${user}/.config/syncthing";
        };
    };
}
