#!/bin/zsh

# home-manager
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
nix-shell '<home-manager>' -A install

THIS_DIR="/Users/$(id -un)/ghq/github.com/mitsuoka0423/dotfiles"

export NIXPKGS_ALLOW_UNFREE=1
