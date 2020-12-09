# Path to your oh-my-zsh installation.
export ZSH="/home/henry/.oh-my-zsh"
# source oh-my-zsh
source $ZSH/oh-my-zsh.sh
# Zsh plugins
plugins=(git)

# Personal scripts
export PATH=$PATH:~/.local/bin

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Source aliases
[[ -f ~/.bash_aliases ]] && . ~/.bash_aliases

# Set prompt
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# Disable ctrl-s to freeze terminal.
stty stop undef
