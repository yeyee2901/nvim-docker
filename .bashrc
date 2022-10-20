
#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias la="ls -lah"
alias ll="ls -lh"

export PATH=$PATH:$HOME/nvim-linux64/bin
export PATH=$PATH:$HOME/apps

# Go stuffs
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$HOME/apps/golang/bin
