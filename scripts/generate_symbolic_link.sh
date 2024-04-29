# THIS_DIR="$(dirname $0)"
THIS_DIR="/Users/$(id -un)/ghq/github.com/mitsuoka0423/dotfiles"
echo $THIS_DIR

ln -snfv "$THIS_DIR/.Brewfile" "$HOME"
ln -snfv "$THIS_DIR/.Brewfile.lock.json" "$HOME"
ln -snfv "$THIS_DIR/Makefile" "$HOME"
[ -d "$HOME/.config/karabiner"] || mkdir "$HOME/.config/karabiner"
ln -snfv "$THIS_DIR/karabiner/karabiner.json" "$HOME/.config/karabiner/karabiner.json"
[ -d "$HOME/.config/zsh"] || mkdir "$HOME/.config/zsh"
ln -snfv "$THIS_DIR/zsh/headline.zsh-theme" "$HOME/.config/zsh/headline.zsh-theme"

cd ~
