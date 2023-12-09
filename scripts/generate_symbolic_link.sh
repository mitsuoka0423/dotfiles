# THIS_DIR="$(dirname $0)"
THIS_DIR='/Users/mitsu/ghq/github.com/mitsuoka0423/dotfiles'
echo $THIS_DIR
cd "$THIS_DIR"

ln -snfv "$THIS_DIR/.Brewfile" "$HOME"
ln -snfv "$THIS_DIR/.Brewfile.lock.json" "$HOME"
ln -snfv "$THIS_DIR/.gitconfig" "$HOME"
ln -snfv "$THIS_DIR/.gitignore_global" "$HOME"
ln -snfv "$THIS_DIR/.zprofile" "$HOME"
ln -snfv "$THIS_DIR/.zshrc" "$HOME"
ln -snfv "$THIS_DIR/flake.nix" "$HOME"
ln -snfv "$THIS_DIR/Makefile" "$HOME"


cd ~
