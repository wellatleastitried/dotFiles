#!/bin/bash

# Dependencies listed, in order:
# yay
# polybar
# picom
# oh-my-zsh
# rofi
# dmenu

command_exists() {
    command -v "$1" &> /dev/null
}

if ! command_exists yay; then
    echo "yay not installed: installing now..."
    sudo pacman -Syu --needed git base-devel
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
    cd ..
    rm -rf yay
    echo "yay has been installed."
else
    echo "yay is already installed."
fi

if ! command_exists polybar; then
    echo "Polybar not installed: installing now..."
    pacman -Syu --needed polybar
    echo "Polybar has been installed."
else
    echo "Polybar is already installed."
fi

if ! command_exists picom; then
    echo "Picom not installed: installing now..."
    sudo pacman -Syu --needed picom
    echo "Picom has been installed."
else
    echo "Picom is already installed."
fi

if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "oh-my-zsh not installed: installing now..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    echo "oh-my-zsh has been installed."
else
    echo "oh-my-zsh is already installed."
fi

if ! command_exists rofi; then
    echo "Rofi is not installed: installing now..."
    sudo pacman -Syu --needed rofi
    echo "rofi has been installed."
else
    echo "Rofi is already installed."
fi

if ! command_exists dmenu; then
    echo "dmenu is not installed: installing now..."
    sudo pacman -Syu --needed dmenu
    echo "dmenu has been installed."
else
    echo "dmenu is already installed."
fi

echo "All dependencies are up-to-date!"