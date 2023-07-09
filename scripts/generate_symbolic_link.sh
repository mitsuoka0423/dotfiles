# THIS_DIR="$(dirname $0)"
THIS_DIR='/Users/mitsu/ghq/github.com/tmitsuoka0423/dotfiles'
echo $THIS_DIR
cd "$THIS_DIR"

for f in .??*; do
    [[ "$f" == ".git" ]] && continue
    [[ "$f" == "configs" ]] && continue
    ln -snfv "$THIS_DIR/$f" "$HOME"
done

cd ~
