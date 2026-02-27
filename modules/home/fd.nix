{ pkgs, ... }:

{
  home.packages = with pkgs; [
    fd
  ];

  programs.fd = {
    enable = true;

    ignores = [ ];
    extraOptions = [ ];

    package = pkgs.fd;
  };
}
