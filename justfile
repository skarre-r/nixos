[private]
default:
    @just --list

alias help := default

install:
    #!/usr/bin/env bash
    NIX_EXPERIMENTAL_FEATURES="nix-command flakes" sudo nixos-rebuild switch --impure --flake .

update:
    nix flake update

rebuild:
    sudo nixos-rebuild switch --impure --flake .

collect:
     nix-collect-garbage -d