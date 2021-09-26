#!/bin/bash

echo "ssh-keygen -t ed25519 -C "mono0423@gmail.com""
ssh-keygen -t ed25519 -C "mono0423@gmail.com"

echo "ssh-agentに鍵を登録しています..."
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

echo "公開鍵を登録してください"
echo "GitHubを開くには、エンターを押してください"
read
pbcopy < ~/.ssh/id_ed25519.pub
open https://github.com/settings/keys

echo "公開鍵の登録が終わったらエンターを押してください"
read