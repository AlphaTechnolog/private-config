{ pkgs, ... }: {
  boot = {
    kernelPackages = pkgs.linuxKernel.packages.linux_xanmod_latest;

    initrd.luks.devices = {
      nixhost.device = "/dev/disk/by-uuid/ef95266b-d493-4204-a214-c45e2e0ea2fc";
    };

    loader = {
      efi.canTouchEfiVariables = true;

      grub = {
        efiSupport = true;
        useOSProber = true;
        device = "nodev";
      };
    };
  };
}
