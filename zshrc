# History
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

# Some default options
setopt autocd extendedglob
unsetopt beep nomatch notify
bindkey -e

# The following lines were added by compinstall
zstyle :compinstall filename '/Users/henry/.zshrc'

autoload -Uz compinit
compinit

# show menu
zstyle ":completion:*" menu select
# Case insensitive
zstyle ":completion:*" matcher-list 'm:{a-z}={A-Za-z}'

autoload -Uz promptinit
promptinit
prompt redhat

# More natural text editing
autoload -U select-word-style
select-word-style bash

# Search when prefix is inserted
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end

# Default editor
export EDITOR=/opt/homebrew/bin/nvim

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Path to libs and includes for homebrew
export CPATH=/opt/homebrew/include
export LIBRARY_PATH=/opt/homebrew/lib
export DYLD_LIBRARY_PATH=/opt/homebrew/lib

# Personal scripts
export PATH=$PATH:~/.local/bin

# Go to personal scripts dir
function bins { cd ~/.local/bin }
# Go to config dir
function config { cd ~/.config }

# Be sure locale is utf8
export LANG=en_US.UTF-8

# Source aliases
[[ -f ~/.bash_aliases ]] && . ~/.bash_aliases

# Disable ctrl-s to freeze terminal.
stty stop undef

# rbenv
eval "$(rbenv init - zsh)"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# Go
export GOPATH="$(go env GOPATH)"
export PATH="${PATH}:${GOPATH}/bin"

# Solve <C-y> issues on MacOS
stty dsusp undef

# FZF utils
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Link emacs built from source
alias emacs="/Applications/Emacs.app/Contents/MacOS/Emacs"
export PATH="/Applications/Emacs.app/Contents/MacOS/bin:$PATH"

# Postgres
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"

# LLVM bins
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

# GNU tools
export PATH="/opt/homebrew/opt/libtool/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/gnu-indent/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/gpatch/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/gnu-tar/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/ed/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/grep/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/gsed/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/gawk/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/make/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/findutils/libexec/gnubin:$PATH"
alias which=/opt/homebrew/opt/gnu-which/libexec/gnubin/which
export PATH="/opt/homebrew/opt/bison/bin:$PATH"

export JAVA_HOME="/Library/Java/JavaVirtualMachines/temurin-24.jdk/Contents/Home"
export PATH="$JAVA_HOME/bin:$PATH"

# LaTeX classes
export TEXINPUTS=:/Users/henry/Notes/classes

# Kamal
kamal_staging () {
    ACCOUNT=$(op account get | head -n 1 | awk '{ print $2 }')              \
           DOCKER_REGISTRY_TOKEN=$(gpg -d ~/.gitlab/token.gpg 2>/dev/null)  \
           ENVIRONMENT=STAGING                                              \
           kamal $@ -d staging
}

kamal_production () {
    echo "\033[0;31mPRODUCTION ALERT !!\033[0m"
    read "reply?Are you sure? (Yy) "
    [[ ! $reply =~ ^[yY]$ ]] && return

    ACCOUNT=$(op account get | head -n 1 | awk '{ print $2 }')              \
           DOCKER_REGISTRY_TOKEN=$(gpg -d ~/.gitlab/token.gpg 2>/dev/null)  \
           ENVIRONMENT=PRODUCTION                                           \
           kamal $@ -d production
}


# Notes
function notes { cd ~/notes }
function inbox { vim ~/notes/inbox.txt }
function ttouch { touch $(date +%Y%m%d%H%M%S)-$1 }

# Load Angular CLI autocompletion.
source <(ng completion script)
