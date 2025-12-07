{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "https://flakehub.com/f/NixOS/nixpkgs/0";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    # ngrok = {
    #   url = "github:ngrok/ngrok-nix";
    # };
  };

  outputs = inputs@{nixpkgs, nixpkgs-unstable, ...}:
  let
    system = "x86_64-linux";

    unstable = import nixpkgs-unstable {
      inherit system;
      config.allowUnfree = true;
    };

    custom-modules = ./mods/default.nix;

  in {
    nixosConfigurations = {
      desktop = inputs.nixpkgs.lib.nixosSystem rec {
        inherit system;
        specialArgs = { inherit unstable inputs;};
        modules = [
          ./hosts/desktop/configuration.nix
          custom-modules
        ];
      };

      asus-laptop = nixpkgs.lib.nixosSystem rec {
        inherit system;
        specialArgs = { inherit unstable inputs; };
        modules = [
          ./hosts/asus-laptop/configuration.nix
          custom-modules
        ];
      };
    };
  };
}
