{
  pkgs,
  ...
}:
let
  excludePackages = with pkgs; [
    baobab # disk usage analyzer
    # decibels # audio player
    epiphany # web browser
    gnome-tour
    gnome-user-docs
    gnome-characters
    gnome-clocks
    gnome-console
    gnome-font-viewer
    gnome-music
    gnome-weather
    gnome-connections # remote desktop
    # gnome-system-monitor
    # gnome-text-editor
    # gnome-calculator
    # gnome-calendar
    # gnome-contacts
    # gnome-maps
    # gnome-logs
    # loupe # image viewer
    # nautilus # file manager
    # papers # document viewer
    simple-scan # document scanner
    snapshot # camera
    # showtime # video player
    yelp # help viewer
  ];

  extraPackages = with pkgs; [
    apostrophe # markdown editor
    # blanket # ambient sounds
    # collision # verify file hashes
    dconf-editor
    deja-dup # backup tool
    dialect # translation
    # errands # reminders app
    # eyedropper # color picker
    fragments # torrent client
    gnome-podcasts # podcast player
    gnome-tweaks
    # impression # create bootable drives
    komikku # comic reader
    # keypunch # practice typing
    newsflash # rss reader
    resources # resource monitor
    shortwave # radio player
    # valuta # currency converter
    # wike # wikipedia reader
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
