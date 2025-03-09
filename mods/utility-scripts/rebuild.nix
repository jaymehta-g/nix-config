# This expects pkexec and zenity
{pkgs, lib, config, ...}:
{
    config = 
      lib.mkIf config.utility-scripts.enable 
    {
      environment.systemPackages = [ (
        pkgs.writeShellScriptBin "rebuild" 
          (builtins.readFile ../../rebuild.sh)
      )];
    };
}
