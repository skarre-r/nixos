{ pkgs, ... }:

{
  home.packages = with pkgs; [
    vscodium
  ];

  programs.vscode = {
    enable = true;

    argvSettings = { };
    dataFolderName = null;
    nameShort = null;
    profiles = { };

    package = pkgs.vscodium;
  };
}
