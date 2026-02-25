{ config, pkgs, ... }:

{
  home.stateVersion = "25.11";

  home.username = "skar";
  home.homeDirectory = "/home/skar";

  home.packages = with pkgs; [ ];

  programs.git.enable = true;
}
