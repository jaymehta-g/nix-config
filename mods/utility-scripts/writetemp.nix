{pkgs, lib, config, ...}:
{
    config = 
      lib.mkIf config.utility-scripts.enable 
    {
      environment.systemPackages = [ (
        pkgs.writeShellScriptBin "writetemp" 
          ''
            _vimecho=`mktemp`
            nvim $_vimecho
            echo $_vimecho
          ''
      )];
    };
}
