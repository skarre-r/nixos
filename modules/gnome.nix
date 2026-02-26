{
  pkgs,
  ...
}:

{
  services.displayManager.gdm = {
    enable = true;
    wayland = true;
  };
  services.desktopManager.gnome.enable = true;

  services.gnome = {
    core-apps.enable = false;
    core-developer-tools.enable = false;
    games.enable = false;
  };

  environment.gnome.excludePackages = with pkgs; [
    gnome-tour
    gnome-weather
    gnome-console
  ];

  programs.gnome-shell = {
    enable = true;
    extensions = [ ];
    theme = null;
  };

  programs.dconf.profiles.user.databases = [
    {
      lockAll = false;
      settings = {
        "org/gnome/mutter" = {
          experimental-features = [
            "scale-monitor-framebuffer"
            "xwayland-native-scaling"
          ];
        };
      };
    }
  ];
}
