#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# default vars
export EDITOR=vim
export PATH=$PATH:~/bin

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# I prefer vim but too lazy to type the extra 'm'
alias vi='vim'
