# Zsh plugins
plugins=(git docker gcloud terraform kubectl emacs rust rustup cargo golang)
# Path to your oh-my-zsh installation.
export ZSH="/Users/henry/.oh-my-zsh"
# source oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Personal scripts
export PATH=$PATH:~/.local/bin

# Golang
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/go/bin

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

export TERMINAL="gnome-terminal"

# Source aliases
[[ -f ~/.bash_aliases ]] && . ~/.bash_aliases

# Set prompt
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# Disable ctrl-s to freeze terminal.
stty stop undef

# rbenv
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
export PATH="$HOME/.rbenv/shims:$PATH"
eval "$(rbenv init -)"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
