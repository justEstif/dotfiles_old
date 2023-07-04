function change_theme --description "Change theme to light or dark" --argument theme
    switch $theme
        case light
            fish_config theme choose Tomorrow
            kitty +kitten themes --reload-in=all "Gruvbox Light"
        case dark
            fish_config theme choose Gruvbox\ Dark
            kitty +kitten themes --reload-in=all "Gruvbox Dark"
        case '*'
            echo "Invalid theme. Please provide 'light' or 'dark'."
    end
end

complete -c change_theme -a light -d "Change theme to light"
complete -c change_theme -a dark -d "Change theme to dark"
