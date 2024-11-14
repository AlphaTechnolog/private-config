{
  imports = [
    ./disk-configuration.nix
    ./hardware-configuration.nix
    ./modules/overlays.nix
    ./modules/substituters.nix
    ./modules/boot.nix
    ./modules/networking.nix
    ./modules/services.nix
    ./modules/users.nix
    ./modules/pkgs.nix
    ./modules/nix.nix
    ./modules/virtualisation.nix
    ./user-config
  ];

  system.stateVersion = "24.05";
}
