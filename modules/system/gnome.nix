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
    decibels # audio player
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
    nixos-render-docs
  ];

  extraPackages = with pkgs; [
    newsflash # rss reader
    fragments # torrent client
    errands # reminders app
    blanket # ambient sounds
    dialect # translation
    iotas # note-taking app
    eyedropper # color picker
    komikku # comic reader
    dconf-editor
    sysprof
  ];
in

{
  services.displayManager.gdm = {
    enable = true;
    wayland = true;
    autoSuspend = true;
  };
  services.desktopManager.gnome.enable = true;

  services.flatpak.enable = true;

  services.gnome = {
    core-apps.enable = true;
    core-developer-tools.enable = false;
    games.enable = false;
    gnome-online-accounts.enable = true;
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
