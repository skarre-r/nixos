{ pkgs, ... }:

{
  imports = [
    ./modules/home
  ];

  home.stateVersion = "25.11";

  home.username = "skar";
  home.homeDirectory = "/home/skar";

  home.packages = with pkgs; [
    _1password-gui
    protonmail-desktop
    sublime
    bruno
    libreoffice
    high-tide # 3rd party tidal client
    gh
    plex-desktop
  ];

  xdg = { };

  fonts.fontconfig = {
    enable = true;
    antialiasing = true;
    hinting = "slight"; # null | "none" | "slight" | "medium" | "full"
    subpixelRendering = "rgb"; # null | "none" | "rgb" | "bgr" | "vertical-rgb" | "vertical-bgr"
  };

  # editorConfig = {
  #   enable = true;
  #   settings = {
  #     "*" = {
  #       charset = "utf-8";
  #       end_of_line = "lf";
  #       trim_trailing_whitespace = true;
  #       insert_final_newline = true;
  #     };
  #   };
  # };

  # TODO:
  # accounts = {
  #   calendar.accounts."nextcloud" = {
  #     name = "nextcloud";
  #     primary = true;
  #     remote = {
  #       type = "caldav";
  #       url = null;
  #       username = null;
  #       passwordCommand = "";
  #     };
  #   };
  #   contacts.accounts."nextcloud" = {
  #     name = "nextcloud";
  #     remote = {
  #       type = "carddav";
  #       url = null;
  #       username = null;
  #       passwordCommand = null;
  #     };
  #   };
  # };

}
