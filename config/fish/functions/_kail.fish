function _kail
  test -n "$KUBECTL_CONTEXT"; or set -x KUBECTL_CONTEXT (kubectl config current-context)
  eval kail --context $KUBECTL_CONTEXT --ns $KUBECTL_NAMESPACE $argv
end
