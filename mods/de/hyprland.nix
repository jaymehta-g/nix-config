{pkgs, lib, config, ...}:
{
    options = {
        hyprland.enable =
            lib.mkEnableOption "enables";
    };

    config = lib.mkIf config.hyprland.enable {
        programs.hyprland.enable = true;
        environment.systemPackages = [ pkgs.kitty ];
        environment.sessionVariables.NIXOS_OZONE_WL = "1";
    };
}
