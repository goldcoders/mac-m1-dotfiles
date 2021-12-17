# check directory
# use proper dart binary
if [[ ${DARTBIN} == 'dart' ]]; then
 export PATH="$PATH:$HOME/fvm/default/bin"
 else
 export PATH="$HOME/fvm/default/bin:$PATH"
fi
export PATH="$HOME/.pub-cache/bin":"$PATH"

if [[ ! -d $ZSH_CACHE_DIR ]]; then
    mkdir -pv $ZSH_CACHE_DIR
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

plugins=(
#  alias-finder
  fast-syntax-highlighting
  zsh-autosuggestions
  zsh-completions
  zoxide
#  command-not-found
)

## This Should Comes Before Plugins
## brew install oh-my-zsh
source $ZSH/oh-my-zsh.sh

COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
HISTSIZE=10000000
SAVEHIST=10000000


# HISTORY config
setopt extended_history         # Also record time and duration of commands.
setopt hist_expire_dups_first   # Clear duplicates when trimming internal hist.
setopt hist_find_no_dups        # Dont display duplicates during searches.
setopt hist_ignore_dups         # Ignore consecutive duplicates.
setopt hist_ignore_all_dups     # Remember only one unique copy of the command.
setopt hist_reduce_blanks       # Remove superfluous blanks.
setopt hist_save_no_dups        # Omit older commands in favor of newer ones.
setopt hist_ignore_space        # Ignore commands that start with space.
setopt inc_append_history       # immediate append ,ensures commands are added to history immediately

setopt autocd		# Automatically cd into typed directory.
stty stop undef		# Disable ctrl-s to freeze terminal.


if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:/opt/homebrew/share/zsh/site-functions:$FPATH
    autoload -Uz compinit
    compinit
fi

zstyle ':completion:*' menu select
zmodload zsh/complist

# Include hidden files in autocomplete:
_comp_options+=(globdots)

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'

  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select

zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init

# Use beam shape cursor on startup.
echo -ne '\e[5 q'
# Use beam shape cursor for each new prompt.
preexec() { echo -ne '\e[5 q' ;}

# Use lf to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        if [ -d "$dir" ]; then
            if [ "$dir" != "$(pwd)" ]; then
                cd "$dir"
            fi
        fi
    fi
}

# Easily Navigate
bindkey -s '^o' 'lfcd\n'


# Edit line in vim with ctrl-e
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Expand All Aliases when pressing spacebar
function expand-alias() {
zle _expand_alias
zle self-insert
}

zle -N expand-alias
bindkey -M main ' ' expand-alias



# Added for pyenv
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
eval "$(fnm env)"
eval "$(starship init zsh)"


function dartbin(){
    if [[ ${DARTBIN} == 'dart' ]]; then
    sed -i -e "s/^export DARTBIN=\"dart\"$/export DARTBIN=\"flutter\"/" ~/.zprofile
    else
    sed -i -e "s/^export DARTBIN=\"flutter\"$/export DARTBIN=\"dart\"/" ~/.zprofile
    fi
    source ~/.zprofile
}

function glt() {
  curl --silent "https://api.github.com/repos/$1/releases/latest" | # Get latest release from GitHub api
    grep '"tag_name":' |                                            # Get tag line
    sed -E 's/.*"([^"]+)".*/\1/'                                    # Pluck JSON value
}


source "$HOME/.config/aliasrc.sh"
#export PATH="/opt/homebrew/opt/node@14/bin:$PATH"
# https://stackoverflow.com/questions/44803721/how-to-brew-install-specific-version-of-node

# Generated for envman. Do not edit.
#[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
