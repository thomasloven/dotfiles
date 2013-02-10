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
PROMPT+=' '
# SSH Indicator ( Doesn't work too well in tmux)
if [[ -n "$SSH_CONNECTION" ]]; then
	PROMPT+='$(setFG $CL_brightred)⚡$(setFG $STATFG)'
fi
# Host name
PROMPT+=' %m  '
PROMPT+='$(setFG $STATBG)$(setBG $CL_darkestblue)'
PROMPT+=$(print '\u2b80')

# Working directory
#PROMPT+='$(setFG $CL_gray9)$(setBG $CL_gray4)'
PROMPT+='$(setFG $CL_base2)$(setBG $CL_darkestblue)'
PROMPT+=' %c '

# History number
#PROMPT+='$(setFG $CL_gray4)$(setBG $CL_gray9)'
PROMPT+=$(print '\u2b81')
PROMPT+=' %! '
# Add a red arrow if superuser
PROMPT+=$(print '%(!.$(setFG $CL_darkestblue)$(setBG $CL_red)\u2b80$(noBG 0)$(setFG $CL_red)\u2b80.$(noBG 0)$(setFG $CL_darkestblue)\u2b80)')
PROMPT+='%{$reset_color%}'

RPROMPT=''

# Git information
RPROMPT+='$(noBG 0)$(setFG $CL_gray2)'
RPROMPT+=$(print '\U2b82')
RPROMPT+='$(setBG $CL_gray2)$(setFG $CL_gray7)'
RPROMPT+='$(git_prompt_info)'

# Specific for the macbook
HOSTNAME=`hostname | awk -F . '{ print $1 }' | tr MTP mtp 2>/dev/null`
if [[ "$HOSTNAME" == "mac-thomas-pro" ]]; then
	# Print battery level (doesn't work well at all)
	RPROMPT+='$(setFG $CL_brightestorange)⚡'
	RPROMPT+=`batlevel`
	RPROMPT+='$(setFG $CL_gray9)'
fi
RPROMPT+='$(setBG $CL_gray2)$(setFG $CL_gray10)'

# Time
RPROMPT+=$(print '\u2b82')
RPROMPT+='$(setBG $CL_gray10)$(setFG $CL_gray2)'
RPROMPT+=' %* '
RPROMPT+='%{$reset_color%}'

# Git prompt
ZSH_THEME_GIT_MIDDLE=$(print "\u2b60")
ZSH_THEME_GIT_PROMPT_PREFIX=" "
ZSH_THEME_GIT_PROMPT_SUFFIX=" "
if [[ "$HOSTNAME" == "mac-thomas-pro" ]]; then
	# Add an extra arrow if on macbook
	ZSH_THEME_GIT_PROMPT_SUFFIX+="$(print '\u2b83') "
fi
ZSH_THEME_GIT_PROMPT_DIRTY=$(print "$(setFG $CL_brightred)\u2717$(setFG $CL_gray7)")
ZSH_THEME_GIT_PROMPT_CLEAN=$(print "$(setFG $CL_brightgreen)\u2713$(setFG $CL_gray7)")

# Change color of status indicator
function zle-keymap-select {
	eval STATBG='${${KEYMAP/vicmd/$CL_brightorange}/(main|viins)/$CL_brightgreen}'
	eval STATFG='${${KEYMAP/vicmd/$CL_red}/(main|viins)/$CL_darkestgreen}'
	zle reset-prompt
}

# Update time and change colors when pressing enter
function accept-line {
	zle reset-prompt
	eval STATBG=$CL_brightgreen
	eval STATFG=$CL_darkestgreen
	builtin zle .accept-line
}
zle -N accept-line
bindkey -M vicmd "^M" accept-line
zle -N zle-keymap-select
