{ pkgs, ... }:

{
  home.packages = with pkgs; [
    jujutsu
  ];

  programs.jujutsu = {
    enable = true;

    ediff = false;
    settings = { };

    package = pkgs.jujutsu;
  };
}
