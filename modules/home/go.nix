{ pkgs, ... }:

{
  home.packages = with pkgs; [
    go
  ];

  programs.go = {
    enable = true;

    telemetry.mode = "off";

    package = pkgs.go;
  };
}
