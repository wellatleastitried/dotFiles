#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

# Copy zsh configs
cp "$PROJECT_DIR/zsh/.zshrc" "$HOME/.zshrc" || {
    echo "Error: Could not complete copy of .zshrc"
    exit 1
}
cp "$PROJECT_DIR/zsh/aliases.zsh" "$HOME/.oh-my-zsh/custom/aliases.zsh" || {
    echo "Error: Could not complete copy of aliases.zsh"
    exit 1
}
cp "$PROJECT_DIR/zsh/keybinds.zsh" "$HOME/.oh-my-zsh/custom/keybinds.zsh" || {
    echo "Error: Could not complete copy of keybinds.zsh"
    exit 1
}
cp "$PROJECT_DIR/zsh/kali.zsh" "$HOME/.oh-my-zsh/custom/kali.sh" || {
    echo "Error: Could not complete copy of kali.sh"
    exit 1
}

# Copy i3 configs
cp -r "$PROJECT_DIR/i3" "$HOME/.config/i3" || {
    echo "Error: Could not complete copy of i3 configs"
    exit 1
}

# Copy polybar configs
cp -r "$PROJECT_DIR/polybar" "$HOME/.config/polybar" || {
    echo "Error: Could not complete copy of polybar configs"
    exit 1
}

# Copy rofi config
cp -r "$PROJECT_DIR/rofi" "$HOME/.config/rofi" || {
    echo "Error: Could not complete copy of rofi config"
    exit 1
}

# Copy picom config
cp -r "$PROJECT_DIR/picom" "$HOME/.config/picom" || {
    echo "Error: Could not complete copy of picom config"
    exit 1
}

# Copy misc scripts
cp -r "$PROJECT_DIR/scripts" "$HOME/.config/scripts" || {
    echo "Error: Could not complete copy of misc scripts"
    exit 1
}

echo "Files have been successfully deployed."