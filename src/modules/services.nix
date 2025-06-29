{ pkgs, ... }: {
  services = {
    desktopManager.gnome.enable = true;
    displayManager.gdm.enable = true;
    xserver.enable = true;

    pipewire = {
      enable = true;
      pulse.enable = true;
    };

    libinput = {
      enable = true;
    };

    emacs = {
      enable = true;
      package = pkgs.emacs;
    };

    openssh = {
      enable = true;
    };
  };
}
