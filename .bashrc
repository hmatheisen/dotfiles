# ===============================================
# ~/.bashrc
# ===============================================

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# PS1 Setting
export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"

# Bash Completion
if [ -f /usr/local/etc/bash_completion ]; then
  . /usr/local/etc/bash_completion
fi

# Go programming setup
export GOPATH=$HOME/go:$HOME/go
export PATH="$PATH:$HOME/go/bin"

# Rust
export PATH="$HOME/.cargo/bin:$PATH"
export RUST_SRC_PATH="$HOME/.rustup/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src"

# Aliases
alias cl="clear"
alias ls="ls -lG"
alias :q="exit"

# PATH
export PATH=/usr/local/bin:$PATH

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Add Tex utilities
export PATH=/Library/TeX/texbin:$PATH

# Add local script folder
export PATH=$PATH:$HOME/.local/bin

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
