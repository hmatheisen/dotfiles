alias ll="exa -lhg --group-directories-first"
alias l="ll -a"

alias vim=nvim
alias ivm=nvim # yes I went there
alias vi=vise  # vis editor is "vise" on Darwin

alias glog="git log --decorate --oneline --graph"
alias changelog='git log --no-merges --pretty=format:"%s" $TARGET..$SOURCE'
alias gcof='git checkout .forestadmin-schema.json'

alias w="watch -n 1"

alias ts="tmux-session"
alias elevo="cd ~/Code/elevo-rails && tmux-elevo"

alias docker-rmi="docker images -q | xargs docker rmi"
alias docker-rm="docker ps -qa | xargs docker rm"
