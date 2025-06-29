{
  description = "NixOS configuration files.";

  inputs = {
    systems.url = "github:nix-systems/default-linux";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    cutefetch.url = "github:AlphaTechnolog/cutefetch";
    open-repo.url = "github:AlphaTechnolog/open-repo";
    harakara-terminal.url = "github:AlphaTechnolog/harakara-terminal";
    neovim-config = {
      url = "github:AlphaTechnolog/neovim-config";
      flake = false;
    };
    firefox-gnome-theme = {
      url = "github:rafaelmardojai/firefox-gnome-theme";
      flake = false;
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
  in {
    nixosConfigurations.nixhost = nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = { inherit inputs system; };
      modules = [ ./src/configuration.nix ];
    };

    homeConfigurations."alpha" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      extraSpecialArgs = { inherit inputs system; };
      modules = [ ./src/home/alpha ];
    };
  };
}
