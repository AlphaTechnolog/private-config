{ pkgs, ... }: {
  system.userActivationScripts.installHarakaraConfig = let
    tomlFormat = pkgs.formats.toml {};

    config = tomlFormat.generate "config.toml" {
      font = {
        family = "Iosevka Nerd Font";
        size = 12;
      };

      window = {
        padding = 0;
        default-dimensions = {
          x = 800;
          y = 600;
        };
      };

      colors = rec {
        background = "#1d2021";
        foreground = "#d4be98";
        extra.zoom-indicator = "#32302f";

        normal = {
          black = "#32302f";
          red = "#ea6962";
          green = "#a9b665";
          yellow = "#d8a657";
          blue = "#7daea3";
          magenta = "#d3869b";
          cyan = "#89b482";
          white = "#d4be98";
        };

        bright = normal // {
          black = "#32302f";
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
