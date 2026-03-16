# https://wiki.nixos.org/wiki/Keyd
{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    keyd
  ];

  services.keyd = {
    enable = true;
  };

  environment.etc."keyd/default.conf".source = ./keyd.conf;

  environment.etc."libinput/local-overrides.quirks".text = ''
    [Serial Keyboards]
    MatchUdevType=keyboard
    MatchName=keyd virtual keyboard
    AttrKeyboardIntegration=internal
  '';
}
