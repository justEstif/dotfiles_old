# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(
  git
  asdf
  vi-mode
  z
)

source $ZSH/oh-my-zsh.sh

function rangercd() {
    tmp="$(mktemp)"
    ranger --choosedir="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        if [ -d "$dir" ]; then
            if [ "$dir" != "$(pwd)" ]; then
                cd "$dir"
            fi
        fi
    fi
}

alias lf=rangercd                           # file manager
alias lz="lazygit"                          # git client
alias v="nvim"                              # nvim
alias vd="cd ~/dotfiles/config/nvim/; nvim" # nvim config
alias vo="cd ~/Sync/notes/; nvim"           # notes
alias killnode="killall -9 node"            # kill all node apps
