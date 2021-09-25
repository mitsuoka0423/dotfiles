#!/bin/bash

set -u

echo "SSHキーを生成しています..."
echo "ssh-keygen -t ed25519 -C "mono0423@gmail.com""
ssh-keygen -t ed25519 -C "mono0423@gmail.com"

echo "ssh-agentに鍵を登録しています..."
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

echo "公開鍵を登録してください"
echo "GitHubを開くには、エンターを押してください"
read
pbcopy < ~/.ssh/id_ed25519.pub
open https://github.com/settings/keys

echo "公開鍵の登録が終わったらエンターを押してください"
read

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
