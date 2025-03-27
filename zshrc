# -*- mode: sh -*-
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

# LaTeX classes
export TEXINPUTS=:/Users/henry/Notes/classes
