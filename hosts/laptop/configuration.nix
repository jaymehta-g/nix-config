# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, config, pkgs, unstable, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];
  # Enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # empty /tmp
  boot.tmp.cleanOnBoot = true;

  networking.hostName = "laptop"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Enable networking
  networking.networkmanager.enable = true;

  # Disable firewall
  networking.firewall.enable = false;

  # Set your time zone.
  time.timeZone = "America/Chicago";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  }; 

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable bluetooth
  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot

  # possible bluetooth driver fix
  hardware.enableAllFirmware = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # # popping and crackling fix
  # services.pipewire.extraConfig = {
  #   pipewire."92-low-latency" = {
  #     "context.properties" = {
  #       "default.clock.rate" = 48000;
  #       "default.clock.quantum" = 2048;
  #       "default.clock.min-quantum" = 2048;
  #       "default.clock.max-quantum" = 2048;
  #     };
  #   };
  #   # for games apparently? from https://github.com/joinemm/empire/blob/master/modules/desktop/sound.nix#L23
  #   pipewire-pulse."92-quantum" = 
  #     let
  #       qr = "256/48000";
  #     in
  #     {
  #       "context.properties" = [
  #         {
  #           name = "libpipewire-module-protocol-pulse";
  #           args = { };
  #         }
  #       ];
  #       "pulse.properties" = {
  #         "pulse.default.req" = qr;
  #         "pulse.min.req" = qr;
  #         "pulse.max.req" = qr;
  #         "pulse.min.quantum" = qr;
  #         "pulse.max.quantum" = qr;
  #       };
  #       "stream.properties" = {
  #         "node.latency" = qr;
  #       };
  #     };
  # };

  # windows time desync fix
  # time.hardwareClockInLocalTime = true;
  

  users.groups.nix-manager = {};
  users.users.jay = {
    isNormalUser = true;
    description = "jay";
    extraGroups = [ "networkmanager" "wheel" "nix-manager" ];
  };

  # Pick DE
  # kde-plasma.enable = true;
  gnome-desktop.enable = true;

  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Allow running executables
  programs.nix-ld = {
    enable = true;
    libraries = (pkgs.steam-run.args.multiPkgs pkgs) ++ [pkgs.libGL pkgs.SDL2];
  };

  # Install packages globally
  environment.systemPackages = with pkgs; [
    gitg
    gh
    gnumake
    nh
    # TODO move these to their own modules eventually:
    p7zip
    ffmpeg_7
    obs-studio
    protonvpn-gui
    vlc
    spotify
    gimp
    libreoffice-still
    xed-editor
    zenity
    zoom-us
    xdg-desktop-portal
#    (retroarch.override {
#      cores = with libretro; [
        #snes9x
      #];
    #})
    xclip
    steam-run
    anki
  ]; 

  # tablet
  hardware.opentabletdriver.enable = true;

  # gaming.enable = true;
  # gaming.minecraft.enable = true;

  development.enable = true;
  neovim.enable = true;

  instant-messaging.enable = true;

  normcap.enable = true;

  custom-fonts.enable = true;

  obsidian.enable = true;

  # virtualbox.enable = true;

  # Rice
  # grub-theme.enable = true;

  # gc
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 15d";
  };
  boot.loader.systemd-boot.configurationLimit = 3;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}
