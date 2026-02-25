[private]
default:
    @just --list

alias help := default

install:
    sudo nixos-rebuild switch --experimental-features 'nix-command flakes' --flake .

update:
    @echo "todo"

rebuild:
    sudo nixos-rebuild switch --flake .
