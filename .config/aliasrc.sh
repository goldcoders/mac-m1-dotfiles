#!/bin/sh

# Use neovim for vim if present.
command -v nvim >/dev/null && alias vim="nvim" vimdiff="nvim -d"

# Easy Change Default Shell
alias \
    shd='sudo ln -sf /bin/dash /var/select/sh' \
    shb='sudo ln -sf /bin/bash /var/select/sh' \
    shz='sudo ln -sf /bin/zsh /var/select/sh' \
    ;
# Media
alias \
    ffmpeg="ffmpeg -hide_banner" \
    mpv="mpv --input-ipc-server=/tmp/mpvsoc$(date +%s)" \
    mp3="ncmpcpp" \
    mp3="ncmpcpp" \
    yt="youtube-dl --add-metadata -i" \
    yt4="youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4'" \
    yta="yt -x -f bestaudio/best --audio-format mp3" \
    ;
# Git
alias \
    g="git" \
    gl="git log --all --decorate --oneline --graph" \
    gdif="git diff" \
    gr="git restore" \
    gcm="git commit -am" \
    gaa="git add ." \
    ss="git status" \
    ginit="git init && git add . && git commit -m 'init'" \
    nah="git reset --hard;git clean -df" \
    wip="git add . && git commit -m 'wip'" \
    dot="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME add" \
    dots="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME status" \
    dif="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME diff" \
    dop="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME push" \
    com="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME commit" \
    sdif="sudo nvim -d" \
    diff="nvim -d" \
    gcs='git clone --depth 1 --filter=blob:none --sparse' \
    ;

# Common Utils

alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

alias \
    l="exa -l --color=always --group-directories-first" \
    ls="exa -D --color=always --group-directories-first" \
    ll="exa -l --color=always --group-directories-first" \
    la="exa -FSal --color=always --group-directories-first" \
    r="$FILE" \
    b="bat" \
    c="clear && pbcopy < /dev/null" \
    e="open" \
    grep="grep --color=auto" \
    cp="cp -iv" \
    mv="mv -iv" \
    mkd="mkdir -pv" \
    cwd='pwd | pbcopy' \
    hsc="history -c" \
    path="echo -e ${PATH//:/\\\n}" \
;

alias \
    chx="chmod +x" \
    chax="sudo chmod a+x" \
    000="sudo chmod 000" \
    555="sudo chmod 555" \
    600="sudo chmod 600" \
    644="sudo chmod 644" \
    750="sudo chmod 750" \
    755="sudo chmod 755" \
    775="sudo chmod 775" \
    777="sudo chmod 777" \
    mine="sudo chown -R $(whoami)" \
    root="sudo su -" \
    iroot="sudo chown -R root" \
    perm="stat -f '%Lp'" \
    ;


# gpg encryption
# verify signature for isos
alias gpg-check="gpg2 --keyserver-options auto-key-retrieve --verify"
# receive the key of a developer
alias gpg-retrieve="gpg2 --keyserver-options auto-key-retrieve --receive-keys"

alias \
    yta-aac="youtube-dl --extract-audio --audio-format aac " \
    yta-best="youtube-dl --extract-audio --audio-format best " \
    yta-flac="youtube-dl --extract-audio --audio-format flac " \
    yta-m4a="youtube-dl --extract-audio --audio-format m4a " \
    yta-mp3="youtube-dl --extract-audio --audio-format mp3 " \
    yta-opus="youtube-dl --extract-audio --audio-format opus " \
    yta-vorbis="youtube-dl --extract-audio --audio-format vorbis " \
    yta-wav="youtube-dl --extract-audio --audio-format wav " \
    ytv-best="youtube-dl -f bestvideo+bestaudio " \
    ;


################################################################
### File Navigation
################################################################
alias \
    h="cd ~/ && ls -a" \
    d="cd ~/Documents && ls -a" \
    dl="cd ~/Downloads && ls -a" \
    m="cd ~/Music && ls -a" \
    P="cd ~/Pictures && ls -a" \
    cf="cd ~/.config && ls -a" \
    sc="cd ~/.local/bin && ls -a" \
    vsc="cd ~/Library/Application\ Support/Code/User" \
    ;

################################################################
### Quick Shortcut Editting Config Files
################################################################

alias \
    cfa="$EDITOR ~/.config/aliasrc.sh" \
    cfA="$EDITOR ~/.config/alacritty/alacritty.yml" \
    cfk="$EDITOR ~/Library/Application\ Support/Code/User/keybindings.json" \
    cfp="$EDITOR ~/.zprofile" \
    cfs="$EDITOR ~/.config/starship/config.toml" \
    cfv="$EDITOR ~/.config/nvim/init.vim" \
    cfr="$EDITOR ~/.config/ranger/rifle.conf" \
    cfz="$EDITOR $HOME/.zshrc" \
    etc="$EDITOR /etc/hosts" \
    cfj="$EDITOR $HOME/.config/jrnl/jrnl.yaml" \
    cfV="$EDITOR ~/Library/Application\ Support/Code/User/settings.json" \
    cfm="$EDITOR ~/.config/ncmpcpp/config" \
    cfM="$EDITOR ~/.config/ncmpcpp/bindings" \
    cft="$EDITOR ~/.tmux.conf" \
    ;

################################################################
### Source Config Files Quickly
################################################################

alias \
    rz='source $HOME/.zshrc' \
    rp='source ~/.zprofile' \
    ra='source ~/.config/aliasrc.sh' \
    rz='source ~/.zshrc' \
    rv='source ~/.config/nvim/init.vim' \
    rt="tmux source-file ~/.tmux.conf" \
    ;


################################################################
### Project Specific Aliases
################################################################
alias \
    f='.fvm/flutter_sdk/bin/flutter' \
    ports='sudo lsof -i -P | grep LISTEN' \
    php8='valet use php@8.0' \
    php7='valet use php@7.4' \
    macos='open macos/Runner.xcworkspace' \
    ios='open ios/Runner.xcworkspace' \
    rmswp='rm ~/.local/share/nvim/swap/*.swp' \
    sim='open -a Simulator' \
    ibrew='arch -x86_64 /usr/local/bin/brew' \
    pgup='pg_ctl -D /opt/homebrew/var/postgres start' \
    pgdown='pg_ctl -D /opt/homebrew/var/postgres stop -s -m fast' \
    pgauth='psql -h localhost -d postgres -U postgres -W' \
    dbup='mysql.server start' \
    dbdown='mysql.server stop' \
    dbauth='mysql -u uriah -proot' \
    fpm='/opt/homebrew/opt/php/sbin/php-fpm --nodaemonize' \
    phpini='$EDITOR /opt/homebrew/etc/php/8.0/php.ini' \
    phpini7='$EDITOR /opt/homebrew/etc/php/7.4/php.ini' \
    redisup='redis-server /opt/homebrew/etc/redis.conf' \
    redisdown='redis-cli shutdown' \
    px="./.venv/bin/python" \
    ;

# default user in postgres is account name with no password
#alias pgauth='psql -h localhost'
# this alias is used by supabase
