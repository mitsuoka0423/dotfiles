#!/bin/bash

set -u

echo "SSHキーを生成しています..."
bash ./generate_ssh_key.sh

echo "dotfileにシンボリックリンクを設定しています..."
THIS_DIR=$(cd $(dirname $0); pwd)
cd $THIS_DIR

echo "start setup..."
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
