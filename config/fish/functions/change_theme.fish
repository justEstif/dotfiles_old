function change_theme
  set theme $argv[1]
  if test "$theme" = "light"
    set -gx theme "light"
    kitty +kitten themes GitHub
  else if test "$theme" = "dark"
    set -gx theme "dark"
    kitty +kitten themes GitHub\ Dark\ Dimmed
  else
    echo "Invalid theme. Please provide 'light' or 'dark'."
  end
end
