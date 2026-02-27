{ pkgs, ... }:

{
  home.packages = with pkgs; [
    ghostty
  ];

  programs.ghostty = {
    enable = true;

    enableBashIntegration = true;
    enableFishIntegration = true;
    enableZshIntegration = true;

    settings = {
      font-famili = "JetBrains Mono";
      font-size = 13;
      font-thicken = true;

      theme = "Monokai Pro";

      window-padding-x = 16;
      window-padding-y = 14;
      window-padding-balance = true;
      window-padding-color = "extend";
    };
  };
}
