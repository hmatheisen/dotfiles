# ZSH SETTINGS #

# History
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

# Some default options
setopt autocd extendedglob
unsetopt beep nomatch notify
bindkey -e

# Completion
zstyle :compinstall filename '/Users/henry/.zshrc'
fpath=($HOME/.zsh-complete $fpath)
autoload -Uz compinit
compinit

# show menu
zstyle ":completion:*" menu select
# Case insensitive
zstyle ":completion:*" matcher-list 'm:{a-z}={A-Za-z}'
# Somehow S-Tab is not bound by default
bindkey '^[[Z' reverse-menu-complete

# Simple prompt with VCS
autoload -Uz vcs_info
precmd() { vcs_info; }
zstyle ':vcs_info:git:*' formats '%b'
setopt PROMPT_SUBST

PROMPT='%~ $ '
RPROMPT='${vcs_info_msg_0_}'

# More natural text editing
autoload -U select-word-style
select-word-style bash

# Search when prefix is inserted
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end

# Solve <C-y> issues on MacOS
stty dsusp undef

# Disable ctrl-s to freeze terminal.
stty stop undef

# ENV VARS #
# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Default editor
export EDITOR=/opt/homebrew/bin/nvim

# Path to libs and includes for homebrew
export CPATH=/opt/homebrew/include
export LIBRARY_PATH=/opt/homebrew/lib
export DYLD_LIBRARY_PATH=/opt/homebrew/lib

# Personal scripts
export PATH=$PATH:~/.local/bin

# Be sure locale is utf8
export LANG=en_US.UTF-8

# Go
export GOPATH="$(go env GOPATH)"
export PATH="${PATH}:${GOPATH}/bin"

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
export PATH="/opt/homebrew/opt/gnu-which/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/bison/bin:$PATH"

# LaTeX classes
export TEXINPUTS=:/Users/henry/Notes/classes

# LLVM
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"
export CXX="/opt/homebrew/opt/llvm/bin/clang++"
export CC="/opt/homebrew/opt/llvm/bin/clang"
export CMAKE_PREFIX_PATH="/opt/homebrew/opt/llvm"

# Emacs
export PATH="/Applications/Emacs.app/Contents/MacOS/bin:$PATH"

# Ruby SSL issues
export RUBY_OPENSSL_CERT_DIR=/opt/homebrew/opt/openssl@3/certs
export SSL_CERT_FILE=/opt/homebrew/opt/openssl@3/cert.pem

# rbenv
eval "$(rbenv init - zsh)"

# Lazy version of NVM since it takes ages to startup
# _load_nvm() {
#   unset -f nvm node npm
#
#   export NVM_DIR="$HOME/.nvm"
#   [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
#   [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
# }
#
# nvm() {
#   _load_nvm
#   nvm $@
# }
#
# node() {
#   _load_nvm
#   node $@
# }
#
# npm() {
#   _load_nvm
#   npm $@
# }

# FUNCTIONS #

kamal_staging() {
  ACCOUNT=$(op account get | head -n 1 | awk '{ print $2 }') \
  DOCKER_REGISTRY_TOKEN=$(security find-generic-password -a ${USER} -s gitlab-api-token -w) \
  ENVIRONMENT=STAGING \
    kamal $@ -d staging
}

kamal_production() {
  echo "\033[0;31mPRODUCTION ALERT !!\033[0m"
  read "reply?Are you sure? (yY): "
  [[ ! $reply =~ ^[yY]$ ]] && return

  ACCOUNT=$(op account get | head -n 1 | awk '{ print $2 }') \
  DOCKER_REGISTRY_TOKEN=$(security find-generic-password -a ${USER} -s gitlab-api-token -w) \
  ENVIRONMENT=PRODUCTION \
    kamal $@ -d production
}

# Go to personal scripts dir
bins() { cd ~/.local/bin; }
# Go to config dir
config() { cd ~/.config; }

# Notes
notes() { cd ~/Notes; }
inbox() { nvim ~/Notes/inbox.txt; }
ttouch() {
  if [[ -z $1 ]]; then
    echo "ttouch: must provide 1 path argument" 1>&2
    return 1
  fi

  local dir=$(dirname $1)
  local filename=$(basename $1)
  local new_filename=$(date +%Y-%m-%d-%H%M%S)-$filename

  touch $dir/$new_filename
  echo $dir/$new_filename
}
archive() {
  mkdir -p $(dirname archived/$1)
  mv $1 archived/$1
}

# zshrc
ezsh() { nvim ~/.zshrc; }
reload() { source ~/.zshrc; }

# MISC. #

# Source aliases
[[ -f ~/.bash_aliases ]] && . ~/.bash_aliases
[[ -f ~/.zsh-complete/_fzf ]] && source ~/.zsh-complete/_fzf

# vim:tw=100:cc=+1:ft=bash
