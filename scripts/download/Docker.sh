#!/bin/zsh

cd ~/Downloads


echo 'Docker Desktop'
wget https://desktop.docker.com/mac/main/arm64/Docker.dmg
sudo hdiutil attach Docker.dmg
sudo /Volumes/Docker/Docker.app/Contents/MacOS/install --accept-license --user=$(whoami)
sudo hdiutil detach /Volumes/Docker


cd ~
