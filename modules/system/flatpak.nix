{ pkgs, ... }:
let
  packages = [
    "com.mattjakeman.ExtensionManager"
  ];
in
{
  services.flatpak = {
    enable = true;
    packages = packages;
  };

  systemd.services.flatpak-repo = {
    wantedBy = [ "multi-user.target" ];
    path = [ pkgs.flatpak ];
    script = ''
      flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    '';
  };
}
