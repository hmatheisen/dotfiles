alias ll='ls -lh --group-directories-first --color=auto'
alias l='ll -A'

alias vim='nvim'
alias ivm='nvim'

alias ec='emacsclient -c -nw'
alias em='emacs -nw'

alias gcof='git checkout .forestadmin-schema.json'
alias gst='git status'
alias gd='git diff'
alias gdm='git diff master'
alias gc='git commit -v'
alias gp='git push origin $(git branch --show-current)'
alias gpf='git push --force-with-lease origin $(git branch --show-current)'
alias glo='git log --oneline'
alias glom='git log --oneline master..'
alias gco='git checkout'
alias ga='git add'
alias gb='git branch'

alias w='watch -n 1'

alias elevo='itermocil elevo'

alias docker-rmi='docker images -q | xargs docker rmi'
alias docker-rm='docker ps -qa | xargs docker rm'

alias grep='grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,.idea,.tox,.venv,venv,node_modules}'

alias be='bundle exec'

alias serve='python3 -m http.server 8000'
