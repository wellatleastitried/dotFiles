#!/bin/bash

# Dependencies listed, in order:
# yay
# perl
# qrencode
# polybar
# picom
# oh-my-zsh
# rofi
# dmenu
# neofetch
# Neovim

command_exists() {
    command -v "$1" &> /dev/null
}

ping -c 4 google.com
sudo pacman -Syu

if ! command_exists git; then
    echo "git not installed: installing now..."
    sudo pacman -S --needed git base-devel
    echo "git has been installed."
else
    echo "git is already isntalled."
fi

if ! command_exists yay; then
    echo "yay not installed: installing now..."
    git clone https://aur.archlinux.org/yay.git || echo "Error installing yay, exiting..." && exit
    cd yay
    makepkg -si
    cd ..
    rm -rf yay
    echo "yay has been installed."
else
    echo "yay is already installed."
fi

if ! command_exists perl; then
    echo "Perl not installed: installing now..."
    sudo pacman -S --needed perl perl-term-extendedcolor
    echo "Perl has been installed"
else
    echo "Perl is already installed"
fi

if ! command_exists qrencode; then
    echo "qrencode not installed: installing now..."
    sudo pacman -S --needed qrencode
    echo "qrencode has been installed."
else
    echo "qrencode is already installed."
fi

if ! command_exists polybar; then
    echo "Polybar not installed: installing now..."
    sudo pacman -S --needed polybar
    echo "Polybar has been installed."
else
    echo "Polybar is already installed."
fi

if ! command_exists picom; then
    echo "Picom not installed: installing now..."
    sudo pacman -S --needed picom
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
    sudo pacman -S --needed rofi
    echo "rofi has been installed."
else
    echo "Rofi is already installed."
fi

if ! command_exists dmenu; then
    echo "dmenu is not installed: installing now..."
    sudo pacman -S --needed dmenu
    echo "dmenu has been installed."
else
    echo "dmenu is already installed."
fi

if ! command_exists neofetch; then
    echo "neofetch is not installed: installing now..."
    sudo pacman -S --needed neofetch
    echo "neofetch has been installed"
else
    echo "neofetch is already installed."
fi

if ! command_exists nvim; then
    echo "nvim is not installed: installing now..."
    sudo pacman -S --needed nvim
    echo "nvim has been installed"
else
    echo "nvim is already installed."
fi

echo "All dependencies are up-to-date!"
