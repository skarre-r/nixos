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
    gnomeExtensions.power-off-options
    gnomeExtensions.xremap

    # themes
    whitesur-gtk-theme
    whitesur-icon-theme

    # misc
    dconf2nix
    xremap
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
        switch-to-workspace-1 = null;
        switch-to-workspace-2 = null;
        switch-to-workspace-3 = null;
        switch-to-workspace-4 = null;
        switch-to-workspace-5 = null;
        switch-to-workspace-6 = null;
        switch-to-workspace-7 = null;
        switch-to-workspace-8 = null;
        switch-to-workspace-9 = null;
        switch-to-workspace-10 = null;
        switch-to-workspace-11 = null;
        switch-to-workspace-12 = null;
        switch-to-workspace-left = null;
        switch-to-workspace-right = null;
        switch-to-workspace-up = null;
        switch-to-workspace-down = null;
        switch-to-workspace-last = null;
        switch-group = null;
        switch-group-backward = null;
        switch-applications = null;
        switch-applications-backward = null;
        switch-windows = null;
        switch-windows-backward = null;
        switch-panels = null;
        switch-panels-backward = null;
        cycle-group = null;
        cycle-group-backward = null;
        cycle-windows = null;
        cycle-windows-backward = null;
        cycle-panels = null;
        cycle-panels-backward = null;
        show-desktop = null;
        panel-run-dialog = null;
        set-spew-mark = null;
        toggle-above = null;
        maximize = null;
        unmaximize = null;
        minimize = null;
        close = null;
        begin-move = null;
        begin-resize = null;
        toggle-on-all-workspaces = null;
        move-to-workspace-1 = null;
        move-to-workspace-2 = null;
        move-to-workspace-3 = null;
        move-to-workspace-4 = null;
        move-to-workspace-5 = null;
        move-to-workspace-6 = null;
        move-to-workspace-7 = null;
        move-to-workspace-8 = null;
        move-to-workspace-9 = null;
        move-to-workspace-10 = null;
        move-to-workspace-11 = null;
        move-to-workspace-12 = null;
        move-to-workspace-last = null;
        move-to-workspace-left = null;
        move-to-workspace-right = null;
        move-to-workspace-up = null;
        move-to-workspace-down = null;
        move-to-monitor-left = null;
        move-to-monitor-right = null;
        move-to-monitor-down = null;
        move-to-monitor-up = null;
        raise-or-lower = null;
        raise = null;
        lower = null;
        maximize-vertically = null;
        maximize-horizontally = null;
        always-on-top = null;
        move-to-corner-nw = null;
        move-to-corner-ne = null;
        move-to-corner-sw = null;
        move-to-corner-se = null;
        move-to-side-n = null;
        move-to-side-s = null;
        move-to-side-e = null;
        move-to-side-w = null;
        move-to-center = null;
        activate-window-menu = null;
        toggle-fullscreen = null;
        toggle-maximized = null;
        switch-monitor = null;
        rotate-monitor = null;
        cancel-input-capture = null;
        toggle-tiled-left = [ "" ];
        toggle-tiled-right = [ "" ];
      };
      "org/gnome/nautilus/preferences" = {
        date-time-format = "simple";
        default-folder-viewer = "list-view";
        show-image-thumbnails = "always";
      };
      "org/gnome/shell" = {
        # enabled-extensions = [
        #   "blur-my-shell@aunetx"
        #   "just-perfection-desktop@just-perfection"
        #   "dash-to-dock@micxgx.gmail.com"
        #   "user-theme@gnome-shell-extensions.gcampax.github.com"
        #   "gTile@vibou"
        #   "kiwi@kemma"
        #   "appindicatorsupport@rgcjonas.gmail.com"
        #   "run-or-raise@edvard.cz"
        # ];
      };
      "org/gnome/shell/extensions/dash-to-dock" = {
        show-mounts = false;
        show-show-apps-button = true;
        show-trash = false;
      };
      "org/gnome/shell/extensions/gtile" = {
        auto-close = true;
        follow-cursor = false;
        show-icon = false;
        grid-sizes = null;

        window-spacing = 8;
        insets-primary-bottom = 8;
        insets-primary-left = 8;
        insets-primary-right = 8;
        insets-primary-top = 8;
        insets-secondary-bottom = 8;
        insets-secondary-left = 8;
        insets-secondary-right = 8;
        insets-secondary-top = 8;

        resize1 = "1x1 1:1 1:1, 32x20 2:2 31:19, 24x15 2:2 23:14, 16x10 2:2 15:9";
        resize2 = "4x4 1:3 2:4, 2:2 3:3";
        resize3 = "4x4 3:3 4:4, 2:2 3:3";
        resize4 = "4x4 1:1 2:2, 2:2 3:3";
        resize5 = "4x4 3:1 4:2, 2:2 3:3";
        resize6 = "3x1 1:1 1:1";
        resize7 = "3x1 2:1 2:1";
        resize8 = "3x1 3:1 3:1";
        resize9 = "4x1 1:1 2:1, 2:1 3:1";
        resize10 = "4x1 3:1 4:1, 2:1 3:1";
        resize11 = "";
        resize12 = "";
        resize13 = "";
        resize14 = "";
        resize15 = "";
        resize16 = "";
        resize17 = "";
        resize18 = "";
        resize19 = "";
        resize20 = "";
        resize21 = "";
        resize22 = "";
        resize23 = "";
        resize24 = "";
        resize25 = "";
        resize26 = "";
        resize27 = "";
        resize28 = "";
        resize29 = "";
        resize30 = "";

        preset-resize-1 = [ "<Alt><Super>Return" ];
        preset-resize-2 = [ "<Alt><Super>j" ];
        preset-resize-3 = [ "<Alt><Super>k" ];
        preset-resize-4 = [ "<Alt><Super>u" ];
        preset-resize-5 = [ "<Alt><Super>i" ];
        preset-resize-6 = [ "<Alt><Super>d" ];
        preset-resize-7 = [ "<Alt><Super>f" ];
        preset-resize-8 = [ "<Alt><Super>g" ];
        preset-resize-9 = [ "<Alt><Super>Left" ];
        preset-resize-10 = [ "<Alt><Super>Right" ]; # doesnt work
        preset-resize-11 = [ ];
        preset-resize-12 = [ ];
        preset-resize-13 = [ ];
        preset-resize-14 = [ ];
        preset-resize-15 = [ ];
        preset-resize-16 = [ ];
        preset-resize-17 = [ ];
        preset-resize-18 = [ ];
        preset-resize-19 = [ ];
        preset-resize-21 = [ ];
        preset-resize-22 = [ ];
        preset-resize-23 = [ ];
        preset-resize-24 = [ ];
        preset-resize-25 = [ ];
        preset-resize-26 = [ ];
        preset-resize-27 = [ ];
        preset-resize-28 = [ ];
        preset-resize-29 = [ ];

        # TODO: add missing options
        move-down = [ ];
        move-left = [ ];
        move-right = [ ];
        move-up = [ ];
        move-next-monitor = [ ];
        contract-down = [ ];
        contract-right = [ ];
        expand-down = [ ];
        expand-right = [ ];
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
        enable-app-window-buttons = false;
        show-window-controls = false;
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
