#!/bin/sh

# Use neovim for vim if present.
command -v nvim >/dev/null && alias vim="nvim" vimdiff="nvim -d"

# Custom Project Relative Bin Executables
#alias \
    px="./.venv/bin/python" \

# add this if were using laravel phpunit
# t="./vendor/bin/phpunit" \

##################################################
### Checking If Commands if Found in Our ENV $PATH
##################################################

# npm aliases
if [ -x "$(command -v npm)" ]; then
alias \
    lb="npm run build" \
    cms="npm run cms" \
    nls="npm run serve" \
    ;
fi

# netlify aliases
if [ -x "$(command -v netlify)" ]; then
alias \
    nb="netlify build --context=prod" \
    dev="netlify dev" \
    nd="netlify deploy --prod" \
    ;
fi

# hugo aliases
if [ -x "$(command -v hugo)" ]; then
alias \
    hhh="hugo server -s exampleSite --themesDir=../.. --disableFastRender" \
    htb="hugo -s exampleSite --gc --minify --themesDir ../.." \
    ;
fi

# rust alias
if [ -x "$(command -v cargo)" ]; then
alias \
    rs="cargo" \
    ;
fi

# vlang alias
if [ -x "$(command -v v)" ]; then
alias \
    vc="v run" \
    ;
fi

# youtube-viewer alias
if [ -x "$(command -v youtube-viewer)" ]; then
alias \
    YT="youtube-viewer" \
    ;
fi

# youtube-dl aliases
if [ -x "$(command -v youtube-dl)" ]; then
alias \
    yt="youtube-dl --add-metadata -i" \
    yt4="youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4'"
	yta="yt -x -f bestaudio/best --audio-format mp3" \
	;
fi

# This alias is important. It enables the `pauseallmpv` command.
if [ -x "$(command -v mpv)" ]; then
alias \
    mpv="mpv --input-ipc-server=/tmp/mpvsoc$(date +%s)" \
    ;
fi

# remove banner for videos
if [ -x "$(command -v ffmpeg)" ]; then
alias \
    ffmpeg="ffmpeg -hide_banner" \
    ;
fi

# neovim aliases
if [ -x "$(command -v nvim)" ]; then
alias \
    sv="sudo nvim" \
    ;
fi

# journal alias
if [ -x "$(command -v jrnl)" ]; then
alias \
    j=" jrnl" \
    ;
fi

# git aliases
#     gs="git status" \
#     important to remove dd alias if you need to use that command
if [ -x "$(command -v git)" ]; then
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
    	pus="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME push" \
    	com="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME commit" \
	diff="diff --color=auto" \
	;
fi

# Replacement for ls command aliases
if [ -x "$(command -v exa)" ]; then
alias \
    l="exa -l --color=always --group-directories-first" \
    ls="exa -D --color=always --group-directories-first" \
    ll="exa -l --color=always --group-directories-first" \
    la="exa -FSal --color=always --group-directories-first" \
    ;
else
    l="ls" \
    ls="ls -d */" \
    ll="ls -lh" \
    la="ls -la" \
fi

# Alternative to cat command
if [ -x "$(command -v bat)" ]; then
alias \
    b="bat" \
    ;
fi



################################################################
### Commands Here are Already Available in Our System by Default
################################################################


################################################################
### File Management Shortcuts
################################################################

alias \
    r="$FILE" \
	c="clear && pbcopy < /dev/null" \
	e="open" \
	grep="grep --color=auto" \
	cp="cp -iv" \
	mv="mv -iv" \
	mkd="mkdir -pv" \
	hsc="history -c" \
	path="echo -e ${PATH//:/\\\n}" \

################################################################
### Shortcuts for Handing File and Directory Permissions
################################################################

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
	perm="stat --printf '%a %n \n'" \

################################################################
### Shortcut for Encryptions
################################################################

# gpg encryption
# verify signature for isos
alias gpg-check="gpg2 --keyserver-options auto-key-retrieve --verify"
# receive the key of a developer
alias gpg-retrieve="gpg2 --keyserver-options auto-key-retrieve --receive-keys"

