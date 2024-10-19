{ system, inputs, ... }: {
  nixpkgs.overlays = [
    (_: final: {
      cutefetch = inputs.cutefetch.packages.${system}.default.overrideAttrs {
        patches = [
          ./patches/001-cutefetch-disable-nerdfonts.patch
        ];
      };
    })
  ];
}