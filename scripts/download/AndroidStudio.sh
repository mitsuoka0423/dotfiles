#!/bin/zsh

cd ~/Downloads

echo 'Android Studio'


# ダウンロード
if [ -f ~/Downloads/android-studio-2023.1.1.27-mac_arm.dmg ]; then
  echo "File already exists, skipping download"
else
  wget 'https://redirector.gvt1.com/edgedl/android/studio/install/2023.1.1.27/android-studio-2023.1.1.27-mac_arm.dmg'
fi


# インストール
hdiutil mount android-studio-2023.1.1.27-mac_arm.dmg
cp -R -v '/Volumes/Android Studio - Hedgehog | 2023.1.1 Patch 1' /Applications


# お掃除
hdiutil detach '/Volumes/Android Studio - Hedgehog | 2023.1.1 Patch 1'
rm -f android-studio-2023.1.1.27-mac_arm.dmg

cd ~
