#!/bin/zsh

# さきにApp storeにログインしておく
echo "App Store にログインしてください"
echo "ログインできたら、Enter キーを押してください"
open /System/Applications/App\ Store.app
read

### homebrew
echo "homebrewをインストールしています"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"

echo "brew doctorを実行しています"
which brew >/dev/null 2>&1 && brew doctor

echo "run brew updateを行います"
which brew >/dev/null 2>&1 && brew update --verbose

echo "homebrew周りの設定が終了しました"

### アプリをインストール
echo "アプリをインストールします"
brew tap "homebrew/bundle"

brew install fzf
brew install ghq
brew install jj
brew install mas
brew install tree
brew install wget

brew install --cask 1password
brew install --cask arc
brew install --cask authy
brew install --cask brave-browser
brew install --cask cursor
brew install --cask docker
brew install --cask google-chrome
brew install --cask karabiner-elements
brew install --cask notion-calendar
brew install --cask obs
brew install --cask raycast
brew install --cask spotify
brew install --cask visual-studio-code
brew install --cask warp

mas install 549083868 # Display menu
mas install 539883307 # Line
mas install 540348655 # Monosnap