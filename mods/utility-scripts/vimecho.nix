{pkgs, lib, config, ...}:
{
    config = 
      lib.mkIf config.utility-scripts.enable 
    {
      environment.systemPackages = [ (
        pkgs.writeShellScriptBin "vimecho" 
          ''
            _vimecho=`mktemp`
            nvim $_vimecho
            cat $_vimecho
            rm $_vimecho
          ''
      )];
    };
}
