alias ll="exa -lhg"
alias l="exa -lahg"
alias vim=nvim
alias ivm=nvim # yes I went there
# alias vi=vise # Vis editor
alias glog="git log --decorate --oneline --graph"
alias w="watch -n 1"
alias ts="tmux-session"
alias ec="emacsclient -c"
alias te="tmux-elevo"
alias docker-rmi="docker images -q | xargs docker rmi"
alias docker-rm="docker ps -qa | xargs docker rm"
alias brew="arch -x86_64 brew"
alias brew-arm="arch -arm64 /opt/homebrew/bin/brew"
alias changelog='git log --no-merges --pretty=format:"%s" $TARGET..$SOURCE'
alias gcof='git checkout .forestadmin-schema.json'
