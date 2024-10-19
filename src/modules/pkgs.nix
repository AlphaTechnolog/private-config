{ pkgs, ... }: {
  programs.firefox = {
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
        ];
      };
    in [
      zig
      zls
      cutefetch
      git
      github-cli
      vscode
      vim
      emacs
      wget
      openvpn
      update-resolv-conf
    ]);
  };
}