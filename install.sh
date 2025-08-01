#!/bin/bash


### ==== ENSURE DEPENDENCIES ARE INSTALLED ==== ###


# Dependencies listed, in order:
# git
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
which apt > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "Detected apt package manager"
    sudo apt update -y
    sudo apt upgrade -y
    PACKAGE_MANAGER="apt"
elif which pacman > /dev/null 2>&1; then
    echo "Detected pacman package manager"

    sudo pacman -Syu --noconfirm

    PACKAGE_MANAGER="pacman"
else
    echo "Unsupported package manager. Exiting..."
    exit 1
fi

if ! command_exists git; then
    if [ "$PACKAGE_MANAGER" = "apt" ]; then
        echo "git not installed: installing now..."
        sudo apt install -y git
    elif [ "$PACKAGE_MANAGER" = "pacman" ]; then
        echo "git not installed: installing now..."
        sudo pacman -S --needed --noconfirm git base-devel
    fi
    git config --global init.defaultBranch main
    echo "git has been installed."
else
    echo "git is already installed."
fi

if [ "$PACKAGE_MANAGER" = "pacman" ]; then
    if ! command_exists yay; then
        echo "yay not installed: installing now..."
        if ping -c 4 google.com; then
            echo "Pulling yay from arch repo..."
            git clone https://aur.archlinux.org/yay.git
        else
            echo "Copying yay from /tmp"
            echo "YAY DIRECTORY CONTENTS:" && ls /tmp/yay
            echo "PWD IS $(pwd)" || echo "how the hell did this error, exiting..." && exit 1
            mv /tmp/yay /tmp/dotFiles/yay || echo "yay not found in /tmp, exiting..." && exit 1
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
fi

if ! command_exists perl; then
    if [ "$PACKAGE_MANAGER" = "apt" ]; then
        echo "Perl not installed: installing now..."
        sudo apt install -y perl libterm-readline-gnu-perl
    elif [ "$PACKAGE_MANAGER" = "pacman" ]; then
        echo "Perl not installed: installing now..."
        sudo pacman -S --needed --noconfirm perl perl-term-extendedcolor
    fi
    echo "Perl has been installed"
else
    echo "Perl is already installed"
fi

if ! command_exists qrencode; then
    if [ "$PACKAGE_MANAGER" = "apt" ]; then
        echo "qrencode not installed: installing now..."
        sudo apt install -y qrencode
    elif [ "$PACKAGE_MANAGER" = "pacman" ]; then
        echo "qrencode not installed: installing now..."
        sudo pacman -S --needed --noconfirm qrencode
    fi
    echo "qrencode has been installed."
else
    echo "qrencode is already installed."
fi

if [ "$PACKAGE_MANAGER" = "pacman" ]; then
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
fi

if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "oh-my-zsh not installed: installing now..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    echo "oh-my-zsh has been installed."
else
    echo "oh-my-zsh is already installed."
fi

if ! command_exists rofi; then
    if [ "$PACKAGE_MANAGER" = "apt" ]; then
        echo "Rofi is not installed: installing now..."
        sudo apt install -y rofi
    elif [ "$PACKAGE_MANAGER" = "pacman" ]; then
        echo "Rofi is not installed: installing now..."
        sudo pacman -S --needed --noconfirm rofi
    fi
    echo "rofi has been installed."
else
    echo "Rofi is already installed."
fi

if [ "$PACKAGE_MANAGER" = "pacman" ]; then
    if ! command_exists dmenu; then
        echo "dmenu is not installed: installing now..."
        sudo pacman -S --needed --noconfirm dmenu
        echo "dmenu has been installed."
    else
        echo "dmenu is already installed."
    fi
fi

if ! command_exists neofetch; then
    if [ "$PACKAGE_MANAGER" = "apt" ]; then
        echo "neofetch is not installed: installing now..."
        sudo apt install -y neofetch
    elif [ "$PACKAGE_MANAGER" = "pacman" ]; then
        echo "neofetch is not installed: installing now..."
        sudo pacman -S --needed --noconfirm neofetch
    fi
    echo "neofetch has been installed"
else
    echo "neofetch is already installed."
fi

