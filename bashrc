#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ -e /usr/share/terminfo/x/xterm-termite ]; then
        export TERM='xterm-termite'
elif [ -e /usr/share/terminfo/x/xterm-256color ]; then
        export TERM='xterm-256color'
else
        export TERM='xterm-color'
fi

[ -f ~/.git-prompt.sh ] && source ~/.git-prompt.sh

PS1='\[\e[01;32m\]\u\[\e[m\] \[\e[01;31m\]@ \[\e[01;32m\]\h \[\e[01;34m\]\w\[\e[m\] \[\e[01;31m\]$(__git_ps1 "(%s)")\[\e[m\]\n\[\e[01;37m\]\$\[\e[m\] '

eval $(dircolors ~/.dircolors)

[ -f /usr/share/bash-completion/bash_completion ] && source /usr/share/bash-completion/bash_completion
[ -f ~/.git-completion.bash ] && source ~/.git-completion.bash

[ -f ~/.bash_aliases ] && source ~/.bash_aliases
