if status is-interactive
    # Commands to run in interactive sessions can go here
end

fish_vi_key_bindings

set -x NVM_DIR ~/.nvm
nvm use default --silent
