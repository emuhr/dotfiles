

# aliases
alias ls='ls --color=auto'

alias ll='ls -lhat'
alias vi='vim'
alias tmux="TERM=screen-256color-bce tmux"
alias supercollider="scide"
alias rsbcl="rlwrap sbcl"

export VISUAL=vim
export EDITOR="$VISUAL"

# .local/bin
export PATH=~/.local/bin:$PATH

# Go
export PATH=$PATH:$(go env GOPATH)/bin
export GOPATH=$(go env GOPATH)

# libvirt uri
export LIBVIRT_DEFAULT_URI="qemu:///system"

# git dot files bare repository config
alias config='/usr/bin/git --git-dir=/home/emanuel/.cfg/ --work-tree=/home/emanuel'

# prompt
# function git_status {
#   if [ -d .git ]; then
#     RESULT=$(git branch --show-current)
#   elif [[ "$PWD" == "/home/emanuel/.config" ]]; then
#     RESULT=$(config branch --show-current)
#   fi;
#   echo $RESULT;
# }
# 
# PS1="[\W] \$(git_status)$ "
