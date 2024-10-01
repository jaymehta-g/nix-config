{pkgs, lib, config, ...}:
{
    options = {
        nushell.enable =
            lib.mkEnableOption "enables";
    };

    config = lib.mkIf config.nushell.enable {
        environment.systemPackages = [
            pkgs.nushell
            pkgs.starship
        ];
        users.users.jay.shell = pkgs.nushell;
    };
}
