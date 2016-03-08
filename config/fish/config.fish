set -g fish_greeting ''

set EDITOR /usr/local/bin/mvim
set -x GOPATH $HOME/Go

set -x KUBECONFIG ~/.kube/config:.kubeconfig

set PATH /usr/local/bin $PATH
set PATH /usr/local/sbin $PATH
set PATH $HOME/.rbenv/bin $PATH
set PATH $HOME/.rbenv/shims $PATH
set PATH $HOME/bin $PATH
set PATH /usr/local/opt/coreutils/libexec/gnubin $PATH
set PATH $GOPATH/bin $PATH
set PATH /usr/local/opt/go/libexec/bin $PATH

alias k="kubectl"
alias kg="kubectl get"
alias kgp="kubectl get pods"
alias kgpa="kubectl get pods --all-namespaces -o wide"
alias kgs="kubectl get services"
alias kgsa="kubectl get services --all-namespaces"
alias kgr="kubectl get rc"
alias kgr="kubectl get rc --all-namespaces"
alias kgn="kubectl get nodes"
alias kl="kubectl logs"
alias ke="kubectl exec -ti"
alias kd="kubectl describe"
alias kdp="kubectl describe pod"
alias kds="kubectl describe service"
alias kdr="kubectl describe rc"
alias kdn="kubectl describe node"
alias kc="kubectl create"
alias ku="kubectl config use-context"

alias g="git"
alias gs="git status"
alias ga="git add"
alias gr="git remove"
alias gc="git commit"
alias gca="git commit --amend"
alias gcam="git commit -am"
alias gcm="git commit -m"
alias gf="git fetch"
alias gfa="git fetch --all"
alias gp="git pull"
alias gpr="git pull --rebase"
alias gprom="git pull --rebase origin master"
alias gprum="git pull --rebase upstream master"
alias gpom="git push origin master"
alias gpum="git push upstream master"
alias gra="git rebase --abort"
alias grc="git rebase --continue"
alias gri="git rebase -i"
alias grm="git rebase master"
alias gd="git diff"
alias gdc="git diff --cached"
alias gss="git stash save"
alias gsp="git stash pop"

# source host specific config
. $HOME/.config/fish/(hostname -s).fish

function fish_user_key_bindings
  bind \e.       'history-token-search-backward'
  bind \e\[1\;9A 'history-token-search-backward'
  bind \e\[1\;9B 'history-token-search-forward'
  bind \e\[1\;9C 'forward-word'
  bind \e\[1\;9D 'backward-word'
end

[ -f /usr/local/share/autojump/autojump.fish ]; and . /usr/local/share/autojump/autojump.fish
