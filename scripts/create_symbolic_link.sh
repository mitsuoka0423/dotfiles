# THIS_DIR="$(dirname $0)"
THIS_DIR="/Users/$(id -un)/ghq/github.com/mitsuoka0423/dotfiles"
echo $THIS_DIR

ln -snfv "$THIS_DIR/.Brewfile" "$HOME"
ln -snfv "$THIS_DIR/.Brewfile.lock.json" "$HOME"
ln -snfv "$THIS_DIR/Makefile" "$HOME"
ln -snfv "$THIS_DIR/claude/claude_desktop_config.json" "$HOME/Library/Application Support/Claude"
ln -snfv "$THIS_DIR/claude/config.json" "$HOME/Library/Application Support/Claude"
[ -d "$HOME/.config/karabiner"] || mkdir "$HOME/.config/karabiner"
ln -snfv "$THIS_DIR/karabiner/karabiner.json" "$HOME/.config/karabiner"
[ -d "$HOME/.config/zsh"] || mkdir "$HOME/.config/zsh"
ln -snfv "$THIS_DIR/zsh/headline.zsh-theme" "$HOME/.config/zsh/headline.zsh-theme"
ln -snfv "$THIS_DIR/vscode/settings.json" "$HOME/Library/Application Support/Code/User"
ln -snfv "$THIS_DIR/vscode/keybindings.json" "$HOME/Library/Application Support/Code/User"
ln -snfv "$THIS_DIR/workspace" "$HOME/ghq"

cd ~
