#!/bin/zsh

set -u

echo "SSHキーを生成しています..."
zsh ./scripts/generate_sshkey.sh

### 不可視ファイルを可視化する(再起動したら見える)
echo "不可視ファイルを可視化します..."
defaults write com.apple.finder AppleShowAllFiles TRUE

echo "スクリーンショット保存場所を変更しています..."
mkdir ~/Screenshots
defaults write com.apple.screencapture location ~/Screenshots/;killall SystemUIServer

### Command Line Tools
echo "Command Line Tools for Xcodeのインストールをします"
xcode-select --install

echo "開発に必要なツールをインストールしています..."
zsh ./scripts/install_volta.sh
zsh ./scripts/install_cargo.sh
zsh ./scripts/install_flutter.sh
zsh ./scripts/install_golang.sh
zsh ./scripts/install_homebrew_app.sh
zsh ./scripts/download_app.sh

echo "dotfileにシンボリックリンクを設定しています..."
zsh ./scripts/generate_symbolic_link.sh

cat << END

**************************************************
DOTFILES SETUP FINISHED! bye.
**************************************************

END
