#!/bin/zsh

set -u

# 不可視ファイルを可視化する(再起動したら見える)
echo "不可視ファイルを可視化します..."
defaults write com.apple.finder AppleShowAllFiles TRUE

echo "スクリーンショット保存場所を変更しています..."
mkdir ~/Screenshots
defaults write com.apple.screencapture location ~/Screenshots/;killall SystemUIServer

echo "dotfileにシンボリックリンクを設定しています..."
zsh ./scripts/generate_symbolic_link.sh

echo "開発に必要なツールをインストールしています..."
zsh ./scripts/download_app.sh

cat << END

**************************************************
DOTFILES SETUP FINISHED! bye.
**************************************************

END
