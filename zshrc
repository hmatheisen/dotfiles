# Zsh plugins
plugins=(git brew macos rake ripgrep docker)
# Path to your oh-my-zsh installation.
export ZSH="/Users/henry/.oh-my-zsh"
# source oh-my-zsh
source $ZSH/oh-my-zsh.sh

export ZSH_THEME=simple

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

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

# Java
export PATH="/Library/Java/JavaVirtualMachines/temurin-17.jdk/Contents/Home/bin:$PATH"

# rbenv
eval "$(rbenv init - zsh)"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# devkitarm compilers
export PATH="$PATH:/opt/devkitpro/devkitARM/bin"

# Go
export GOPATH="$(go env GOPATH)"
export PATH="${PATH}:${GOPATH}/bin"

# Solve <C-y> issues on MacOS
stty dsusp undef

# FZF utils
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

autoload -U +X bashcompinit && bashcompinit

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/henry/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/henry/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/henry/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/henry/google-cloud-sdk/completion.zsh.inc'; fi

# Postgres
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"

# LLVM bins
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

# LaTeX classes
export TEXINPUTS=:/Users/henry/Notes/classes

# bun completions
[ -s "/Users/henry/.bun/_bun" ] && source "/Users/henry/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Chez scheme
export CHEZSCHEMELIBDIRS="/Users/henry/Code/scheme/lib:"
