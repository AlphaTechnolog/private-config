{ pkgs, ... }: {
  services = {
    xserver = {
      enable = true;
      desktopManager.gnome.enable = true;
      displayManager.gdm.enable = true;
    };

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