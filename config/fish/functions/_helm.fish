function _helm
  set -l cmd helm 
  test -n "$KUBECTL_CONTEXT"; or set -x KUBECTL_CONTEXT (monsoonctl config current-context)
  eval $cmd --kube-context $KUBECTL_CONTEXT $argv
end
