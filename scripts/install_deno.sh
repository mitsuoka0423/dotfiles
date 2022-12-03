#!/bin/zsh

curl -fsSL https://deno.land/x/install/install.sh | sh

echo '# deno' >> ~/.zshrc
echo 'export DENO_ROOT="$HOME/.deno"' >> ~/.zshrc
echo 'export PATH="$DENO_ROOT/bin:$PATH"' >> ~/.zshrc

source ~/.zshrc
