function _helm
  test -n "$KUBECTL_CONTEXT"; or set -x KUBECTL_CONTEXT (kubectl config current-context)
  eval helm --kube-context $KUBECTL_CONTEXT $argv
end
