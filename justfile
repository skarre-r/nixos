[private]
default:
    @just --list

alias help := default

install:
    #!/usr/bin/env bash
    NIX_EXPERIMENTAL_FEATURES="nix-command flakes" sudo nixos-rebuild switch --impure --flake .#thinkpad

update:
    sudo nix flake update

# TODO: replace commands with `nh`

rebuild:
    sudo nixos-rebuild switch --impure --flake .

clean:
    nix-collect-garbage -d

optimize:
    nix-store --optimise

archive:
    nix flake archive

fingerprint:
    fprintd-enroll
