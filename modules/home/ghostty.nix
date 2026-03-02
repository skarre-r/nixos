{ ... }:

{
  programs.ghostty = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      font-family = "JetBrains Mono";
      font-size = 13;
      font-thicken = true;
      theme = "Monokai Pro";
      window-padding-x = 16;
      window-padding-y = 14;
      window-padding-balance = true;
      window-padding-color = "extend";
    };
  };
}
