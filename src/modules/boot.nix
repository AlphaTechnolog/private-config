{pkgs, ...}: {
  boot = {
    kernelPackages = pkgs.linuxKernel.packages.linux_xanmod_latest;
    loader = {
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/efi";
      };
      grub = {
        efiSupport = true;
        device = "nodev";
        useOSProber = true;
      };
    };
  };
}
