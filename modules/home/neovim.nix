{ pkgs, ... }:

{
  home.packages = with pkgs; [
    neovim
  ];

  programs.neovim = {
    enable = true;

    defaultEditor = false;

    extraConfig = "";
    extraLuaConfig = "";
    #extraName = "";
    extraPackages = [ ];

    plugins = [ ];

    viAlias = false;
    vimAlias = false;
    vimdiffAlias = false;

    #waylandSupport = true;

    withNodeJs = false;
    #withPerl = false;
    withPython3 = true;
    withRuby = true;

    package = pkgs.neovim;
  };
}
