{ pkgs, ... }:

{
  home.packages = with pkgs; [
    vscodium
  ];

  programs.vscode = {
    enable = true;

    dataFolderName = null;
    profiles = { };

    package = pkgs.vscodium;
  };
}
