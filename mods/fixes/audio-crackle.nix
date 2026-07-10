{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    mods.audio-crackle-fix.enable = lib.mkEnableOption "enables";
  };

  config = lib.mkIf config.mods.audio-crackle-fix.enable {

    services.pipewire.extraConfig = {
      pipewire."92-low-latency" = {
        "context.properties" = {
          "default.clock.rate" = 48000;
          "default.clock.quantum" = 2048;
          "default.clock.min-quantum" = 2048;
          "default.clock.max-quantum" = 2048;
        };
      };
      # for games apparently? from https://github.com/joinemm/empire/blob/master/modules/desktop/sound.nix#L23
      pipewire-pulse."92-quantum" =
        let
          qr = "256/48000";
        in
        {
          "context.properties" = [
            {
              name = "libpipewire-module-protocol-pulse";
              args = { };
            }
          ];
          "pulse.properties" = {
            "pulse.default.req" = qr;
            "pulse.min.req" = qr;
            "pulse.max.req" = qr;
            "pulse.min.quantum" = qr;
            "pulse.max.quantum" = qr;
          };
          "stream.properties" = {
            "node.latency" = qr;
          };
        };
    };
  };
}
