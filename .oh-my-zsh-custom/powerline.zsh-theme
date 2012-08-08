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

PROMPT=''
PROMPT+='
$(setFG $STATFG)$(setBG $STATBG)'
PROMPT+='  %m  '
PROMPT+='$(setFG $STATBG)$(setBG $CL_gray4)'
PROMPT+=$(print '\u2b80')
PROMPT+='$(setFG $CL_gray9)$(setBG $CL_gray4)'
PROMPT+=' %c '
#PROMPT+='$(setFG $CL_gray4)$(setBG $CL_gray9)'
PROMPT+=$(print '\u2b81')
PROMPT+=' %! '
PROMPT+=$(print '%(!.$(setFG $CL_gray4)$(setBG $CL_red)\u2b80$(setFG $CL_red)$(setBG $CL_black)\u2b80.$(setFG $CL_gray4)$(setBG $CL_black)\u2b80)')
PROMPT+='%{$reset_color%}'

RPROMPT=''
RPROMPT+='$(setBG $CL_black)$(setFG $CL_gray4)'
RPROMPT+=$(print '\U2b82')
RPROMPT+='$(setBG $CL_gray4)$(setFG $CL_gray9)'
#RPROMPT+='$(git_prompt_info)'
RPROMPT+='$(setBG $CL_gray4)$(setFG $CL_gray10)'
RPROMPT+=$(print '\u2b82')
RPROMPT+='$(setBG $CL_gray10)$(setFG $CL_gray2)'
RPROMPT+=' %* '
RPROMPT+='%{$reset_color%}'

ZSH_THEME_GIT_MIDDLE=$(print "\u2b60")
ZSH_THEME_GIT_PROMPT_PREFIX=" "
ZSH_THEME_GIT_PROMPT_SUFFIX=" "
ZSH_THEME_GIT_PROMPT_DIRTY=$(print "$(setFG $CL_brightred)\u2717$(setFG $CL_gray9)")
ZSH_THEME_GIT_PROMPT_CLEAN=$(print "$(setFG $CL_brightgreen)\u2713$(setFG $CL_gray9)")
function zle-keymap-select {
	eval STATBG='${${KEYMAP/vicmd/$CL_brightorange}/(main|viins)/$CL_brightgreen}'
	eval STATFG='${${KEYMAP/vicmd/$CL_red}/(main|viins)/$CL_darkestgreen}'
	zle reset-prompt
}

function accept_line {
	eval STATBG=$CL_brightgreen
	eval STATFG=$CL_darkestgreen
	builtin zle .accept-line
}
zle -N accept_line
bindkey -M vicmd "^M" accept_line
zle -N zle-keymap-select
