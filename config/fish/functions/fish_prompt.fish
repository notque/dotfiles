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

  echo (set_color -o blue)‹$context$namespace›
end

function fish_prompt
  set -gx __fish_git_prompt_showdirtystate true
  set -gx __fish_git_prompt_showcolorhints true

  echo -n (set_color -o red)➜ (set_color -o cyan)(basename (prompt_pwd)) (__fish_git_prompt) (__kubectl_context) (set_color normal) 
end
