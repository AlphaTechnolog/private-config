{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
  };

  outputs = { self, nixpkgs, ... } @inputs: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {inherit system;};
  in {
    nixosConfigurations.nixhost = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./src/configuration.nix
      ];
    };
  };
}