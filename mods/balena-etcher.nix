{pkgs, lib, config, ...}:
{
    options = {
        balena-etcher.enable =
            lib.mkEnableOption "enables";
    };

    config = lib.mkIf config.balena-etcher.enable {
        nixpkgs.config.permittedInsecurePackages = [
            "electron-19.1.9"
        ];
        environment.systemPackages = with pkgs; [
            etcher
        ];
    };
}
