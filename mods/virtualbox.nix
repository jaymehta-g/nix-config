{pkgs, lib, config, ...}:
{
    options = {
        virtualbox.enable =
            lib.mkEnableOption "enables";
    };

    config = lib.mkIf config.virtualbox.enable {
        environment.systemPackages = [

        ];
        virtualisation.virtualbox.host.enable = true;
        users.extraGroups.vboxusers.members = [ "jay" ];
    };
}
