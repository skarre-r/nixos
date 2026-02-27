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
  ];
}
