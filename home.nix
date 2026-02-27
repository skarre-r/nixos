{ pkgs, ... }:

{
  imports = [
    ./modules/home
  ];

  home.stateVersion = "25.11";

  home.username = "skar";
  home.homeDirectory = "/home/skar";

  home.packages = with pkgs; [
    ghostty
    helix
    obsidian
    protonmail-desktop
    _1password-gui
    vscodium
    freetube
    sublime
    ungoogled-chromium
    neovim
    librewolf
  ];
}
