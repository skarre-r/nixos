{ pkgs, ... }:

{
  home.packages = with pkgs; [
    obsidian
  ];

  programs.obsidian = {
    enable = true;

    vaults = { };
    defaultSettings = {
      app = { };
      appearance = { };
      communityPlugins = [ ];
      # corePlugins = [ ];
      cssSnippets = [ ];
      extraFiles = [ ];
      hotkeys = [ ];
      themes = [ ];
    };

    package = pkgs.obsidian;
  };
}
