{ pkgs, ... }: {
  programs.nix-ld.enable = true;
  environment.systemPackages = with pkgs; (let
    vscode = vscode-with-extensions.override {
      vscodeExtensions = with vscode-extensions; [
        bbenoist.nix
        ms-vscode-remote.remote-ssh
        ziglang.vscode-zig
        ms-python.python
        vue.volar
        rust-lang.rust-analyzer
        bradlc.vscode-tailwindcss
      ];
    };
  in [
    vscode
    gcc
    pkg-config
    cargo
    rustc
    zig
    zls
    git
    github-cli
    wget
    update-resolv-conf
    gparted
    ntfs3g
  ]);
}
