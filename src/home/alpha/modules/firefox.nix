{ inputs, ... }: let
  inherit (inputs) firefox-gnome-theme;
in {
  home.file."firefox-gnome-theme" = {
    target = ".mozilla/firefox/default/chrome/firefox-gnome-theme";
    source = firefox-gnome-theme;
  };

  programs.firefox = {
    enable = true;
    profiles.default = {
      name = "Default";
      settings = {
        "extensions.activeThemeID" = "firefox-compact-dark@mozilla.org";
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "browser.tabs.drawInTitlebar" = true;
        "svg.context-properties.content.enable" = true;
      };
      userChrome = ''
        @import "firefox-gnome-theme/userChrome.css";
        @import "firefox-gnome-theme/theme/colors/dark.css";
      '';
    };
  };
}
