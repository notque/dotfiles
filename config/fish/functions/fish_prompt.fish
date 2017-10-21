function __kubectl_context
  set -l context ""
  set -l namespace ""

  if test -n "$KUBECTL_CONTEXT"
    set context $KUBECTL_CONTEXT
  else
    if type -p monsoonctl > /dev/null
      set context (monsoonctl config current-context)
    end
  end

  if test -n "$KUBECTL_NAMESPACE"
    set namespace "/$KUBECTL_NAMESPACE"
  end

  echo " "(set_color -o blue)‹$context$namespace› 
end

function __openstack_context
  if test -n "$OS_PROJECT_DOMAIN_NAME"
    if test -n "$OS_PROJECT_NAME"
      echo " "(set_color -o yellow)\[$OS_PROJECT_DOMAIN_NAME/$OS_PROJECT_NAME\] 
    end
  end
end

function fish_prompt
  set -gx __fish_git_prompt_showdirtystate true
  set -gx __fish_git_prompt_showcolorhints true

  echo -n -s 🐢 "  " (set_color -o cyan)(basename (prompt_pwd)) (__fish_git_prompt) (__openstack_context) (__kubectl_context) (set_color normal) " "
end
