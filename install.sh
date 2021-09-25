#!/bin/bash

set -u

# 公開鍵をGitHubに登録
echo "generate SSH Key"
ssh-keygen -t ed25519 -C "mono0423@gmail.com"

eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
pbcopy < ~/.ssh/id_ed25519.pub

echo "公開鍵を登録してください"
echo "GitHubを開くには、エンターを押してください"
read
open https://github.com/settings/keys

# 実行場所のディレクトリを取得
THIS_DIR=$(cd $(dirname $0); pwd)

cd $THIS_DIR
git submodule init
git submodule update

echo "start setup..."
for f in .??*; do
    [ "$f" = ".git" ] && continue
    [ "$f" = "configs" ] && continue
    ln -snfv ${THIS_DIR}/"$f" ~
done

echo "fish系"
ln -sf ${THIS_DIR}/fish ~/.config/fish

echo "fishパッケージマネージャーfisherで管理されているもの"
ln -sf ${THIS_DIR}/fisher ~/.config/fisher

echo "スクリーンショット保存場所を変更"
mkdir ~/Pictures/Screenshots
defaults write com.apple.screencapture location ~/Pictures/Screenshots/;killall SystemUIServer

cat << END

**************************************************
DOTFILES SETUP FINISHED! bye.
**************************************************

END
