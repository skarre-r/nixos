{ pkgs, ... }:

{
  programs.librewolf = {
    enable = true;

    policies = { };
    profiles = { };
    settings = { };

    package = pkgs.librewolf.overrideAttrs(p: rec {
      desktopItem = p.desktopItem.override(i: {
        icon = "firefox";
      });
    });
  };

  # xdg.desktopEntries.librewolf = {
  #   name = "LibreWolf";
  #   icon = "firefox";  
  # };
}
