
{pkgs, lib, config, ...}:
{
    options = {
        ipfs.enable =
            lib.mkEnableOption "enables";
    };

    config = lib.mkIf config.ipfs.enable {
        services.kubo.enable = true;
        users.users.jay.extraGroups = [ config.services.kubo.group ];
    };
}
