{ pkgs, ... }:
let
  packageNames = [
    # "net.waterfox.waterfox"
  ];
in

{
  services.flatpak = {
    enable = true;
    packages = packageNames;
  };

  systemd.services.flatpak-repo = {
    wantedBy = [ "multi-user.target" ];
    path = [ pkgs.flatpak ];
    script = ''
      flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    '';
  };
}
