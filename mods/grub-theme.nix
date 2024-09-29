{pkgs, lib, config, ...}:
{
    options = {
        grub-theme.enable =
            lib.mkEnableOption "enables";
    };

    config = lib.mkIf config.grub-theme.enable {
        boot.loader.grub.theme = pkgs.stdenv.mkDerivation {
            name = "elegant-grub-theme";
            src = pkgs.fetchFromGitHub {
                owner = "vinceliuice";
                repo = "Elegant-grub2-themes";
                rev = "7caa304b349ee638481935d5e0d82b33033b0b1c";
                sha256 = "sha256-mBhG3fFYUIE2Sf2h4PVLhbC9PboZaAx1EpaQ7NX9NtE=";
            };

            buildPhase = ''
                $src/generate.sh -t mountain
            '';

            installPhase = ''
                mkdir -p $out
                mv $src/Elegant-mountain-window-left-dark/* $out
            '';
        };
    };
}
