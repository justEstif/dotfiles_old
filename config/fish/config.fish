function fish_user_key_bindings
  fish_vi_key_bindings
end

###### variables ######
set -x EDITOR nvim
set -x ZK_NOTEBOOK_DIR ~/zk-notes
set fish_greeting # Turn off the fish welcome message
set fzf_directory_opts --bind "ctrl-o:execute($EDITOR {} &> /dev/tty)"

###### Themes ######
. ~/dotfiles/config/fish/themes/tokyonight_storm.fish
## . ~/dotfiles/config/fish/themes/tokyonight_day.fish
## . ~/dotfiles/config/fish/themes/tokyonight_moon.fish
## . ~/dotfiles/config/fish/themes/tokyonight_night.fish

###### Alias ######
alias cdu="cd -" # go to the prev dir
alias ..='cd ..' # go to the parent dir

alias lf='ranger_cd' # file manager
alias lz='lazygit'  # git client

alias v='nvim' # nvim
alias vd='cd ~/dotfiles/config/nvim/; nvim'
alias vo='cd ~/Sync/notes/; nvim'

alias killnode="killall -9 node" # kill all node apps

alias l="exa -lba" # ls
alias ls="exa" # ls
alias la='exa -albF --git' # list, size, type, git

alias ni="pnpm i"
alias nid="pnpm i --save-dev"
alias nr="pnpm run"
alias nig="pnpm i -g"
