# THIS_DIR="$(dirname $0)"
THIS_DIR="/Users/$(id -un)/ghq/github.com/mitsuoka0423/dotfiles"
echo $THIS_DIR
cd $THIS_DIR

ln -snfv "$THIS_DIR/.Brewfile" "$HOME"
ln -snfv "$THIS_DIR/.Brewfile.lock.json" "$HOME"
ln -snfv "$THIS_DIR/Makefile" "$HOME"
ln -snfv "$THIS_DIR/karabiner/karabiner.json" "$HOME/.config/karabiner"
ln -snfv "$THIS_DIR/zsh/headline.zsh-theme" "$HOME/.config/zsh"

cd ~
