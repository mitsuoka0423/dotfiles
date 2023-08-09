#!/bin/zsh

FLUTTER_URL=https://storage.googleapis.com/flutter_infra_release/releases/stable/macos/flutter_macos_arm64_3.3.8-stable.zip

if [ ! -e {~/develop} ]; then
  mkdir ~/develop 
fi
cd ~/develop

sudo softwareupdate --install-rosetta --agree-to-license
wget ${FLUTTER_URL}
unzip ./flutter_macos_*-stable.zip
rm -f ./flutter_macos_*-stable.zip

echo '## flutter' >> ~/.zshrc
echo 'export PATH="$HOME/develop/flutter/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc

flutter doctor

cd ~
