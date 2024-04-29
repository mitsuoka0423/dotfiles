# dotfiles

## 初回セットアップ

### 1password on Safari

https://apps.apple.com/jp/app/1password-for-safari/id1569813296?mt=12

### git / Homebrew / GitHub

```bash
xcode-select --install

curl https://raw.githubusercontent.com/mitsuoka0423/dotfiles/master/scripts/install_homebrew_app.sh | sh

gh auth login
ghq get git@github.com:mitsuoka0423/dotfiles.git
```

### Nix / Home Manager

```bash
code  ~/ghq/github.com/mitsuoka0423/dotfiles
zsh ./scripts/install_nix.sh
zsh
zsh ./scripts/install_home_manager.sh
```

```bash
zsh ./scripts/install_home_manager.sh
```
