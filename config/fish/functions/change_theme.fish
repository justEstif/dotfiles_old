function change_theme --description "Change theme to light or dark" --argument theme
    switch $theme
        case light
            set -gx theme light
            kitty +kitten themes GitHub
        case dark
            set -gx theme dark
            kitty +kitten themes "GitHub Dark Dimmed"
        case '*'
            echo "Invalid theme. Please provide 'light' or 'dark'."
    end
end

complete -c change_theme -a light -d "Change theme to light"
complete -c change_theme -a dark -d "Change theme to dark"
