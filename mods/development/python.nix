{pkgs, unstable, lib, config, ...}:
{
  environment.systemPackages = with pkgs; [
    python313
    python313Packages.pandas
    python313Packages.requests
    python313Packages.flask
    # python313Packages.numpy
    # python313Packages.pyzmq
    python313Packages.pip
  ];
}