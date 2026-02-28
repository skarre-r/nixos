{ pkgs, ... }:

{
  home.packages = with pkgs; [
    librewolf
  ];

  programs.librewolf = {
    enable = true;

    #enableGnomeExtensions = true;

    policies = { };
    profiles = { };
    settings = { };

    package = pkgs.librewolf;
  };
}
