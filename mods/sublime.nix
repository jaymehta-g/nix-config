{pkgs, lib, config, ...}:
{
    options = {
        sublime-text.enable =
            lib.mkEnableOption "enables";
    };

    config = lib.mkIf config.sublime-text.enable {
        environment.systemPackages = with pkgs; [
            sublime4
        ];
        nixpkgs.config.permittedInsecurePackages = [
            "openssl-1.1.1w"
        ];
    };
}
