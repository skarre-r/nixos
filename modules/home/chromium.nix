{ pkgs, ... }:

{
  home.packages = with pkgs; [
    ungoogled-chromium
  ];

  programs.chromium = {
    enable = true;
    package = pkgs.ungoogled-chromium;

    extensions = [ ];
    commandLineArgs = [ ];
  };
}
