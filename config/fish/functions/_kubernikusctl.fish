function _kubernikusctl
  test -n "$KUBECTL_CONTEXT"; or set -x KUBECTL_CONTEXT (kubectl config current-context)
  eval kubernikusctl --context $KUBECTL_CONTEXT $argv
end
