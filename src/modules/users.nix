{ pkgs, ... }: {
  users.users.alpha = {
    isNormalUser = true;
    initialPassword = "alpha123.";
    extraGroups = ["wheel" "audio" "video" "vboxusers"];

    packages = with pkgs; [
      spotify
      vesktop
    ];
  };
}