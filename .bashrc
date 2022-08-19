#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \w]\$ '

# git補完
source /usr/share/git/completion//git-completion.bash

# alias
alias la='ls -a'
alias ll='ls -l'
alias lla='ls -a -l'
alias lf='ls -1 -F'

# color output
alias grep='grep --color=auto'
alias ip='ip -color=auto'
alias ls='ls --color=auto'

# flutter
export PATH="$PATH:/opt/flutter/bin"