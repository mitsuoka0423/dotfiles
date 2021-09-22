#!/bin/bash

echo 'アプリをダウンロードします'

cd ~/Downloads

echo 'Alfred 4'
wget https://cachefly.alfredapp.com/Alfred_4.5.1_1256.dmg
hdiutil mount Alfred_4.5.1_1256.dmg
cp -r /Volumes/Alfred/Alfred\ 4.app /Applications
hdiutil detach /Volumes/Alfred
