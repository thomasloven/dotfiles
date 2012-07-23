#!/usr/bin/env zsh

# 2b80 ⮀
# 2b81 ⮁
# 2b82 ⮂
# 2b83 ⮃
# 2717 ✗
# 2713 ✓

source $ZSH_CUSTOM/colors.zsh

STATBG=$CL_brightgreen
STATFG=$CL_darkestgreen

PROMPT='
$(setFG $STATFG)$(setBG $STATBG)'
PROMPT+='  %m  '
PROMPT+='$(setFG $STATBG)$(setBG $CL_gray4)'
PROMPT+='%{⮀%} '
PROMPT+='$(setFG $CL_gray9)$(setBG $CL_gray4)'
PROMPT+='%c '
PROMPT+='%{⮁%}'
PROMPT+=' %! '
PROMPT+='%(!.$(setFG $CL_gray4)$(setBG $CL_red)%{⮀%}$(setFG $CL_red)$(setBG $CL_black)%{⮀%}.$(setFG $CL_gray4)$(setBG $CL_black)%{⮀%})'
PROMPT+='%{$reset_color%}'

RPROMPT=''
RPROMPT+='$(setBG $CL_black)$(setFG $CL_gray4)'
RPROMPT+='%{⮂%}'
RPROMPT+='$(setBG $CL_gray4)$(setFG $CL_gray9)'
RPROMPT+=' $(git_prompt_info) '
RPROMPT+='$(setBG $CL_gray4)$(setFG $CL_gray10)'
RPROMPT+='%{⮂%}'
RPROMPT+='$(setBG $CL_gray10)$(setFG $CL_gray2)'
RPROMPT+=' %* '
RPROMPT+='%{$reset_color%}'

ZSH_THEME_GIT_MIDDLE="%{⭠%}"
ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY="$(setFG $CL_brightred)%{✗%}$(setFG $CL_gray9)"
ZSH_THEME_GIT_PROMPT_CLEAN="$(setFG $CL_brightgreen)%{✓%}$(setFG $CL_gray9)"
