[private]
default:
    @just --list

alias help := default

install:
    #!/usr/bin/env bash
    if [[ ! -f "hardware-configuration.nix" ]]; then
        cp /etc/nixos/hardware-configuration.nix .
    fi
    sudo nixos-rebuild switch --experimental-features 'nix-command flakes' --flake .

update:
    nix flake update

rebuild:
    sudo nixos-rebuild switch --flake .
