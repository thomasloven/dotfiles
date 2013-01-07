#!/bin/sh

# Options:
# -U : Update only Ignores all other options
# -u : No update Don't pull latest sources
# -f : Force Don't ask before overwriting
# -a : All Install everything
# -v : vim Install vimrc and plugins
# -z : zsh Install zshrc and oh-my-zsh
# -t : tmux Install tmux config files
# -b : Homebrew Install homebrew and my favorite packages
# -h : Help Display help

echo "Welcome."

function doIt() {
	echo "Doing stuff!"
}

function installVim() {
	echo "Installing .vimrc and plugins"
	rm -rf ~/.vim
	rm -rf ~/.vimrc
	ln -s $PWD/.vim ~/.vim
	ln -s $PWD/vimrc ~/.vimrc
}

function installZsh() {
	echo "Installing .zshrc and oh-my-zsh"
	rm -rf ~/.oh-my-zsh
	rm -rf ~/.oh-my-zsh-custom
	rm -rf ~/.zshrc
	rm -rf ~/.gitconfig
	rm -rf ~/.gitignore_global
	ln -s $PWD/.oh-my-zsh ~/.oh-my-zsh
	ln -s $PWD/oh-my-zsh-custom ~/.oh-my-zsh-custom
	ln -s $PWD/zshrc ~/.zshrc
	ln -s $PWD/gitconfig ~/.gitconfig
	ln -s $PWD/gitignore_global ~/.gitignore_global
}

function installTmux() {
	echo "Installing tmux configuration"
	rm -rf ~/.tmux.conf
	ln -s $PWD/tmux.conf ~/.tmux.conf
}

function installBrew() {
	if [[ -z `which brew | grep -v 'not found'` ]]; then
		echo "Installing Homebrew"
		ruby -e "$(curl -fsSkL raw.github.com/mxcl/homebrew/go)"
	fi
	brew update
	brew install macvim
	brew install tmux
	brew install reattach-to-user-namespace
	brew linkapps
}

function doUpdate() {
	echo " - Performing git pull to get latest version"
	git pull
	git submodule update
}

function showHelp() {

	cat << EOF
Options:
	-U : Update only Ignores all other options
	-u : No update Don't pull latest sources
	-f : Force Don't ask before overwriting
	-a : All Install everything
	-v : vim Install vimrc and plugins
	-z : zsh Install zshrc and oh-my-zsh
	-t : tmux Install tmux config files
	-b : Homebrew Install homebrew and my favorite packages
	-h : Help Display help
EOF
}

function unsetall() {
	unset doIt
	unset installVim
	unset installZsh
	unset installTmux
	unset installBrew
	unset doUpdate
	unset showHelp
}

DOVIM=
DOZSH=
DOTMUX=
DOBREW=
NOUPDATE=
REPLY=

while getopts "Uufavztbh" OPTION
do
	case $OPTION in
		U)
			doUpdate
			unsetall
			unset unsetall
			exit 1
			;;
		u)
			NOUPDATE=TRUE
			;;
		f)
			REPLY=y
			;;
		a)
			DOVIM=TRUE
			DOZSH=TRUE
			DOTMUX=TRUE
			DOBREW=TRUE
			;;
		v)
			DOVIM=TRUE
			;;
		z)
			DOZSH=TRUE
			;;
		t)
			DOTMUX=TRUE
			;;
		b)
			DOBREW=TRUE
			;;
		h)
			showHelp
			unsetall
			unset unsetall
			exit 1
			;;
	esac
done

if [[ -z $REPLY ]]; then
	read -p "This may overwrite existing files in your home directory. Are you sure (y/n) " -n 1
	echo
fi

if [[ $REPLY =~ ^[Yy]$ ]]; then

	if [[ -z $NOUPDATE ]]; then
		doUpdate
	fi

	if [[ -n $DOVIM ]]; then
		installVim
	fi
	if [[ -n $DOZSH ]]; then
		installZsh
	fi
	if [[ -n $DOTMUX ]]; then
		installTmux
	fi
	if [[ -n $DOBREW ]]; then
		installBrew
	fi


fi

unsetall
unset unsetall

echo "Exiting!"
