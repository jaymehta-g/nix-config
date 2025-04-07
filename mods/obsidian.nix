{pkgs, lib, config, ...}:
{
    options = {
        obsidian.enable =
            lib.mkEnableOption "enables";
    };

    config = lib.mkIf config.obsidian.enable {
        environment.systemPackages = with pkgs; [
            obsidian
            syncthing
        ];
    };
}
