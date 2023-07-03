function change_theme --description "Change theme to light or dark" --argument theme
    switch $theme
        case light
            set -gx theme light
            kitty +kitten themes --reload-in=all GitHub
            nvim --server ~/.cache/nvim/server.pipe --remote-send ':Theme light<cr>'
        case dark
            set -gx theme dark
            kitty +kitten themes --reload-in=all "GitHub Dark Dimmed"
            nvim --server ~/.cache/nvim/server.pipe --remote-send ':Theme dark<cr>'
        case '*'
            echo "Invalid theme. Please provide 'light' or 'dark'."
    end
end

complete -c change_theme -a light -d "Change theme to light"
complete -c change_theme -a dark -d "Change theme to dark"
