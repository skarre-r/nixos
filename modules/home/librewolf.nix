{ pkgs, ... }:

{
  programs.librewolf = {
    enable = true;
    policies = { }; # TODO: extensions
    profiles = {
      default = {
        extensions = {
          packages = with pkgs.nur.repos.rycee.firefox-addons; [
            darkreader
            multi-account-containers
            onepassword-password-manager
            ublock-origin
          ];
        };
      };
    };
    settings = { }; # TODO
    package = pkgs.librewolf.overrideAttrs (p: rec {
      desktopItem = p.desktopItem.override (i: {
        icon = "firefox";
      });
    });
  };
}
