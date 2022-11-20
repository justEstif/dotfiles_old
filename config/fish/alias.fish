## cd
alias cdu="cd -" # go to the prev dir

## app aliases
alias lf='ranger_cd' # file manager
alias lz='nvim +"tab G"'  # git client
alias v='nvim' # nvim

# kill all node apps
alias killnode="killall -9 node"

## exa
alias l="exa -lba" # ls
alias ls="exa" # ls
alias la='exa -albF --git' # list, size, type, git

# tmux alias
alias tmuxq="tmux kill-session" # close terminal
alias tmuxqa="tmux kill-server" # close all terminal
