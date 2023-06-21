function install_apps
  install_yay
  yay -S neovim-git asdf zk
end

function install_yay
  pacman -S --needed git base-devel
  git clone https://aur.archlinux.org/yay.git
  cd yay
  makepkg -si
end
