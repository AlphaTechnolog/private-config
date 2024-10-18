{
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/efi";
    };

    grub = {
      efiSupport = true;
      useOSProber = true;
      device = "nodev";
    };
  };
}