{pkgs, unstable, lib, config, ...}:
{
    options = {
        gaming.enable =
            lib.mkEnableOption "enables";
        gaming.minecraft.enable =
            lib.mkEnableOption "enables";
    };

    config = lib.mkIf config.gaming.enable {
        environment.systemPackages = with pkgs; [
            bottles
            everest-mons
        ] ++ (if !config.gaming.minecraft.enable then [] else [
            unstable.prismlauncher
        ]);

        programs.nix-ld.enable = true;

        programs.nix-ld.libraries = [];

        programs.steam.enable = true;
    };
}

