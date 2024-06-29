#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

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

# Copy i3 configs
cp -rb "$PROJECT_DIR/i3" "$HOME/.config/i3" || {
    echo "Error: Could not complete copy of i3 configs"
    exit 1
}

# Copy polybar configs
cp -rb "$PROJECT_DIR/polybar" "$HOME/.config/polybar" || {
    echo "Error: Could not complete copy of polybar configs"
    exit 1
}

# Copy rofi config
cp -rb "$PROJECT_DIR/rofi" "$HOME/.config/rofi" || {
    echo "Error: Could not complete copy of rofi config"
    exit 1
}

# Copy picom config
cp -rb "$PROJECT_DIR/picom" "$HOME/.config/picom" || {
    echo "Error: Could not complete copy of picom config"
    exit 1
}

# Copy misc scripts
cp -rb "$PROJECT_DIR/scripts" "$HOME/.config/scripts" || {
    echo "Error: Could not complete copy of misc scripts"
    exit 1
}

# Copy i3blocks configs
cp -rb "$PROJECT_DIR/i3blocks" "$HOME/.config/i3blocks" || {
    echo "Error: Could not complete copy of i3blocks config and scripts"
    exit 1
}

echo "Files have been successfully deployed."