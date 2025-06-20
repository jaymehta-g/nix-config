{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable }@inputs:
  let
    system = "x86_64-linux";

    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
    unstable = import nixpkgs-unstable {
      inherit system;
      config.allowUnfree = true;
    };

    custom-modules = ./mods/default.nix;
  in {
    nixosConfigurations = {
      desktop = nixpkgs.lib.nixosSystem rec {
        specialArgs = { inherit system pkgs unstable; };

        modules = [
          ./hosts/desktop/configuration.nix
          custom-modules
        ];
      };
    };
  };
}
