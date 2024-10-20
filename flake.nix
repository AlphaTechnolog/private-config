{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    cutefetch.url = "github:AlphaTechnolog/cutefetch";
    open-repo.url = "github:AlphaTechnolog/open-repo";
    harakara-terminal.url = "github:AlphaTechnolog/harakara-terminal";
    cartero.url = "github:danirod/cartero";
  };

  outputs = { self, nixpkgs, cutefetch, ... } @inputs: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {inherit system;};
  in {
    nixosConfigurations.nixhost = nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = {inherit inputs system;};

      modules = [
        ./src/configuration.nix
      ];
    };
  };
}