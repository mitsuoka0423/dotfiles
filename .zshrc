# scripts
eval "$(ssh-agent -s)"
ssh-add --apple-use-keychain


# alias
alias android='open -na "/Applications/Android Studio.app" --args'
alias g='echo $(ghq root)/$(ghq list | peco)'
alias a='android $(g)'
alias c='code $(g)'
alias cu='cursor $(g)'


# path

## homebrew
export PATH=/opt/homebrew/Cellar/fish/3.3.1/bin:$PATH

## proto
export PROTO_ROOT="$HOME/.proto"
export PATH="$PROTO_ROOT/bin:$PATH"

## android ndk
export ANDROID_NDK_HOME="$HOME/Library/Android/sdk/ndk-bundle"
export PATH="$ANDROID_NDK_HOME:$PATH"

## java sdk
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_202.jdk/Contents/Home"
export PATH="$JAVA_HOME/bin:$PATH"

## flutter
export PATH="$HOME/develop/flutter/bin:$PATH"
