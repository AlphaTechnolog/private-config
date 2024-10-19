{ inputs, ... }: {
  nixpkgs.overlays = [
    (_: final: let
      inherit (final) system;
    in {
      open-repo = inputs.open-repo.packages.${system}.default;
      cartero = inputs.cartero.packages.${system}.default;

      cutefetch = inputs.cutefetch.packages.${system}.default.overrideAttrs {
        patches = [
          ./patches/001-cutefetch-disable-nerdfonts.patch
        ];
      };
    })
  ];
}