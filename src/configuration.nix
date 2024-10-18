{
  imports = [
    ./hardware-configuration.nix
    ./modules/boot.nix
    ./modules/networking.nix
    ./modules/services.nix
    ./modules/users.nix
    ./modules/pkgs.nix
    ./modules/nix.nix
    ./modules/virtualisation.nix
  ];

  system.stateVersion = "24.05";
}