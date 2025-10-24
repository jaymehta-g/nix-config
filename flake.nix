{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "https://flakehub.com/f/NixOS/nixpkgs/0";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable }:
  let
    system = "x86_64-linux";

    unstable = import nixpkgs-unstable {
      inherit system;
      config.allowUnfree = true;
    };

    custom-modules = ./mods/default.nix;
  in {
    nixosConfigurations = {
      desktop = nixpkgs.lib.nixosSystem rec {
        specialArgs = { inherit system unstable; };

        modules = [
          { nixpkgs = { inherit system; config.allowUnfree = true;}; }
          ./hosts/desktop/configuration.nix
          custom-modules
        ];
      };
    };
  };
}
