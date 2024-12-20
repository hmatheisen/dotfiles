ZSH_THEME="simple" # set by `omz`

# Zsh plugins
plugins=(git)
# Path to your oh-my-zsh installation.
export ZSH="/Users/henry/.oh-my-zsh"
# source oh-my-zsh
source $ZSH/oh-my-zsh.sh
export ZSH_THEME=simple

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
function bins() { cd ~/.local/bin }
# Go to config dir
function config() { cd ~/.config }

# Open journal
function journal() { $EDITOR ~/Notes/journal.txt }

# Be sure locale is utf8
export LANG=en_US.UTF-8

# Source aliases
[[ -f ~/.bash_aliases ]] && . ~/.bash_aliases

# Disable ctrl-s to freeze terminal.
stty stop undef

# Java
export PATH="/Library/Java/JavaVirtualMachines/temurin-17.jdk/Contents/Home/bin:$PATH"

# rbenv
eval "$(rbenv init - zsh)"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Go
export GOPATH="$(go env GOPATH)"
export PATH="${PATH}:${GOPATH}/bin"

# Solve <C-y> issues on MacOS
stty dsusp undef

# FZF utils
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Postgres
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"

# LLVM bins
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

# LaTeX classes
export TEXINPUTS=:/Users/henry/Notes/classes
