alias ll="eza -lhg --group-directories-first"
alias l="ll -a"

alias vim=nvim
alias ivm=nvim # yes I went there

alias ran=ranger

alias glog="git log --decorate --oneline --graph"
alias gcof='git checkout .forestadmin-schema.json'

alias w="watch -n 1"

alias ts="tmux-session"
alias elevo="cd ~/Code/elevo-rails && tmux-elevo"

alias docker-rmi="docker images -q | xargs docker rmi"
alias docker-rm="docker ps -qa | xargs docker rm"

alias ec="emacsclient -c"
alias em="emacsclient -c -nw"
