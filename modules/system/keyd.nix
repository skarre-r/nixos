# https://wiki.nixos.org/wiki/Keyd
{ ... }:

{
  services.keyd = {
    enable = true;
    # keyboard = {
    #   default = {
    #     ids = [ "*" ];
    #     settings = {
    #       main = {
    #         # copilot key
    #         "leftshift+leftmeta+f23" = "";
    #       };
    #     };
    #   };
    # };
  };

  environment.etc."keyd/default.conf".source = ./keyd.conf;

  environment.etc."libinput/local-overrides.quirks".text = ''
    [Serial Keyboards]
    MatchUdevType=keyboard
    MatchName=keyd virtual keyboard
    AttrKeyboardIntegration=internal
  '';
}
