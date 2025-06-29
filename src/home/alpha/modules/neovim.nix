{ pkgs, inputs, ... }: {
  home.packages = [ pkgs.neovim ];
  home.activation.installNeovimConfig = let
    inherit (inputs) neovim-config;
  in ''
    test -d ~/.config/nvim && exit 0
    mkdir -p ~/.config/nvim
    cp -rf ${neovim-config}/* ~/.config/nvim
  '';
}
