#!/bin/zsh

sudo rm /etc/*.backup-before-nix

# nix
sh <(curl -L https://nixos.org/nix/install)

# home-manager
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
nix-shell '<home-manager>' -A install