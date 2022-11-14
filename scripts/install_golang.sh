#!/bin/zsh

GO_VERSION=1.19.3

if [ ! -e {~/.goenv} ]; then
  git clone https://github.com/syndbg/goenv.git ~/.goenv

  echo 'export GOENV_ROOT="$HOME/.goenv"' >> ~/.zshrc
  echo 'export PATH="$GOENV_ROOT/bin:$PATH"' >> ~/.zshrc
  echo 'eval "$(goenv init -)"' >> ~/.zshrc
  echo 'export PATH="$GOROOT/bin:$PATH"' >> ~/.zshrc
  echo 'export PATH="$PATH:$GOPATH/bin"' >> ~/.zshrc
fi

goenv -v
goenv install -f ${GO_VERSION}
goenv global ${GO_VERSION}

go version

cd ~
