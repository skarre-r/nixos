{ pkgs, ... }:

{
  home.packages = with pkgs; [
    k9s
  ];

  programs.k9s = {
    enable = true;

    aliases = { };
    hotKeys = { };
    plugins = { };
    settings = { };
    skins = { };
    views = { };

    package = pkgs.k9s;
  };
}
