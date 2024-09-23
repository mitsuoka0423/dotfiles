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
make
```
