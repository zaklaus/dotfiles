# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/go/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/zaklaus/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="gnzh"

# Set the prompt
autoload -U colors && colors
#PS1="┌─┤%*│%{$fg_bold[green]%}%n%{$fg_no_bold[green]%}@%m:%{$fg_bold[blue]%}%~
#%{$reset_color%}└───╼ "
PS1="┭─┤%*│%{$fg_bold[green]%}%n%{$fg_bold[yellow]%}@%m:%{$fg_bold[blue]%}%~
%{$reset_color%}┵───╼ "
PS2="────╼ "
[ -n "$RANGER_LEVEL" ] && PS1="$PS1"'(in ranger) '

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

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
alias path='echo -e ${PATH//:/\\n}'         # path:         Echo all executable Paths
alias vimgo='vim -u ~/.vimrc.go'
mcd () { mkdir -p "$1" && cd "$1"; }        # mcd:          Makes new Dir and jumps inside
alias subl=subl3
alias tvb='mpv --ytdl-format="bestvideo+bestaudio/best" $1'
alias tvm='mpv --ytdl-format="bestvideo[height<=?720]+bestaudio/best" $1'
alias tvh='mpv --ytdl-format="bestvideo[height<=?480]+bestaudio/best" $1'
alias tvp='mpv --ytdl-format="bestvideo[height<=?360]+bestaudio/best" $1'
ytm(){youtube-dl -f 'bestaudio[ext=m4a]' -o - "ytsearch:$*" | mpv -}
ytv(){youtube-dl -o - "ytsearch:$*" | mpv -}
tvx(){mpv --ytdl-format="$1" $2;}
tvd(){youtube-dl -F $1;}

fortune

source ~/mwapi.sh

# opam configuration
test -r /home/zaklaus/.opam/opam-init/init.zsh && . /home/zaklaus/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
