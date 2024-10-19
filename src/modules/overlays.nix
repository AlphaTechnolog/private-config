{ inputs, ... }: {
  nixpkgs.overlays = [
    (_: final: let
      inherit (final) system;
    in {
      cutefetch = inputs.cutefetch.packages.${system}.default.overrideAttrs {
        patches = [
          ./patches/001-cutefetch-disable-nerdfonts.patch
        ];
      };
    })
  ];
}