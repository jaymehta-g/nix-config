{pkgs, lib, config, ...}:
{
    config = 
      lib.mkIf config.utility-scripts.enable 
    {
      environment.systemPackages = [ (
        pkgs.writeShellScriptBin "winreboot" 
          "systemctl reboot --boot-loader-entry=auto-windows"
      )];
    };
}
