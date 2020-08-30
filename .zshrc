# The following lines were added by compinstall

# zstyle ':completion:*' completer _expand _complete _ignored _approximate
# zstyle ':completion:*' matcher-list '' ''
# zstyle ':completion:*' max-errors 5 numeric
# zstyle :compinstall filename '/home/emanuel/.zshrc'
zstyle ':completion:*' menu select
zmodload zsh/complist
_comp_options+=(globdots)

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.cache/zsh/history
HISTSIZE=10000
SAVEHIST=10000
setopt autocd

# vi mode
bindkey -v
export KEYTIMEOUT=1

# fzf keybindings
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

# End of lines configured by zsh-newuser-install

[[ -e ~/.profile ]] && emulate sh -c 'source ~/.profile'

# prompt
PROMPT='%B%F{240}%2~%f%b $ '

# colors
autoload -U colors && colors

setopt autocd		# Automatically cd into typed directory.

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# pacman fzf search
function fzf_pacman() { pacman -Slq | fzf --multi --preview 'pacman -Si {1}' | xargs -ro sudo pacman -S }
zle -N fzf_pacman
bindkey "^P" fzf_pacman
# bindkey -s "^P" 'pacman -Slq | fzf --multi --preview 'pacman -Si {1}' | xargs -ro sudo pacman -S'

# fzf directory search
bindkey -s '^f' 'cd "$(dirname "$(fzf)")"\n'


# load zsh-syntax-highlighting, must be last
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh 2>/dev/null
