alias ll="eza -lhg --group-directories-first"
alias l="ll -a"

alias vim=nvim
alias ivm=nvim

alias gcof='git checkout .forestadmin-schema.json'
# alias gst='git status -sb'
alias gpo='git push origin $(git branch --show-current)'
alias gpfo='git push --force-with-lease origin $(git branch --show-current)'

alias w="watch -n 1"

alias ts="tmux-session"
alias elevo="cd ~/Code/elevo-rails && tmux-elevo"

alias docker-rmi="docker images -q | xargs docker rmi"
alias docker-rm="docker ps -qa | xargs docker rm"
