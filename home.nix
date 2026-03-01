{ pkgs, ... }:
let
  packages = with pkgs; [
    _1password-gui
    sublime
    bruno
    libreoffice
    gh
    plex-desktop
    zed-editor

    # gnome extensions
    gnomeExtensions.blur-my-shell
    gnomeExtensions.just-perfection
    gnomeExtensions.dash-to-dock
    gnomeExtensions.user-themes
    gnomeExtensions.tiling-shell

    # themes
    whitesur-gtk-theme
    whitesur-icon-theme
  ];

in
{
  imports = [
    ./modules/home
  ];

  home.stateVersion = "25.11";
  home.username = "skar";
  home.homeDirectory = "/home/skar";
  home.packages = packages;

  programs.git = {
    enable = true;
    settings = {
      init.defaultBranch = "main";
      user = {
        name = "skarre-r";
        email = "59067313+skarre-r@users.noreply.github.com";
      };
    };
  };
  programs.gnome-shell.enable = true;
  programs.gnome-terminal.enable = false;

  gtk = {
    enable = true;
    iconTheme = {
      name = "WhiteSur";
      package = pkgs.whitesur-icon-theme;
    };
  };

  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/calendar".show-weekdate = true;
    };
  };

  xdg.enable = true;

  fonts.fontconfig = {
    enable = true;
    antialiasing = true;
    hinting = "slight"; # null | "none" | "slight" | "medium" | "full"
    subpixelRendering = "rgb"; # null | "none" | "rgb" | "bgr" | "vertical-rgb" | "vertical-bgr"
  };
}
