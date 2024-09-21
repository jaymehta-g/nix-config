{pkgs, lib, config, ...}:
{
    options = {
        nushell.enable =
            lib.mkEnableOption "enables";
    };

    config = lib.mkIf config.nushell.enable {
        environment.systemPackages = [
            pkgs.nushell
        ];
        users.users.jay.shell = pkgs.nushell;
    };
}
