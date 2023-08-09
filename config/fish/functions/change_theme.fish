function change_theme --description "Change theme to light or dark" --argument theme
    switch $theme
        case light
            set -Ux theme light
            fish_config theme choose "Catppuccin Latte"
            kitty +kitten themes --reload-in=all "Mini-Scheme-Light"
        case dark
            set -Ux theme dark
            fish_config theme choose "Catppuccin Mocha"
            kitty +kitten themes --reload-in=all "Mini-Cyan-Dark"
        case '*'
            echo "Invalid theme. Please provide 'light' or 'dark'."
    end
end

complete -c change_theme -a light -d "Change theme to light"
complete -c change_theme -a dark -d "Change theme to dark"
