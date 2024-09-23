# dotfiles

## 初回セットアップ

### 1password on Safari

https://apps.apple.com/jp/app/1password-for-safari/id1569813296?mt=12

### git

```bash
xcode-select --install
```

### Homebrew

```bash
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

brew install azure-cli
brew install cloudflared
brew install fzf
brew install gh
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
brew install --cask deepl
brew install --cask discord
brew install --cask devtunnel
brew install --cask docker
brew install --cask google-chrome
brew install --cask karabiner-elements
brew install --cask notion-calendar
brew install --cask obs
brew install --cask raycast
brew install --cask spotify
brew install --cask visual-studio-code
brew install --cask warp
brew install --cask zed

echo "Display menu" && mas install 549083868
echo "Flow" && mas install 1423210932
echo "Hyper Cursor" && mas install 1634220679
echo "LINE" && mas install 539883307
echo "Monosnap" && mas install 540348655
```

### GitHub

```bash
gh auth login
ghq get git@github.com:mitsuoka0423/dotfiles.git
```

### Nix / Home Manager

```bash
code  ~/ghq/github.com/mitsuoka0423/dotfiles
zsh ./scripts/install_nix.sh
zsh
```

```bash
zsh ./scripts/install_home_manager.sh
make switch
```
