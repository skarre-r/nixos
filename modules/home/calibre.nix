{ pkgs, ... }:

{
  home.packages = with pkgs; [
    calibre
  ];

  programs.calibre = {
    enable = true;
    package = pkgs.calibre;

    plugins = [ ];
  };
}
