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

sudo pacman -Syu --noconfirm

if ! command_exists git; then
    echo "git not installed: installing now..."
    sudo pacman -S --needed --noconfirm git base-devel
    git config --global init.defaultBranch main
    echo "git has been installed."
else
    echo "git is already installed."
fi

if ! command_exists yay; then
    echo "yay not installed: installing now..."
    if ping -c 4 google.com; then
        echo "Pulling yay from arch repo..."
        git clone https://aur.archlinux.org/yay.git
    else
        echo "Copying yay from /tmp"
        echo "TEMP DIRECTORY CONTENTS:" && ls /tmp
        echo "YAY DIRECTORY CONTENTS:" && ls /tmp/yay
        echo "PWD IS $(pwd)"
        echo "CURRENT DIRECTORY CONTENTS:" && ls
        cp -r /tmp/yay ./ || "yay not found in /tmp, exiting..." && exit 1
    fi
    echo "Current Directory contents:" && ls
    cd yay || echo "Error installing yay, exiting..." && exit 1
    makepkg -si || echo "Unable to make package for yay, exiting..." && exit 1
    cd ..
    sudo rm -rf yay || echo "Error removing files, exiting..." && exit 1
    echo "yay has been installed."
else
    echo "yay is already installed."
fi

if ! command_exists perl; then
    echo "Perl not installed: installing now..."
    sudo pacman -S --needed --noconfirm perl perl-term-extendedcolor
    echo "Perl has been installed"
else
    echo "Perl is already installed"
fi

if ! command_exists qrencode; then
    echo "qrencode not installed: installing now..."
    sudo pacman -S --needed --noconfirm qrencode
    echo "qrencode has been installed."
else
    echo "qrencode is already installed."
fi

if ! command_exists polybar; then
    echo "Polybar not installed: installing now..."
    sudo pacman -S --needed --noconfirm polybar
    echo "Polybar has been installed."
else
    echo "Polybar is already installed."
fi

if ! command_exists picom; then
    echo "Picom not installed: installing now..."
    sudo pacman -S --needed --noconfirm picom
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
    sudo pacman -S --needed --noconfirm rofi
    echo "rofi has been installed."
else
    echo "Rofi is already installed."
fi

if ! command_exists dmenu; then
    echo "dmenu is not installed: installing now..."
    sudo pacman -S --needed --noconfirm dmenu
    echo "dmenu has been installed."
else
    echo "dmenu is already installed."
fi

if ! command_exists neofetch; then
    echo "neofetch is not installed: installing now..."
    sudo pacman -S --needed --noconfirm neofetch
    echo "neofetch has been installed"
else
    echo "neofetch is already installed."
fi

if ! command_exists nvim; then
    echo "nvim is not installed: installing now..."
    sudo pacman -S --needed --noconfirm nvim
    echo "nvim has been installed"
else
    echo "nvim is already installed."
fi

echo "All dependencies are up-to-date!"
