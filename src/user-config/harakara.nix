{ pkgs, ... }: {
  system.userActivationScripts.installHarakaraConfig = let
    tomlFormat = pkgs.formats.toml {};

    config = tomlFormat.generate "config.toml" {
      font = {
        family = "monospace";
        size = 11;
      };

      window = {
        padding = 0;
        default-dimensions = {
          x = 800;
          y = 600;
        };
      };

      colors = rec {
        background = "#141414";
        foreground = "#d8d8d8";
        extra.zoom-indicator = "#323232";

        normal = {
          black = "#181818";
          red = "#ab4642";
          green = "#a1b56c";
          yellow = "#f7ca88";
          blue = "#7cafc2";
          magenta = "#ba8baf";
          cyan = "#86c1b9";
          white = "#d8d8d8";
        };

        bright = normal // {
          black = "#323232";
        };
      };
    };
  in {
    deps = [];

    text = ''
      test -d ~/.config/harakara && rm -rvf ~/.config/harakara
      mkdir -pv ~/.config/harakara
      ln -svf "${config}" ~/.config/harakara/config.toml
    '';
  };
}
