# Zsh plugins
plugins=(git terraform)
# Path to your oh-my-zsh installation.
export ZSH="/Users/henry/.oh-my-zsh"
# source oh-my-zsh
source $ZSH/oh-my-zsh.sh
# Load VCS Info
autoload -Uz vcs_info
precmd() { vcs_info }

# Personal scripts
export PATH=$PATH:~/.local/bin

# Be sure locale is utf8
export LANG=en_US.UTF-8

# Why would I want to update when I install
export HOMEBREW_NO_AUTO_UPDATE=1

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
ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[white]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="*"
ZSH_THEME_GIT_PROMPT_CLEAN=""

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

