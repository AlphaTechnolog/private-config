# This ain't really user-space only but this is the best place to put configs so idk
{ pkgs, ... }: {
  programs.bash = {
    vteIntegration = true;
    enableLsColors = true;

    shellAliases = with pkgs; {
      neofetch = lib.getExe fastfetch;
    };
  };
}