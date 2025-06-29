{ pkgs, ... }: {
  programs.java.enable = true;

  programs.appimage = {
    enable = true;
    binfmt = true;
  };

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  environment.systemPackages = with pkgs; [
    steam-run
  ];
}
