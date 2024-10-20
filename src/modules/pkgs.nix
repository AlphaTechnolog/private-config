{ pkgs, ... }: {
  programs.firefox = {
    enable = true;
  };

  programs.nix-ld = {
    enable = true;
  };

  environment = {
    etc.openvpn = {
      source = "${pkgs.update-resolv-conf}/libexec/openvpn";
    };

    systemPackages = with pkgs; (let
      vscode = vscode-with-extensions.override {
        vscodeExtensions = with vscode-extensions; [
          bbenoist.nix
          ms-vscode-remote.remote-ssh
          ziglang.vscode-zig
          ms-python.python
          vue.volar
          rust-lang.rust-analyzer
        ];
      };
    in [
      gcc
      pkg-config
      cargo
      rustc
      zig
      zls
      git
      github-cli
      vscode
      vim
      emacs
      wget
      openvpn
      tigervnc
      update-resolv-conf
    ]);
  };
}
