{ pkgs, ... }:

{
    services.flatpak = {
      enable = true;
      packages = [
        # "net.waterfox.waterfox"
      ];
    };

    systemd.services.flatpak-repo = {
      wantedBy = [ "multi-user.target" ];
      path = [ pkgs.flatpak ];
      script = ''
        flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
      '';
  };
}