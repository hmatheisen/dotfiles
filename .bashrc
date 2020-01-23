# ===============================================
#        _               _              
#       | |__   __ _ ___| |__  _ __ ___ 
#       | '_ \ / _` / __| '_ \| '__/ __|
#      _| |_) | (_| \__ \ | | | | | (__ 
#     (_)_.__/ \__,_|___/_| |_|_|  \___|
#
# ===============================================

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# PS1 Setting
export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"

# Bash Completion
if [ -f /usr/local/etc/bash_completion ]; then
  . /usr/local/etc/bash_completion
fi

# ls aliases
if type exa &> /dev/null; then
  alias ls="exa -lh"
else
  if [[ "$OSTYPE" == "darwin"* ]];then
    alias ls="ls -lhG"
  else
    alias ls="ls -lh --color=auto" 
  fi
fi

# Set locale on Macos
if [[ "$OSTYPE" == "darwin"* ]]; then
  # set Locale
  export LC_ALL=en_US.UTF-8
fi

# Aliases
alias :q="exit"
alias vim=nvim
alias ic=ibmcloud
alias ts=tmux-session

# Kubernetes config files
export KUBECONFIG=/Users/$USER/.bluemix/plugins/container-service/clusters/bo100fad0vdho8vhh78g/kube-config-hou02-formation-kube.yml
export KUBE_EDITOR=vim

# Create a variable for Neovim configs
export NVIM=.config/nvim/

# Set editor
export EDITOR=nvim

# Go programming setup
export PATH="$PATH:/usr/local/go"
export GOPATH=$HOME/go:$HOME/go
export PATH="$PATH:$HOME/go/bin"

# Rust
export PATH="$HOME/.cargo/bin:$PATH"
export RUST_SRC_PATH="$HOME/.rustup/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src"

# Add brew install directory to $PATH
export PATH=/usr/local/bin:$PATH

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Add Tex utilities
export PATH=/Library/TeX/texbin:$PATH

# Add local script folder
export PATH=$PATH:$HOME/.local/bin

# Start fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

