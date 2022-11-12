#!/bin/zsh

FLUTTER_URL=https://storage.googleapis.com/flutter_infra_release/releases/stable/macos/flutter_macos_arm64_3.3.8-stable.zip

cd ~/Downloads

sudo softwareupdate --install-rosetta --agree-to-license
wget ${FLUTTER_URL}
unzip ~/Downloads/flutter_macos_*-stable.zip
export PATH="$PATH:`pwd`/flutter/bin"
flutter doctor

cd ~