if ! command_exists nvim; then
    if [ "$PACKAGE_MANAGER" = "apt" ]; then
        echo "nvim is not installed: installing now..."
        sudo apt install -y neovim
    elif [ "$PACKAGE_MANAGER" = "pacman" ]; then
        echo "nvim is not installed: installing now..."
        sudo pacman -S --needed --noconfirm neovim
    fi
    echo "nvim has been installed"
else
    echo "nvim is already installed."
fi

echo "All dependencies are up-to-date!"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"


### ==== INSTALL DOTFILES TO CORRECT LOCATIONS ==== ###


# Copy zsh configs
cp -b "$PROJECT_DIR/zsh/.zshrc" "$HOME/.zshrc" || {
    echo "Error: Could not complete copy of .zshrc"
    exit 1
}
cp -b "$PROJECT_DIR/zsh/custom/aliases.zsh" "$HOME/.oh-my-zsh/custom/aliases.zsh" || {
    echo "Error: Could not complete copy of aliases.zsh"
    exit 1
}
cp -b "$PROJECT_DIR/zsh/custom/keybinds.zsh" "$HOME/.oh-my-zsh/custom/keybinds.zsh" || {
    echo "Error: Could not complete copy of keybinds.zsh"
    exit 1
}
cp -b "$PROJECT_DIR/zsh/custom/kali.zsh" "$HOME/.oh-my-zsh/custom/kali.sh" || {
    echo "Error: Could not complete copy of kali.sh"
    exit 1
}
cp -b "$PROJECT_DIR/zsh/themes/passion.zsh-theme" "$HOME/.oh-my-zsh/themes/passion.zsh-theme" || {
    echo "Error: Could not complete copy of passion.zsh-theme"
    exit 1
}
cp -b "$PROJECT_DIR/zsh/themes/cool.zsh" "$HOME/.oh-my-zsh/themes/cool.zsh" || {
    echo "Error: Could not complete copy of coolzsh"
    exit 1
}

# Copy i3 configs
if [ "$PACKAGE_MANAGER" = "pacman" ]; then
    cp -rb "$PROJECT_DIR/i3" "$HOME/.config/i3" || {
        echo "Error: Could not complete copy of i3 configs"
        exit 1
    }
fi

# Copy polybar configs
if [ "$PACKAGE_MANAGER" = "pacman" ]; then
    cp -rb "$PROJECT_DIR/polybar" "$HOME/.config/polybar" || {
        echo "Error: Could not complete copy of polybar configs"
        exit 1
    }
fi

# Copy rofi config
cp -rb "$PROJECT_DIR/rofi" "$HOME/.config/rofi" || {
    echo "Error: Could not complete copy of rofi config"
    exit 1
}

# Copy picom config
if [ "$PACKAGE_MANAGER" = "pacman" ]; then
    cp -rb "$PROJECT_DIR/picom" "$HOME/.config/picom" || {
        echo "Error: Could not complete copy of picom config"
        exit 1
    }
fi

# Copy misc scripts
cp -rb "$PROJECT_DIR/scripts" "$HOME/.config/scripts" || {
    echo "Error: Could not complete copy of misc scripts"
    exit 1
}

# Copy i3blocks configs
if [ "$PACKAGE_MANAGER" = "pacman" ]; then
    cp -rb "$PROJECT_DIR/i3blocks" "$HOME/.config/i3blocks" || {
        echo "Error: Could not complete copy of i3blocks config and scripts"
        exit 1
    }
fi

# Neofetch config
cp -rb "$PROJECT_DIR/neofetch" "$HOME/.config/neofetch/config.conf" || {
    echo "Error: Could not complete copy of neofetch config"
    exit 1
}

# Neovim config
cp -rb "$PROJECT_DIR/nvim" "$HOME/.config" || {
    echo "Error: Could not complete copy of neovim config"
    exit 1
}

# Grub configuration
if [ "$PACKAGE_MANAGER" = "pacman" ]; then
    sudo ./"$PROJECT_DIR/grub/GreyFocus/install.sh"
fi

echo "Files have been successfully deployed."

source "$HOME/.zshrc"
echo "Environment set! Press Mod+Shift+R to restart i3."
