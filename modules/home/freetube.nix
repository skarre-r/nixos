{ pkgs, ... }:

{
  home.packages = with pkgs; [
    freetube
  ];

  programs.freetube = {
    enable = true;

    settings = {
      defaultQuality = "1080";
    };

    package = pkgs.freetube;
  };
}
