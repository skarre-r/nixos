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
    sudo nixos-rebuild switch --impure --flake .

switch:
    nh os switch --impure .

clean:
    sudo nh clean all --optimise --keep 3 --keep-since 24h

optimize:
    nix-store --optimise

archive:
    nix flake archive

fingerprint:
    fprintd-enroll
