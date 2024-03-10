#!/bin/zsh

wget --directory-prefix="$HOME/Downloads" https://github.com/JetBrains/JetBrainsMono/releases/download/v2.304/JetBrainsMono-2.304.zip
unzip -o "$HOME/Downloads/JetBrainsMono-2.304.zip" -d "$HOME/Downloads/JetBrainsMono-2.304"
cp $HOME/Downloads/JetBrainsMono-2.304/fonts/ttf/* $HOME/Library/fonts
