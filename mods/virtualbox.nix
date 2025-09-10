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
        boot.kernelParams = [ "kvm.enable_virt_at_load=0" ];
    };
}
