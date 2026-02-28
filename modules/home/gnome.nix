{ pkgs, ... }:
let
  extensions = with pkgs; [
    gnomeExtensions.blur-my-shell
    gnomeExtensions.just-perfection
    gnomeExtensions.dash-to-dock
    gnomeExtensions.user-themes
    gnomeExtensions.tiling-shell
  ];
in
{
  home.packages = extensions;

  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/calendar" = {
        show-weekdate = true;
      };
      "org/gnome/shell/extensions/dash-to-dock" = { };
      "org/gnome/shell/keybindings" = { };

    };
  };

  gtk = {
    enable = true;
    #theme = {
    #  name = "WhiteSur";
    #  package = pkgs.whitesur-gtk-theme;
    #};
    iconTheme = {
      name = "WhiteSur";
      package = pkgs.whitesur-icon-theme;
    };
  };

  # TODO: https://mynixos.com/home-manager/options/programs.gnome-shell
  programs.gnome-shell = {
    enable = true;
  };

  programs.gnome-terminal = {
    enable = false;
  };
}
