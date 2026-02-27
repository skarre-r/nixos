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
    helix
    obsidian
    protonmail-desktop
    vscodium
    freetube
    sublime
    ungoogled-chromium
    neovim
    librewolf
  ];
}
