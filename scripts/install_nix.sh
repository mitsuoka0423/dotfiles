#!/bin/zsh

sudo rm /etc/*.backup-before-nix


# nix
sh <(curl -L https://nixos.org/nix/install)

## 一度 zsh を読み込み直す必要がある


# home-manager
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
nix-shell '<home-manager>' -A install

THIS_DIR="/Users/$(id -un)/Desktop/dotfiles"

export NIXPKGS_ALLOW_UNFREE=1

ln -snfv "$THIS_DIR/nix/nix.conf" "$HOME/.config/nix"
ln -snfv "$THIS_DIR/home-manager/home.nix" "$HOME/.config/home-manager"
