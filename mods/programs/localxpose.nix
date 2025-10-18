{pkgs, ...}:
{
  environment.systemPackages = [
    pkgs.stdenv.mkDerivation {
      name="localx";
      src = pkgs.fetchzip {
        url = "https://loclx-client.s3.amazonaws.com/loclx-linux-386.zip";
        hash = "sha256-aH/3l95OMcWTId7aLSyK2QGnzzK9sL+jtwkDBhvqzao=";
      };

      installPhase = ''
        mkdir -p $out/bin
        cp $src/loclx $out/bin/loclx
      '';
    } {}
  ];
}