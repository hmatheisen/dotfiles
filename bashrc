# Alias definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Personal scripts
export PATH=$PATH:~/.local/bin

# Go config
export GO111MODULE=on
export PATH=$PATH:~/go/bin # vim-go install binaries here
export PATH=$PATH:/usr/local/go/bin

# Pretty colors
export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"

# Set main editor
export EDITOR=nvim
