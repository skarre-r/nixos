{ pkgs, ... }:

{
  home.packages = with pkgs; [
    atuin
  ];

  programs.atuin = {
    enable = true;

    enableBashIntegration = true;
    enableFishIntegration = true;
    enableNushellIntegration = true;
    enableZshIntegration = true;

    settings = { };

    package = pkgs.atuin;
  };
}
