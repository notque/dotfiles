function _git_branch_name
  if command git rev-parse --git-dir > /dev/null ^ /dev/null
    echo (git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
  end
end

function _is_git_dirty
  echo (git status -s --ignore-submodules=dirty ^/dev/null)
end

function _kubectl_context
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

  echo $context$namespace
end

function fish_prompt
  set -l cyan (set_color -o cyan)
  set -l yellow (set_color -o yellow)
  set -l red (set_color -o red)
  set -l blue (set_color -o blue)
  set -l normal (set_color normal)

  set -l arrow "$red➜ "
  set -l cwd $cyan(basename (prompt_pwd))

  set kubectl_context (_kubectl_context)

  if [ $kubectl_context ]
    set kubectl_info " $blue‹$kubectl_context›"
  end

  set git_branch_name (_git_branch_name)
  if [ $git_branch_name ]
    set git_info "$yellow$git_branch_name"
    set is_git_dirty    (_is_git_dirty) 

    if [ $is_git_dirty ]
      set indicator "$red ✗"
    else
      set indicator "$green ✔"
    end

    set git_info " $yellow‹$git_info$indicator$yellow›"
  end

  echo -n -s $arrow $cwd $kubectl_info $git_info $normal ' '
end

