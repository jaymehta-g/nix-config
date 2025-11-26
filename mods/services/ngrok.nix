{pkgs, lib, config, inputs, ngrok, ...}:
{
    options = {
        ngrok.enable =
            lib.mkEnableOption "enables";
    };

    # imports = builtins.trace "inputs has ${builtins.toString (builtins.attrNames inputs.ngrok.nixosModules)}" [
    #   inputs.ngrok.nixosModules.ngrok
    #   ({ pkgs, ... }: {
    #       nixpkgs.config.allowUnfree = true;
    #       services.ngrok = {
    #         enable = true;
    #         extraConfig = { };
    #         extraConfigFiles = [
    #           # reference to files containing `authtoken` and `api_key` secrets
    #           # ngrok will merge these, together with `extraConfig`
    #         ];
    #         endpoints = [
    #           {
    #             name = "ssh";
    #             url = "tcp://dovetailed-intranational-cammy.ngrok-free.dev:1234";
    #             upstream.url = "1234";
    #           }
    #         ];
    #       };
    #     })
    # ];
}
