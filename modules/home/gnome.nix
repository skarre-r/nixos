{ pkgs, ... }:
let
  packages = with pkgs; [
    # extensions
    gnomeExtensions.blur-my-shell
    gnomeExtensions.just-perfection
    gnomeExtensions.dash-to-dock
    gnomeExtensions.user-themes
    gnomeExtensions.gtile
    gnomeExtensions.kiwi-is-not-apple
    gnomeExtensions.appindicator
    gnomeExtensions.run-or-raise

    # themes
    whitesur-gtk-theme
    whitesur-icon-theme

    # misc
    dconf2nix
  ];
in
{
  home.packages = packages;

  # TODO: configure gtile
  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/calendar".show-weekdate = true;
    };
  };

  gtk = {
    enable = true;
    iconTheme = {
      name = "WhiteSur";
      package = pkgs.whitesur-icon-theme;
    };
  };

  programs.gnome-shell.enable = true;
  programs.gnome-terminal.enable = false;

  # TODO: https://github.com/CZ-NIC/run-or-raise
  xdg.configFile."run-or-raise/shortcuts.conf".text = ''
    <Shift><Ctrl><Super><Alt>g,ghostty,,
    <Shift><Ctrl><Super><Alt>f,nautilus,Org.gnome.Nautilus,
    <Shift><Ctrl><Super><Alt>z,zed,,
  '';
}
