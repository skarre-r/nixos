{ pkgs, ... }:

{
  home.packages = with pkgs; [
    lazygit
  ];

  programs.lazygit = {
    enable = true;

    enableBashIntegration = true;
    enableFishIntegration = true;
    enableNushellIntegration = true;
    enableZshIntegration = true;

    settings = { };

    package = pkgs.lazygit;
  };
}
