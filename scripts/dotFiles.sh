#!/bin/bash

TARGET="$HOME/Github/dotFiles"
CONFIGS="$HOME/.config"
cd "$TARGET" || { echo "Directory $TARGET not found!"; exit 1; }

# Delete current files in github repo
clear_repo() {
    find . -mindepth 1 -maxdepth 1 ! \( -name ".git" -o -name "README.md" \) -exec rm -rf {} +
}
# Move these files to the github repo
fill_repo() {
    echo 'Pulling repo from remote...'
    git pull origin main

    # i3 config
    if [ -d "$CONFIGS/i3" ]; then
        echo "i3 config found: adding to repo..."
        cp -r "$CONFIGS/i3" ./i3
    else
        echo "i3 directory does not exist!"
    fi

    # picom conf
    if [ -d "$CONFIGS/picom" ]; then
        echo "picom config found: adding to repo..."
        cp -r "$CONFIGS/picom" ./picom
    else
        echo "Picom directory does not exist!"
    fi

    # Misc Scripts
    if [ -d "$CONFIGS/scripts" ]; then
        echo "Script directory found: adding to repo..."
        cp -r "$CONFIGS/scripts" ./scripts
    else
        echo "Script directory does not exist!"
    fi

    # ZSHRC file
    if [ -f "$HOME/.zshrc" ]; then
        if [ ! -d ./zsh ]; then
            echo "zsh directory did not exist in repo: creating now..."
            mkdir ./zsh
        fi
        echo ".zshrc config found: adding to repo..."
        cp -r "$HOME/.zshrc" ./zsh/.zshrc
    else
        echo ".zshrc config does not exist!"
    fi

    # zshrc aliases-to-source
    if [ -f "$HOME/.oh-my-zsh/custom/aliases.zsh" ]; then
        if [ ! -d ./zsh ]; then
            echo "zsh directory did not exist in repo: creating now..."
            mkdir ./zsh
        fi
        echo "aliases.zsh config found: adding to repo..."
        cp -r "$HOME/.oh-my-zsh/custom/aliases.zsh" ./zsh/aliases.zsh
    else
        echo "aliases.zsh config does not exist!"
    fi

    # Remotely executed kali commands
    if [ -f "$HOME/Tools/SSHTools/kali.sh" ]; then
        if [ ! -d ./zsh ]; then
            echo "zsh directory did not exist in repo: creating now..."
            mkdir ./zsh
        fi
        echo "kali.sh config found: adding to repo..."
        cp -r "$HOME/Tools/SSHTools/kali.sh" ./zsh/kali.sh
    else
        echo "kali.sh config does not exist!"
    fi

    # Keybinds for zsh
    if [ -f "$HOME/.oh-my-zsh/custom/keybinds.zsh" ]; then
        if [ ! -d ./zsh ]; then
            echo "zsh directory did not exist in repo: creating now..."
            mkdir ./zsh
        fi
        echo "keybinds.zsh config found: adding to repo..."
        cp -r "$HOME/.oh-my-zsh/custom/keybinds.zsh" ./zsh/keybinds.zsh
    else
        echo "keybinds.zsh config does not exist!"
    fi
    
    # Rofi config
    if [ -f "$HOME/.config/rofi/config.rasi" ]; then
        if [ ! -d ./rofi ]; then
            echo "rofi directory did not exist in repo: creating now..."
            mkdir ./rofi
        fi
        echo "Rofi config found: adding to repo..."
        cp -r "$HOME/.config/rofi/config.rasi" ./rofi/config.rasi
    else
        echo "Rofi config does not exist!"
    fi

    # Polybar config
    if [ -d "$HOME/.config/polybar" ]; then
        echo "Polybar directory found: adding files to repo..."
        cp -r "$HOME/.config/polybar" ./polybar
    else
        echo "Polybar directory does not exist!"
    fi
}

# Add and commit new files
add_commit_push() {
    echo "Adding configs to git..."
    git add .
    if ! git diff-index HEAD --; then
        echo "No changes to commit: exiting..."
        exit 0
    else
        echo "Commiting changes to configs..."
        git commit -m "Updated configs"
    fi
    git push origin main
}

clear_repo
fill_repo
add_commit_push
