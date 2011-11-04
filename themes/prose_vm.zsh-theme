function virtualenv_info {
  IMVIRT_STATUS=`imvirt 2> /dev/null`
  [ $? -ne 127 ] && [ $IMVIRT_STATUS != "Physical" ] && echo "%{$fg_bold[red]%}VM%{$reset_color%} "
}

function box_name {
    [ -f ~/.box-name ] && cat ~/.box-name || hostname -s
}

PROMPT='
%{$fg_bold[magenta]%}%n%{$reset_color%} at %{$fg[green]%}$(box_name)%{$reset_color%} in %{$fg_bold[blue]%}${PWD/#$HOME/~}%{$reset_color%}
$(virtualenv_info)%(?,,%{${fg_bold[red]}%}[%?]%{$reset_color%} )%{$fg[green]%}$ '

local return_status="%{$fg[red]%}%(?..✘)%{$reset_color%}"
RPROMPT='%{${return_status}%}%{$reset_color%}'
