{pkgs, lib, config, ...}:
{
    options = {
        rebuild-script.enable =
            lib.mkEnableOption "enables";
    };

    config = 
      lib.mkIf config.rebuild-script.enable 
    {
      environment.systemPackages = [ (
        pkgs.writeShellScriptBin "rebuild" 
          builtins.readFile ../rebuild.sh
      )];
    };
}
