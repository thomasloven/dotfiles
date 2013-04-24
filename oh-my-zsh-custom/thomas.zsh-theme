#!/usr/bin/env zsh

# 2b80 ⮀
# 2b81 ⮁
# 2b82 ⮂
# 2b83 ⮃
# 2717 ✗
# 2713 ✓

current_color="green"

PROMPT=''
PROMPT+='%{$fg[$current_color]%}'
PROMPT+='%m' # Server
PROMPT+='%{$reset_color%}'
PROMPT+=':'
PROMPT+='%c ' # Working directory
PROMPT+='%{$fg[green]%}'
PROMPT+='%(!.%{$fg[red]%}#.$) ' # Green $ for user, red # for root
PROMPT+='%{$reset_color%}'


function git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return

  # Don't print anything if the current directory is ignored
  if git clean -xnd `pwd` | grep 'Would remove \./' > /dev/null; then
    return
  fi

  OUTPUT='['
  if [[ -n $(git status -s --ignore-submodules=dirty 2> /dev/null) ]]; then
    if [[ -n $(git status -s --ignore-submodules=dirty 2> /dev/null | grep '^[^ ]') ]]; then
      OUTPUT+="%{$fg[yellow]%}"
    else
      OUTPUT+="%{$fg[red]%}"
    fi
  else
    OUTPUT+="%{$fg[green]%}"
  fi

  OUTPUT+="${ref#refs/heads/}"
  OUTPUT+="%{$reset_color%}]"
  echo $OUTPUT
}

RPROMPT=''
RPROMPT+='%{$reset_color%}'
RPROMPT+='$(git_prompt_info)'
RPROMPT+='%{$reset_color%}'

# Change color of status indicator
function zle-keymap-select {
	current_color="${${KEYMAP/vicmd/red}/(main|viins)/green}"
	zle reset-prompt
}

# Update time and change colors when pressing enter
function accept-line {
	zle reset-prompt
  current_color="green"
	builtin zle .accept-line
}
zle -N accept-line
bindkey -M vicmd "^M" accept-line
zle -N zle-keymap-select
