{ pkgs, ... }: {
  environment = {
    etc.openvpn = {
      source = "${pkgs.update-resolv-conf}/libexec/openvpn";
    };

    systemPackages = with pkgs; [
      git
      vim
      emacs
      vscode.fhs
      firefox
      wget
      openvpn
      update-resolv-conf
    ];
  };
}