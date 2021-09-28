#!/bin/zsh

set -u

echo "SSHキーを生成しています..."
zsh ./scripts/generate_sshkey.sh

echo "開発に必要なツールをインストールしています..."
zsh ./scripts/install_volta.sh
zsh ./scripts/install_homebrew.sh
zsh ./scripts/download_app.sh

echo "dotfileにシンボリックリンクを設定しています..."
THIS_DIR=$(cd $(dirname $0); pwd)
cd $THIS_DIR

for f in .??*; do
    [ "$f" = ".git" ] && continue
    [ "$f" = "configs" ] && continue
    ln -snfv ${THIS_DIR}/"$f" ~
done

# fish系
ln -sf ${THIS_DIR}/fish ~/.config/fish
ln -sf ${THIS_DIR}/fisher ~/.config/fisher

echo "スクリーンショット保存場所を変更しています..."
mkdir ~/Pictures/Screenshots
defaults write com.apple.screencapture location ~/Pictures/Screenshots/;killall SystemUIServer

cat << END

**************************************************
DOTFILES SETUP FINISHED! bye.
**************************************************

END