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
      "org/gnome/desktop/calendar" = {
        show-weekdate = true;
      };
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
        enable-animations = false;
        enable-hot-corners = false;
        font-antialiasing = "rgba";
        font-hinting = "full";
        show-battery-percentage = true;
        text-scaling-factor = 1.0;
      };
      "org/gnome/desktop/wm/keybindings" = {
        maximize = [ ];
        minimize = [ ];
      };
      "org/gnome/desktop/wm/preferences" = {
        button-layout = "appmenu:minimize,maximize,close";
        num-workspaces = 1;
      };
      "org/gnome/mutter" = {
        dynamic-workspaces = false;
        edge-tiling = true;
        # overlay-key = "";
      };
      "org/gnome/mutter/keybindings" = {
        toggle-tiled-left = [ "" ];
        toggle-tiled-right = [ "" ];
      };
      "org/gnome/nautilus/preferences" = {
        date-time-format = "simple";
        default-folder-viewer = "list-view";
        show-image-thumbnails = "always";
      };
      "org/gnome/shell" = {
        enabled-extensions = [
          "blur-my-shell@aunetx"
          "just-perfection-desktop@just-perfection"
          "dash-to-dock@micxgx.gmail.com"
          "user-theme@gnome-shell-extensions.gcampax.github.com"
          "gTile@vibou"
          "kiwi@kemma"
          "appindicatorsupport@rgcjonas.gmail.com"
          "run-or-raise@edvard.cz"
        ];
      };
      "org/gnome/shell/extensions/dash-to-dock" = {
        show-mounts = false;
        show-show-apps-button = true;
        show-trash = false;
      };
      "org/gnome/shell/extensions/gtile" = {
        auto-close = true;
        follow-cursor = false;
        grid-sizes = "20x16";
        insets-primary-bottom = 8;
        insets-primary-left = 8;
        insets-primary-right = 8;
        insets-primary-top = 8;
        insets-secondary-bottom = 8;
        insets-secondary-left = 8;
        insets-secondary-right = 8;
        insets-secondary-top = 8;
        show-icon = false;
        window-spacing = 8;
      };
      # "org/gnome/shell/extensions/just-perfection" = {};
      "org/gnome/shell/extensions/kiwi" = {
        add-username-to-quick-menu = false;
        battery-percentage = true;
        button-type = "titlebuttons-alt";
        enable-firefox-styling = true;
        enable-launchpad-app = false;
        hide-activities-button = false;
        lock-icon = false;
        move-calendar-right = false;
        move-window-to-new-workspace = false;
        skip-overview-on-login = true;
        transparent-move = false;
      };
      "org/gtk/gtk4/settings/file-chooser" = {
        show-hidden = true;
      };
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
    <Shift><Ctrl><Super><Alt>z,zeditor,Zed,
    <Shift><Ctrl><Super><Alt>s,slack,,
    <Shift><Ctrl><Super><Alt>p,plex,,
    <Shift><Ctrl><Super><Alt>o,obsidian,,
    <Shift><Ctrl><Super><Alt>l,librewolf,,
  '';
}
