export EDITOR="nvim"
export FILE="ranger"
export PASSWORD_STORE_DIR="$HOME/.password-store"
export PASSWORD_STORE_CLIP_TIME=45
# homebrew for mac m1 paths
eval "$(/opt/homebrew/bin/brew shellenv)"

# dart specific paths when using FVM
export PATH="$HOME/fvm/default/bin":$PATH
export PATH="$PATH":"$HOME/.pub-cache/bin"

# To use Android SDK Commandline tools add the ff. paths
export PATH="$PATH":"$HOME/Library/Android/sdk/platform-tools"
export PATH="$PATH":"$HOME/Library/Android/sdk/tools/bin"

# this will add all our rust / cargo app in path
#export PATH="$PATH":"$HOME/.cargo/bin"
source $HOME/.cargo/env
# this will add the brew x86_64 programs in our path
export PATH="$PATH":"/usr/local/bin"
