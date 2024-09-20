{pkgs, lib, config, ...}:
{
    options = {
        gaming.enable =
            lib.mkEnableOption "enables";
    };

    config = lib.mkIf config.gaming.enable {
        environment.systemPackages = with pkgs; [
            bottles
        ];

        programs.nix-ld.enable = true;

        programs.nix-ld.libraries = [];
    };
}

