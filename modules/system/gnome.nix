{
  pkgs,
  ...
}:
let
  excludePackages = with pkgs; [
    gnome-characters
    gnome-clocks
    gnome-console
    gnome-font-viewer
    gnome-music
    gnome-weather
    gnome-connections # remote desktop
    baobab # disk usage analyzer
    # decibels # audio player
    epiphany # web browser
    simple-scan # document scanner
    snapshot # camera
    yelp # help viewer
    gnome-tour
    gnome-user-docs
    # gnome-system-monitor
    # gnome-text-editor
    # gnome-calculator
    # gnome-calendar
    # gnome-contacts
    # gnome-maps
    # gnome-logs
    # nautilus # file manager
    # showtime # video player
    # papers # document viewer
    # loupe # image viewer
  ];

  extraPackages = with pkgs; [
    newsflash # rss reader
    fragments # torrent client
    errands # reminders app
    dconf-editor
    gnome-tweaks
  ];
in

{
  services.displayManager.gdm = {
    enable = true;
    wayland = true;
    autoSuspend = true;
  };
  services.desktopManager.gnome.enable = true;

  services.gnome = {
    core-apps.enable = true;
    core-developer-tools.enable = false;
    games.enable = false;
    gnome-online-accounts.enable = true;
    gnome-software.enable = true;
    gnome-settings-daemon.enable = true;
    gnome-remote-desktop.enable = false;
    gnome-initial-setup.enable = false;
    sushi.enable = true;
  };

  environment.gnome.excludePackages = excludePackages;
  environment.systemPackages = extraPackages;

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
