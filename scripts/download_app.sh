#!/bin/zsh

echo 'アプリをダウンロードします'

cd ~/Downloads





echo 'Google日本語入力'
wget https://dl.google.com/japanese-ime/latest/GoogleJapaneseInput.dmg
hdiutil mount GoogleJapaneseInput.dmg
open /Volumes/GoogleJapaneseInput/GoogleJapaneseInput.pkg
hdiutil detach /Volumes/GoogleJapaneseInput


sh ./download/Docker.sh


cd ~

cat << END

**************************************************
APP DOWNLOAD FINISHED!
**************************************************

END
