#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

alias ll='ls -lhat'
alias vi='vim'
alias tmux="TERM=screen-256color-bce tmux"
alias supercollider="scide"
alias rsbcl="rlwrap sbcl"
alias pacman-upgrade="sudo pacman -Suy"

# tidalvim
export PATH=$PATH:/home/emanuel/.vim/plugged/vim-tidal/bin/

# Haskell ghcup
[ -f "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env" ] && source "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env"

export VISUAL=vim
export EDITOR="$VISUAL"

# doom emacs
export PATH=~/.emacs.d/bin:$PATH

# .local/bin
export PATH=~/.local/bin:$PATH

# git dot files bare repository config
alias config='/usr/bin/git --git-dir=/home/emanuel/.cfg/ --work-tree=/home/emanuel'
