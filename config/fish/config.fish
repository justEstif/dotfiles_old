function fish_user_key_bindings
  fish_vi_key_bindings
end

set -x EDITOR nvim
set -x ZK_NOTEBOOK_DIR ~/zk-notes
set fish_greeting # Turn off the fish welcome message
set fzf_directory_opts --bind "ctrl-o:execute($EDITOR {} &> /dev/tty)"
alias cdu="cd -" # go to the prev dir
alias lf='ranger_cd' # file manager
alias lz='nvim +"tab G"'  # git client
alias v='nvim' # nvim
alias killnode="killall -9 node" # kill all node apps
alias l="exa -lba" # ls
alias ls="exa" # ls
alias la='exa -albF --git' # list, size, type, git
alias ni="npm i"
alias nid="npm i --save-dev"
alias nr="npm run"
alias nig="npm i -g"
