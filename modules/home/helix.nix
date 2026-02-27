{ pkgs, ... }:

{
  home.packages = with pkgs; [
    helix
  ];

  programs.helix = {
    enable = true;

    defaultEditor = false;

    settings = { };
    languages = { };
    ignores = [ ];
    extraPackages = [ ];

    package = pkgs.helix;
  };
}
