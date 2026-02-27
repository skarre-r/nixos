{ pkgs, ... }:

{
  home.packages = with pkgs; [
    eza
  ];

  programs.eza = {
    enable = true;

    enableBashIntegration = true;
    enableFishIntegration = true;
    enableNushellIntegration = true;
    enableZshIntegration = true;

    package = pkgs.eza;
  };
}
