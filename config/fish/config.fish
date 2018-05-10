set -g fish_greeting ''

set EDITOR /usr/local/bin/mvim
#set -x GOPATH $HOME/Go
#set -x GOBINPATH $HOME/GoBin

set -x KUBECONFIG /Users/nathan.oylersap.com/cc/monsoon3/.kubeconfig
set -x GITHUB_TOKEN d9a64f9773fce4dc6ee1c9da289726c29407f5d8
set -x AWS_ACCESS_KEY_ID f71fec4947574cdca7bf049117281dd7
set -x AWS_SECRET_ACCESS_KEY afc4644fe325415bb7e0e5c5bdc19354
set -x AWS_DEFAULT_REGION staging

set PATH /usr/local/bin $PATH
set PATH /usr/local/sbin $PATH
set PATH $HOME/bin $PATH
set PATH /usr/local/opt/coreutils/libexec/gnubin $PATH
set PATH $GOBINPATH/bin $PATH
set PATH $GOPATH/bin $PATH
set PATH /usr/local/opt/go/libexec/bin $PATH

alias h="_helm"

alias k="_kubectl"
alias kg="k get --show-all"
alias kgp="kg pods -o wide"
alias kgpa="kgp --all-namespaces"
alias kgs="kg services --show-all"
alias kgsa="kg services --all-namespaces"
alias kgr="kg rc --all-namespaces"
alias kgn="kg nodes -L container-linux-update.v1.coreos.com/version -L zone -L species"
#alias kl="k logs -f"
alias klt="kl --tail 1000"
alias ke="k exec -ti"
alias kd="k describe"
alias kdp="kd pod"
alias kds="kd service"
alias kdr="kd rc"
alias kdn="kd node"
#alias kc="k create"
alias kc="ku"
alias kl="_kail"
kc staging
kn monsoon3

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

function fish_user_key_bindings
  bind \e.       'history-token-search-backward'
  bind \e\[1\;9A 'history-token-search-backward'
  bind \e\[1\;9B 'history-token-search-forward'
  bind \e\[1\;9C 'forward-word'
  bind \e\[1\;9D 'backward-word'
end

[ -f /usr/local/share/autojump/autojump.fish ]; and . /usr/local/share/autojump/autojump.fish

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/nathan.oylersap.com/Downloads/google-cloud-sdk/path.fish.inc' ]; if type source > /dev/null; source '/Users/nathan.oylersap.com/Downloads/google-cloud-sdk/path.fish.inc'; else; . '/Users/nathan.oylersap.com/Downloads/google-cloud-sdk/path.fish.inc'; end; end
