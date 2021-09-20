#!/bin/bash

set -u

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

cat << END

**************************************************
DOTFILES SETUP FINISHED! bye.
**************************************************

END
