[private]
default:
    @just --list

alias help := default

install:
    #!/usr/bin/env bash
    NIX_EXPERIMENTAL_FEATURES="nix-command flakes" sudo nixos-rebuild switch --impure --flake .#thinkpad

update:
    sudo nix flake update

rebuild:
    nh os switch --impure .

switch: rebuild

clean:
    sudo nh clean all --optimise --keep 3 --keep-since 24h

optimize:
    nix-store --optimise

archive:
    nix flake archive

fingerprint:
    fprintd-enroll

reload:
    keyd reload

dconf:
    #!/usr/bin/env bash
    # dconf dump / | dconf2nix
    dconf dump

hibernate:
    sudo systemctl hibernate
