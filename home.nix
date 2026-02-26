{ config, pkgs, ... }:

{
  home.stateVersion = "25.11";

  home.username = "skar";
  home.homeDirectory = "/home/skar";

  home.packages = with pkgs; [
    ghostty
    cilium-cli
    golangci-lint
    helix
    neovim
  ];

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "skarre-r";
        email = "59067313+skarre-r@users.noreply.github.com";
      };
      init.defaultBranch = "main";
    };
  };
}
