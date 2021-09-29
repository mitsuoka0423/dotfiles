#!/bin/zsh

echo 'アプリをダウンロードします'

cd ~/Downloads

echo 'Alfred 4'
wget https://cachefly.alfredapp.com/Alfred_4.5.1_1256.dmg
hdiutil mount Alfred_4.5.1_1256.dmg
cp -r /Volumes/Alfred/Alfred\ 4.app /Applications
hdiutil detach /Volumes/Alfred

echo 'Tor browser'
wget https://www.torproject.org/dist/torbrowser/10.5.6/TorBrowser-10.5.6-osx64_en-US.dmg
hdiutil mount TorBrowser-10.5.6-osx64_en-US.dmg
cp -r /Volumes/Tor\ Browser/Tor\ Browser.app /Applications
hdiutil detach /Volumes/Tor\ Browser

echo 'Stack'
wget https://binaries.getstack.app/builds/prod/Stack-3.36.1.dmg
hdiutil mount Stack-3.36.1.dmg
cp -r /Volumes/Stack\ 3.36.1/Stack.app /Applications
hdiutil detach /Volumes/Stack\ 3.36.

echo 'Google日本語入力'
wget https://dl.google.com/japanese-ime/latest/GoogleJapaneseInput.dmg
hdiutil mount GoogleJapaneseInput.dmg
open /Volumes/GoogleJapaneseInput/GoogleJapaneseInput.pkg
hdiutil detach /Volumes/GoogleJapaneseInput

cat << END

**************************************************
APP DOWNLOAD FINISHED!
**************************************************

END
