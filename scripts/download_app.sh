#!/bin/zsh

echo 'アプリをダウンロードします'

cd ~/Downloads


echo 'Android Studio'
wget https://redirector.gvt1.com/edgedl/android/studio/install/2021.3.1.17/android-studio-2021.3.1.17-mac_arm.dmg
hdiutil mount android-studio-2021.3.1.17-mac_arm.dmg
cp -R /Volumes/Android\ Studio\ -\ Dolphin\ \|\ 2021.3.1\ Patch\ 1/Android\ Studio.app /Applications
hdiutil detach /Volumes/Android\ Studio\ -\ Dolphin\ \|\ 2021.3.1\ Patch\ 1


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
