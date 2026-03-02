{ ... }:

{
  programs.zed-editor = {
    enable = true;
    extensions = [
      "nix"
      "just"
      "monokai-pro-ce"
    ];
    userKeymaps = [ ];
    userSettings = { };
    userTasks = [ ];
  };

  # xdg.desktopEntries.zed = {
  #   name = "Zed";
  #   exec = "zeditor";
  #   icon = "vscodium";
  # };
}
