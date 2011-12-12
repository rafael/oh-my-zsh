function virtualenv_info {
  IMVIRT_STATUS=`imvirt 2> /dev/null`
  [ $? -ne 127 ] && [ $IMVIRT_STATUS != "Physical" ] && echo "%{$fg_bold[red]%}VM%{$reset_color%} "
}

function box_name {
    [ -f ~/.box-name ] && cat ~/.box-name || hostname -s
}

PROMPT='
%{$fg[cyan]%}%n%{$reset_color%} at %{$fg[green]%}$(box_name)%{$reset_color%} in %{$fg[cyan]%}${PWD/#$HOME/~}%{$reset_color%}$(git_prompt_info)
$(virtualenv_info)%(?,,%{${fg_bold[red]}%}[%?]%{$reset_color%} )%{$fg[green]%}$ '

ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg_bold[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[yellow]%}[?]"
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%}[!]"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg_bold[red]%}[*]"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[red]%}[U]"
ZSH_THEME_GIT_PROMPT_CLEAN=""
DISABLE_AUTO_UPDATE=1
