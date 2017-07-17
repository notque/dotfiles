function _kubectl 
  set -l cmd monsoonctl
  test -n "$KUBECTL_CONTEXT"; or set -x KUBECTL_CONTEXT (monsoonctl config current-context)
  test "$KUBECTL_CONTEXT" = "wupse"; and set cmd kubectl.1.7.0

  if test -n "$KUBECTL_NAMESPACE"
    eval $cmd --context $KUBECTL_CONTEXT --namespace $KUBECTL_NAMESPACE $argv
  else
    eval $cmd --context $KUBECTL_CONTEXT $argv
  end
end
