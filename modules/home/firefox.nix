{ pkgs, ... }:

{
  # TODO: arkenfox?
  programs.firefox = {
    enable = false;

    nativeMessagingHosts = [ ];
    policies = { };
    profiles = { };

    package = pkgs.firefox;
  };
}
