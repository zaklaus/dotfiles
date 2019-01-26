plugins=(
  git
  k
)

export PATH=$HOME/bin:/usr/local/go/bin:/usr/local/bin:$HOME/go/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh
fortune -a
#ZSH_THEME="gnzh"

autoload -U colors && colors
#PS1="┌─┤%*│%{$fg_bold[green]%}%n%{$fg_no_bold[green]%}@%m:%{$fg_bold[blue]%}%~
#%{$reset_color%}└───╼ "
PS1="┭─┤%*│%{$fg_bold[green]%}%n%{$fg_bold[yellow]%}@%m:%{$fg_bold[blue]%}%~
%{$reset_color%}┵───╼ "
PS2="────╼ "
[ -n "$RANGER_LEVEL" ] && PS1="$PS1"'(in ranger) '

HISTFILE=~/.histfile
HISTSIZE=10240
SAVEHIST=10240000
setopt appendhistory
unsetopt beep
bindkey -e

zstyle ':completion:*' list-colors ''
zstyle ':completion:*' menu select=1
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle :compinstall filename '/home/zaklaus/.zshrc'

autoload -Uz compinit && compinit

# stuff

if [ -n "$DISPLAY" ]; then
        export BROWSER="firefox"
else 
        export BROWSER="elinks"
fi
export EDITOR="vim"
export GREP_COLORS="ms=00;33:mc=00;33"
#export IPLAYER_OUTDIR="/home/zaklaus/Media/Videos/TV Programmes/iPlayer/"
export MANPAGER="/bin/zsh -c \"col -bx | vim -c 'set ft=man' -\"" #http://www.reddit.com/r/vim/comments/23u4ly/what_other_apps_are_vimlike/ch0ykcy
export PAGER="/bin/vimpager"
export RANGER_LOAD_DEFAULT_RC="FALSE"

# git
alias gitp="git push"
alias gitpl="git pull"
alias gitom="git push origin master"
alias gitf="git fetch"
alias gits="git status"
alias gitch="git checkout $1"
alias gitd="git diff"
alias gitb="git branch"
alias gitr="git remote"
alias gitfc="gitf && gitch"
alias gita="git add"

function gitc {
    git add .
    if [ -z "$1" ]; then
        echo -n "Enter commit message: "
        read msg
        echo -n "Enter commit desc: "
        read desc
        git commit -m $msg -m $desc
    else
        git commit -m $1
    fi
}

function gitcp {
    gitc $1 $2 && gitp;
}

alias gitlg="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset by %an' --abbrev-commit --date=relative"

function mcd {
    mkdir $1 && cd $1;
}

function calc {
    echo "$@" | bc
}

transfer() { if [ $# -eq 0 ]; then echo -e "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"; return 1; fi
tmpfile=$( mktemp -t transferXXX ); if tty -s; then basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g'); curl --progress-bar --upload-file "$1" "https://transfer.sh/$basefile" >> $tmpfile; else curl --progress-bar --upload-file "-" "https://transfer.sh/$1" >> $tmpfile ; fi; cat $tmpfile; rm -f $tmpfile; } 

alias codedir="code . && exit"
alias cdl="codedir"
alias stby="xset dpms force standby"
alias jandroid="/opt/android-studio/bin/studio.sh &"
alias qqq="exit"
alias o2stat="vnstat -i enp7s0"
alias cls="clear"
alias nn="xdg-open"
alias nh="sudo xdg-open"
alias mapus="setxkbmap us && xmodmap -e 'keycode 135 = Super_R' && xset -r 135"
alias mapsk="setxkbmap -layout sk -variant qwerty && xmodmap -e 'keycode 135 = Super_R' && xset -r 135"

alias gitlg="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset by %an' --abbrev-commit --date=relative"

alias cp='cp -iv'                           # Preferred 'cp' implementation
alias mv='mv -iv'                           # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
alias ll='ls -FGlAhp'                       # Preferred 'ls' implementation
alias less='less -FSRXc'                    # Preferred 'less' implementation
lcd() { builtin cd "$@"; ll; }               # Always list directory contents upon 'cd'
alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias ~="cd ~"                              # ~:            Go Home
alias c='clear'                             # c:            Clear terminal display
alias cn='c; neofetch'			    # cn:	    Clear and display neofetch
alias path='echo -e ${PATH//:/\\n}'         # path:         Echo all executable Paths
alias vimgo='vim -u ~/.vimrc.go'
mcd () { mkdir -p "$1" && cd "$1"; }        # mcd:          Makes new Dir and jumps inside
alias subl=subl3
alias tvb='mpv --ytdl-format="bestvideo+bestaudio/best" $1'
alias tvm='mpv --ytdl-format="bestvideo[height<=?720]+bestaudio/best" $1'
alias tvh='mpv --ytdl-format="bestvideo[height<=?480]+bestaudio/best" $1'
alias tvp='mpv --ytdl-format="bestvideo[height<=?360]+bestaudio/best" $1'
ytm(){youtube-dl -f 'bestaudio[ext=m4a]' -o - "ytsearch:$*" | mpv -}
ytml(){youtube-dl -f 'bestaudio[ext=m4a]' -o - "$1" | mpv -}
ytmdl(){youtube-dl -f 'bestaudio[ext=m4a]' "ytsearch:$*"}
ytmdll(){youtube-dl -f 'bestaudio[ext=m4a]' "$1"}
ytv(){youtube-dl -o - "ytsearch:$*" | mpv -}
ytvdl(){youtube-dl "ytsearch:$*"}
yts(){CNT=$1; shift; youtube-dl -s --ignore-config --ignore-errors --skip-download --geo-bypass --youtube-skip-dash-manifest --get-id --get-title "ytsearch$CNT:$*" | sed '$!N;s/\n/ -- /'}
ytf(){youtube-dl -F "ytsearch:$*"}
tvx(){mpv --ytdl-format="$1" $2;}
tvd(){youtube-dl -F $1;}

fortune

source ~/mwapi.sh

# opam configuration
test -r /home/zaklaus/.opam/opam-init/init.zsh && . /home/zaklaus/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

