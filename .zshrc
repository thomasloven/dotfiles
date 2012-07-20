# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_CUSTOM="$HOME/.oh-my-zsh-custom"

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

EDITOR="vim"
PATH="$HOME/bin:/usr/local/mysql/bin:/usr/texbin:/usr/local/sbin:${PATH}"

bindkey -v
bindkey "^H" backward-delete-char
bindkey "^?" backward-delete-char
bindkey -M viins 'jj' vi-cmd-mode

function zle-keymap-select {
	#eval PCLR2='${${KEYMAP/vicmd/%{$fg_bold[red]%}}/(main|viins)/%{$fg[green]%}}'
	eval PCLR3='${${KEYMAP/vicmd/%{$fg[red]%}}/(main|viins)/%{$fg_bold[green]%}}'
	eval PCLR3='%{$fg_bold[red]%}'
	zle reset-prompt
}

function accept_line {
	eval PCLR2='%{$fg[green]%}'
	eval PCLR3='%{$fg_bold[green]%}'
	builtin zle .accept-line
}
zle -N accept_line
bindkey -M vicmd "^M" accept_line
zle -N zle-keymap-select
