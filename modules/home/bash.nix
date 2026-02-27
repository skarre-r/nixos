{ pkgs, ... }:

{
  home.packages = with pkgs; [
    bashInteractive
  ];

  programs.bash = {
    enable = true;
  };
}
