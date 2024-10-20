{ pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
    ./modules/overlays.nix
    ./modules/boot.nix
    ./modules/networking.nix
    ./modules/services.nix
    ./modules/users.nix
    ./modules/pkgs.nix
    ./modules/nix.nix
    ./modules/virtualisation.nix
  ];

  system = {
    stateVersion = "24.05";

    # userActivationScripts.example = {
    #   deps = [];
    #   text = let
    #     inherit (pkgs) lib hello;
    #   in ''
    #     ${lib.getExe hello} | tee $HOME/text.txt
    #   '';
    # };
  };
}