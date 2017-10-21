function _kubectl 
  test -n "$KUBECTL_CONTEXT"; or set -x KUBECTL_CONTEXT (kubectl config current-context)

  if count $argv > /dev/null
    kubernikusctl auth refresh --context $KUBECTL_CONTEXT
  end

  if test -n "$KUBECTL_NAMESPACE"
    eval kubectl --context $KUBECTL_CONTEXT --namespace $KUBECTL_NAMESPACE $argv
  else
    eval kubectl --context $KUBECTL_CONTEXT $argv
  end
end
