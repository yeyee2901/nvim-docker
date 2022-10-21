#!/bin/sh

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias la="ls -lah"
alias ll="ls -lh"
alias vi="nvim"

# Go stuffs
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# prompt
export PS1="\u @ nvim-docker in \w "
