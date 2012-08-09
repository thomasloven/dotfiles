
# PS4='+$(date "+%s:%N") %N:%i> '
# exec 3>&2 2>/tmp/startlog.$$
# setopt xtrace prompt_subst


# Swedish and UTF8
export LANG='sv_SE.UTF-8'
export LC_ALL='sv_SE.UTF-8'

# Oh my ZSH
ZSH=$HOME/.oh-my-zsh
ZSH_CUSTOM="$HOME/.oh-my-zsh-custom"
ZSH_THEME="powerline"
plugins=(git brew osx extract screen wakeonlan)
source $ZSH/oh-my-zsh.sh

# Use vim for editing
alias vim="mvim -v"
export EDITOR="vim"

# Path variable
PATH="/usr/local/sbin:${PATH}"
PATH="/usr/local/bin:${PATH}"
PATH="/usr/texbin:${PATH}"
PATH="/usr/local/mysql/bin:${PATH}"
PATH="${HOME}/bin:${PATH}"

# Use vim editing mode
# Make sure backspace works as it should
# jj is the same as esc in insert mode
bindkey -v
bindkey "^H" backward-delete-char
bindkey "^?" backward-delete-char
bindkey -M viins 'jj' vi-cmd-mode
bindkey -M viins 'kj' vi-cmd-mode

# Always run screen in utf8 mode
alias screen="screen -U"
alias tmux="nocorrect tmux"

# Use C-s to insert sudo
function insert_sudo() {
	zle beginning-of-line
	zle -U "sudo "
}
zle -N insert-sudo insert_sudo
bindkey "\C-s" insert-sudo

setopt AUTO_CD

# Look for .localzsh from the current directory and upwards and runs it
#function chpwd; {
	#DIRECTORY="$PWD"
	#while true; do
		#if [ -f './.localzsh']; then
			#source './.localzsh'
			#break
		#fi
		#[ $PWD = '/' ] && break
		#cd -q ..
	#done
	#cd -q $DIRECTORY
#}

# Use C-l to run command into less
bindkey -s "\C-l" " 2>&1|less^M"

# unsetopt xtrace
# exec 2>&3 3>&-

export TTY=$(tty)

function fancy-ctrl-z () {
	if [[ $#BUFFER -eq 0 ]]; then
		bg
		zle redisplay
	else
		zle push-input
	fi
}
zle -N fancy-ctrl-z
bindkey '^z' fancy-ctrl-z

alias -g L='|less'
