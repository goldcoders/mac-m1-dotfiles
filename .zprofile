export EDITOR="nvim"
export FILE="ranger"
export PASSWORD_STORE_DIR="$HOME/.password-store"
export PASSWORD_STORE_CLIP_TIME=45

export ANDROID_HOME=~/Library/Android/sdk
export ANDROID_SDK_ROOT=~/Library/Android/sdk
export ANDROID_AVD_HOME=~/.android/avd
export CARGO_NET_GIT_FETCH_WITH_CLI=true

# homebrew for mac m1 paths
eval "$(/opt/homebrew/bin/brew shellenv)"

# dart specific paths when using FVM
export PATH="$PATH":"$HOME/.pub-cache/bin"
export PATH="$PATH":"$HOME/fvm/default/bin"

# To use Android SDK Commandline tools add the ff. paths
export PATH="$PATH":"$HOME/Library/Android/sdk/platform-tools"
export PATH="$PATH":"$HOME/Library/Android/sdk/tools/bin"
export PATH="$PATH":"$HOME/Library/Android/sdk/emulator"
export PATH="$PATH":"$HOME/.composer/vendor/bin"
export PATH="$PATH":"$HOME/go/bin"

# this will add all our rust / cargo app in path
#export PATH="$PATH":"$HOME/.cargo/bin"
source $HOME/.cargo/env
# this will add the brew x86_64 programs in our path
export PATH="$PATH":"/usr/local/bin"
