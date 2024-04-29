#!/bin/zsh

# home-manager
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
nix-shell '<home-manager>' -A install

THIS_DIR="/Users/$(id -un)/ghq/github.com/mitsuoka0423/dotfiles"

export NIXPKGS_ALLOW_UNFREE=1

[ -d "$HOME/.config/nix" ] || mkdir "$HOME/.config/nix"
ln -snfv "$THIS_DIR/nix/nix.conf" "$HOME/.config/nix"
[ -d "$HOME/.config/home-manager" ] || mkdir "$HOME/.config/home-manager"
ln -snfv "$THIS_DIR/home-manager/home.nix" "$HOME/.config/home-manager"
