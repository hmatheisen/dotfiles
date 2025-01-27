alias ll="eza -lhg --group-directories-first"
alias l="ll -a"

alias vim=nvim
alias ivm=nvim

alias ec="emacsclient -c -nw"
alias em="emacs -nw"
alias mg="mg -n"

alias gcof='git checkout .forestadmin-schema.json'
# alias gst='git status -sb'
alias gpo='git push origin $(git branch --show-current)'
alias gpfo='git push --force-with-lease origin $(git branch --show-current)'

alias w="watch -n 1"

alias ts="tmux-session"
alias elevo="itermocil elevo --here"

alias docker-rmi="docker images -q | xargs docker rmi"
alias docker-rm="docker ps -qa | xargs docker rm"

alias grep="grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,.idea,.tox,.venv,venv,node_modules,vendor}"
