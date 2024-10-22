{ inputs, ... }: {
  nixpkgs.overlays = [
    (prev: final: let
      inherit (final) system;
      defaultPackage = package: inputs.${package}.packages.${system}.default;
    in {
      open-repo = defaultPackage "open-repo";
      cartero = defaultPackage "cartero";
      harakara-terminal = defaultPackage "harakara-terminal";

      cutefetch = (defaultPackage "cutefetch").overrideAttrs {
        patches = [
          ./patches/001-cutefetch-disable-nerdfonts.patch
        ];
      };
    })
  ];
}