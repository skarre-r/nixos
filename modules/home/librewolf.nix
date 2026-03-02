{ pkgs, ... }:

{
  programs.librewolf = {
    enable = true;
    policies = { }; # TODO: extensions
    profiles = { };
    settings = { }; # TODO
    package = pkgs.librewolf.overrideAttrs (p: rec {
      desktopItem = p.desktopItem.override (i: {
        icon = "firefox";
      });
    });
  };
}
