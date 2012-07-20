#!/usr/bin/env zsh

eval PCLR1='%{$reset_color%}'
eval PCLR2='%{$fg[green]%}'
eval PCLR3='%{$fg_bold[green]%}'

PROMPT='%{$fg_bold[red]%}%m %{$fg[cyan]%}%c %{$fg_bold[blue]%}[%{$fg_bold[yellow]%}%!%{$fg_bold[blue]%}] %{$fg_bold[blue]%}%(!.#.%{$PCLR1%}>%{$PCLR2%}>%{$PCLR3%}>)%{$reset_color%}'


RPROMPT='%{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[green]%}%* %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="(%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}●%{$reset_color%}%{$fg_bold[blue]%})"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
