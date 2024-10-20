{ pkgs, ... }: {
  users.users.alpha = {
    isNormalUser = true;
    initialPassword = "alpha123.";
    extraGroups = ["wheel" "audio" "video" "vboxusers"];

    packages = with pkgs; [
      spotify
      fastfetch
      vesktop
      open-repo
      cutefetch
      cartero
      htop
      harakara-terminal
    ];
  };
}
