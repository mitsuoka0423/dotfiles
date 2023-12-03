#!/bin/zsh

# さきにApp storeにログインしておく
echo "App Store にログインしてください"
echo "ログインできたら、Enter キーを押してください"
open /System/Applications/App\ Store.app
read

### homebrew
echo "homebrewをインストールしています"
which brew >/dev/null 2>&1 || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

echo "brew doctorを実行しています"
which brew >/dev/null 2>&1 && brew doctor

echo "run brew updateを行います"
which brew >/dev/null 2>&1 && brew update --verbose

echo "homebrew周りの設定が終了しました"

### .Brewfileに記載されているアプリをインストール
echo ".Brewfileに記載されているアプリをインストールします"
brew bundle --global --verbose
