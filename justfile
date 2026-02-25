[private]
default:
    @just --list

alias help := default

install:
    #!/usr/bin/env bash
    if [[ ! -f "hardware-configuration.nix" ]]; then
        cp /etc/nixos/hardware-configuration.nix .
    fi
    NIX_EXPERIMENTAL_FEATURES="nix-command flakes" sudo nixos-rebuild switch --flake .

update:
    nix flake update

rebuild:
    sudo nixos-rebuild switch --flake .
