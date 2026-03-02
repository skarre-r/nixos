{ ... }:

{
  programs.ghostty = {
    enable = true;
    enableFishIntegration = true;
    clearDefaultKeybinds = false;
    installBatSyntax = false;
    installVimSyntax = false;
    settings = {
      font-family = "JetBrains Mono";
      font-size = 12;
      font-thicken = true;
      theme = "Monokai Pro";
      keybind = [ ];
      window-padding-x = 16;
      window-padding-y = 14;
      window-padding-balance = true;
      window-padding-color = "extend";
      window-vsync = true;
      window-inherit-working-directory = true;
      window-decoration = "auto";
      focus-follows-mouse = true;
      quick-terminal-position = "top";
      quick-terminal-autohide = false;
      quick-terminal-keyboard-interactivity = "on-demand";
      gtk-quick-terminal-layer = "top";
      shell-integration = "detect";
    };
    systemd.enable = true;
  };
}
