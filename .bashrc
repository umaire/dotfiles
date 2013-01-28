#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# default vars
export EDITOR=vim
export PATH=$PATH:~/bin

# colored man pages
man() {
	env \
		LESS_TERMCAP_mb=$(printf "\e[1;31m") \
		LESS_TERMCAP_md=$(printf "\e[1;31m") \
		LESS_TERMCAP_me=$(printf "\e[0m") \
		LESS_TERMCAP_se=$(printf "\e[0m") \
		LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
		LESS_TERMCAP_ue=$(printf "\e[0m") \
		LESS_TERMCAP_us=$(printf "\e[1;32m") \
			man "$@"
}

# less color
export LESSOPEN="| /usr/bin/source-highlight-esc.sh?%s"
export LESS=' -R '

# colored coreutils
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias diff='colordiff'

# prompt
PS1='[\u@\h \W]\$ '

# I prefer vim but too lazy to type the extra 'm'
alias vi='vim'

