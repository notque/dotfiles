function _git_branch_name
  if command git rev-parse --git-dir > /dev/null ^ /dev/null
    echo (git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
  end
end

function _is_git_dirty
  echo (git status -s --ignore-submodules=dirty ^/dev/null)
end

function _rbenv_version
  if type -P rbenv >/dev/null
    if [ (rbenv version-origin | grep $PWD) ]
      echo (rbenv version-name | sed -e 's/ .*//')
    end
  end
end

function _kubectl_context
  set -l kubectl_namespace ""

  if test -n "$KUBENAMESPACE"
    set kubectl_namespace "/$KUBENAMESPACE"
  end

  if type -p monsoonctl > /dev/null
    echo (monsoonctl config view -o template --template='{{index . "current-context"}}')$kubectl_namespace
  end
end

function fish_prompt
  set -l cyan (set_color -o cyan)
  set -l yellow (set_color -o yellow)
  set -l red (set_color -o red)
  set -l blue (set_color -o blue)
  set -l normal (set_color normal)

  set -l arrow "$red➜ "
  set -l cwd $cyan(basename (prompt_pwd))

  set rbenv_version (_rbenv_version)
  if [ $rbenv_version ]
    set ruby_info " $red‹$rbenv_version›"
  end
 
  set kubectl_context (_kubectl_context)
  if [ $kubectl_context ]
    set kubectl_info " $blue‹$kubectl_context›"
  end

  set git_branch_name (_git_branch_name)
  if [ $git_branch_name ]
    set git_info "$yellow$git_branch_name"

    if [ (_is_git_dirty) ]
      set indicator "$red ✗"
    else
      set indicator "$green ✔"
    end

    set git_info " $yellow‹$git_info$indicator$yellow›"
  end

  echo -n -s $arrow $cwd $ruby_info $kubectl_info $git_info $normal ' '
end

