{ pkgs, ... }: {
  programs.home-manager.enable = true;

  home = {
    username = "alpha";
    homeDirectory = "/home/alpha";
    stateVersion = "25.05";
    sessionVariables.EDITOR = "vim";
  };

  imports = [
    ./modules/firefox.nix
    ./modules/pkgs.nix
    ./modules/alacritty.nix
    ./modules/neovim.nix
  ];
}
