function fish_user_key_bindings
  fish_vi_key_bindings
end

###### variables ######
set -x EDITOR nvim
set -x ZK_NOTEBOOK_DIR ~/zk-notes
set fish_greeting # Turn off the fish welcome message
set fzf_directory_opts --bind "ctrl-o:execute($EDITOR {} &> /dev/tty)"

###### Themes ######

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

## alias ni="pnpm i"
## alias nid="pnpm i --save-dev"
## alias nr="pnpm run"
## alias nig="pnpm i -g"

alias p="pnpm"
alias pa="pnpm add"
alias pad="pnpm add --save-dev"
alias pap="pnpm add --save-peer"
alias pau="pnpm audit"
alias pb="pnpm run build"
alias pc="pnpm create"
alias pd="pnpm run dev"
alias pdoc="pnpm run doc"
alias pdocs="pnpm run docs"
alias pga="pnpm add --global"
alias pgls="pnpm list --global"
alias pgrm="pnpm remove --global"
alias pgu="pnpm update --global"
alias ph="pnpm help"
alias pi="pnpm init"
alias pin="pnpm install"
alias pln="pnpm run lint"
alias pls="pnpm list"
alias pout="pnpm outdated"
alias ppub="pnpm publish"
alias prm="pnpm remove"
alias prun="pnpm run"
alias ps="pnpm run serve"
alias pst="pnpm start"
alias psv="pnpm server"
alias pt="pnpm test"
alias ptc="pnpm test --coverage"
alias pui="pnpm update --interactive"
alias puil="pnpm update --interactive --latest"
alias pun="pnpm uninstall"
alias pup="pnpm update"
alias pwhy="pnpm why"
alias px="pnpx"
