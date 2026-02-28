{ pkgs, ... }:

{
  home.packages = with pkgs; [
    firefox
  ];

  # TODO: arkenfox?
  programs.firefox = {
    enable = true;

    #enableGnomeExtensions = true;

    nativeMessagingHosts = [ ];
    policies = { };
    profiles = { };

    package = pkgs.firefox;
  };
}
