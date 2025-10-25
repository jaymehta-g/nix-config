{
  outputs = { self, ngrok, nixpkgs ? import <nixpkgs>, ... }: {
    nixosConfigurations."desktop" = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ngrok.nixosModules.ngrok
        ({ pkgs, ... }: {
          nixpkgs.config.allowUnfree = true;
          services.ngrok = {
            enable = true;
            extraConfig = { };
            extraConfigFiles = [
              # reference to files containing `authtoken` and `api_key` secrets
              # ngrok will merge these, together with `extraConfig`
            ];
            endpoints = [
              {
                name = "ssh";
                url = "tcp://dovetailed-intranational-cammy.ngrok-free.dev:1234";
                upstream.url = "1234";
              }
            ];
          };
        })
      ];
    };
  };
}