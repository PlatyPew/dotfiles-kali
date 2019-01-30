# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/root/.oh-my-zsh"
export VIRTUAL_ENV_DISABLE_PROMPT=1

ZSH_THEME="agnoster-custom"
DISABLE_UNTRACKED_FILES_DIRTY="true"
DISABLE_UPDATE_PROMPT="true"
HIST_STAMPS="mm/dd/yyyy"

plugins=(
    git
    zsh-completions
    zsh-syntax-highlighting
    colored-man-pages
    vi-mode
    web-search
    sudo
    tmux
    extract
)

source $ZSH/oh-my-zsh.sh

## Syntax highlighting configs
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
ZSH_HIGHLIGHT_STYLES[arg0]='fg=10,bold'
ZSH_HIGHLIGHT_STYLES[redirection]='fg=44,bold'
ZSH_HIGHLIGHT_STYLES[globbing]='fg=81,bold'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=226,bold'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=226,bold'
ZSH_HIGHLIGHT_STYLES[path_pathseparator]='fg=white'
ZSH_HIGHLIGHT_STYLES[path]='fg=117'
ZSH_HIGHLIGHT_STYLES[assign]='fg=192,bold'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=201,bold'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=220,bold'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=220,bold'

# User configuration

export MANPATH="/usr/local/man:$MANPATH"
export LANG=en_US.UTF-8
export ARCHFLAGS="-arch x86_64"
export TERM="xterm-256color"
if [[ ! -z $TMUX ]] then
    export TERM="screen-256color"
fi
VISUAL=nvim;
export VISUAL EDITOR=nvim
export EDITOR

# Gets weather updates from online
weather() {
    "sed '38,39d' <(curl -s wttr.in/${1})"
}

# Gets current ip
getip() {
    dig TXT +short o-o.myaddr.l.google.com @ns1.google.com | awk -F'"' '{ print $2}'
}

# Fixes lock screen background images
fixlock() {
    if [[ -z ${1} ]]; then
        echo "You need to supply an image"
    else
        ~/.dotfiles/configs/i3/betterlockscreen -u ${1}
    fi

}

# Python related stuff
ve() {
    if [[ -z ${VIRTUAL_ENV} ]]; then
        if [[ ! -d venv ]]; then
            virtualenv -p python3 venv
            source venv/bin/activate
            pip3 install --upgrade neovim
        else
            source venv/bin/activate
        fi
    else
        echo "You are already in a virtual environment"
        return 1
    fi
}

howdafak() {
    if [ -z ${1} ]; then
        echo "Usage:    ${0} [-l] <topic> [query]"
        echo "Example:  ${0} c \"get string length\""
        echo "          ${0} python \"~file\" # Uses keyword \"file\""
        echo "          ${0} -l # Shows list of all topics"
        return 1
    elif [ ${1} = "-l" ]; then
        curl -s "https://cht.sh/:list" | grep -v '[/:]' | xargs -s 100 | tr " " "\t"
    else
        topic=${1}
        shift
        time curl -s "https://cht.sh/${topic}/${*}/i"
    fi
}

alias de='deactivate'

alias pipr='pip install -r requirements.txt'
alias pipr3='pip3 install -r requirements.txt'

# Split screen in Neovim
alias vi='nvim -O'

# Lazy to write commit messages solver
alias yolo='git commit -m "$(curl -s https://whatthecommit.com/index.txt)"'

# Runs rice related stuff
alias f='ranger'
alias s='rofi -modi run -show run -theme ~/.config/rofi/solarized-darker.rasi'

# Better searching in command mode
bindkey -M vicmd '?' history-incremental-search-backward
bindkey -M vicmd '/' history-incremental-search-forward

# Beginning search with arrow keys
bindkey "^[OA" up-line-or-beginning-search
bindkey "^[OB" down-line-or-beginning-search
bindkey -M vicmd "k" up-line-or-beginning-search
bindkey -M vicmd "j" down-line-or-beginning-search