################################################################
### Youtube Downloaded Shortcuts
################################################################

alias yta-aac="youtube-dl --extract-audio --audio-format aac "
alias yta-best="youtube-dl --extract-audio --audio-format best "
alias yta-flac="youtube-dl --extract-audio --audio-format flac "
alias yta-m4a="youtube-dl --extract-audio --audio-format m4a "
alias yta-mp3="youtube-dl --extract-audio --audio-format mp3 "
alias yta-opus="youtube-dl --extract-audio --audio-format opus "
alias yta-vorbis="youtube-dl --extract-audio --audio-format vorbis "
alias yta-wav="youtube-dl --extract-audio --audio-format wav "
alias ytv-best="youtube-dl -f bestvideo+bestaudio "

# remove all swap file
alias rmswp='rm ~/.local/share/nvim/swap/*.swp'


################################################################
### Services shortcuts
################################################################

alias ios='open -a Simulator'
alias ibrew='arch -x86_64 /usr/local/bin/brew'
alias pgup='pg_ctl -D /opt/homebrew/var/postgres start'
alias pgdown='pg_ctl -D /opt/homebrew/var/postgres stop -s -m fast'
# default user in postgres is account name with no password
#alias pgauth='psql -h localhost'
# this alias is used by supabase
alias pgauth='psql -h localhost -d postgres -U postgres -W'
alias dbup='mysql.server start'
alias dbdown='mysql.server stop'
alias dbauth='mysql -u uriah -proot'
alias fpm='/opt/homebrew/opt/php/sbin/php-fpm --nodaemonize'
alias phpini='$EDITOR /opt/homebrew/etc/php/8.0/php.ini'
alias redisup='redis-server /opt/homebrew/etc/redis.conf'
alias redisdown='redis-cli shutdown'
alias tinker='php artisan tinker'

#alias python='python3'

################################################################
### Quick Shortcut Changing Directories
################################################################
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'


alias a="cd ~/Code && ls -a" \
h="cd ~/ && ls -a" \
d="cd ~/Documents && ls -a" \
dl="cd ~/Downloads && ls -a" \
m="cd ~/Music && ls -a" \
P="cd ~/Pictures && ls -a" \
cf="cd ~/.config && ls -a" \
sc="cd ~/.local/bin && ls -a" \
vsc="cd ~/Library/Application\ Support/Code/User" \



################################################################
### Quick Shortcut Editting Config Files
################################################################

alias cfa="$EDITOR ~/.config/aliasrc.sh" \
cfA="$EDITOR ~/.config/alacritty/alacritty.yml" \
cfk="$EDITOR ~/Library/Application\ Support/Code/User/keybindings.json" \
cfp="$EDITOR ~/.zprofile" \
cfs="$EDITOR ~/.config/starship/config.toml" \
cfv="$EDITOR ~/.config/nvim/init.vim" \
cfz="$EDITOR $HOME/.zshrc" \
etc="$EDITOR /etc/hosts" \
cfj="$EDITOR $HOME/.config/jrnl/jrnl.yaml" \
cfV="$EDITOR ~/Library/Application\ Support/Code/User/settings.json" \


################################################################
### Source Config Files Quickly
################################################################

alias rz='source $HOME/.zshrc' \
rp='source ~/.zprofile' \
ra='source ~/.config/aliasrc.sh' \
rz='source ~/.zshrc' \
zl='zq -l' \
shd='sudo ln -sf /bin/dash /var/select/sh' \
shb='sudo ln -sf /bin/bash /var/select/sh' \
cwd='pwd | pbcopy' \
f='.fvm/flutter_sdk/bin/flutter' \
fresh='php artisan migrate:fresh --seed' \
sail='bash vendor/bin/sail' \
ports='sudo lsof -i -P | grep LISTEN' \
php8='valet use php@8.0' \
php7='valet use php@7.4' \
#flutter='.fvm/flutter_sdk/bin/flutter'\
