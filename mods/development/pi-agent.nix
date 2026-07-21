{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:
let
  opt_name = "pi-agent";
in
{
  imports = [ inputs.pi.nixosModules.default ];

  options = {
    mods."${opt_name}".enable = lib.mkEnableOption "enables";
  };

  config = lib.mkIf config.mods."${opt_name}".enable {
    nixpkgs.overlays = [ inputs.pi.overlays.default ];
    environment.systemPackages = [
      (pkgs.writeShellScriptBin "pi" ''
          #!${pkgs.bash}/bin/bash
          ${pkgs.bubblewrap}/bin/bwrap \
            --ro-bind / / \
            --bind "$PWD" "$PWD" \
            --dev /dev \
            --proc /proc \
            --bind /tmp /tmp \
            --bind /nix /nix \
            --bind ~/.cache ~/.cache \
            --bind ~/.local ~/.local \
        	  --bind ~/.pi/agent ~/.pi/agent \
            --tmpfs ~/.ssh \
        	  --tmpfs /run \
            --ro-bind /run/current-system /run/current-system \
            --bind $XDG_RUNTIME_DIR/$WAYLAND_DISPLAY "$XDG_RUNTIME_DIR/$WAYLAND_DISPLAY" \
            --bind $NIRI_SOCKET "$NIRI_SOCKET" \
            -- ${pkgs.pi-coding-agent}/bin/pi $@
      '')
      pkgs.bubblewrap
    ];
  };
}
