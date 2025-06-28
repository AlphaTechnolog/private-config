{
  inputs = {
    systems.url = "github:nix-systems/default-linux";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    cutefetch.url = "github:AlphaTechnolog/cutefetch";
    open-repo.url = "github:AlphaTechnolog/open-repo";
    harakara-terminal.url = "github:AlphaTechnolog/harakara-terminal";
  };

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: let
    system = "x86_64-linux";
  in {
    nixosConfigurations.nixhost = nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = {inherit inputs system;};

      modules = [
        ./src/configuration.nix
        inputs.disko.nixosModules.default
      ];
    };
  };
}
