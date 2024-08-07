#!/bin/bash

# Enter current editor here
# EDITOR='zed' # Uncomment this line for Zed
# EDITOR='nvim' # Uncomment this line for Neovim
EDITOR='nvim' # Uncomment this line for VSCode
# EDITOR='subl' # Uncomment this line for Sublime Text

# Open current directory in intellij
ij_widget() {
    CURRENT_DIR=$(pwd)
    if [ ! -d "$CURRENT_DIR/src/main/java" ]; then
        echo "Likely not a Java project!"
        zle reset-prompt
    else
        idea "$CURRENT_DIR"
    fi
}
zle -N ij_widget
bindkey '^J' ij_widget

# Fuzzy finder for all files to open in editor
fzf_widget() {
    FILE="$(find -type f | fzf --height=15)"
    if [ -n "$FILE" ]; then
        eval $EDITOR "$FILE"
    fi
    zle reset-prompt
}
zle -N fzf_widget
bindkey '^F' fzf_widget

# Fuzzy finder for directories
fzf_local() {
    DIR="cd $(find . -type d -print | fzf)"
    if [ -d "$DIR" ]; then
        eval $EDITOR "$DIR"
    fi
    zle reset-prompt
}
zle -N fzf_local
bindkey '^H' fzf_local

# Clear terminal with keybind
clear_widget() {
    clear
    zle reset-prompt
}
zle -N clear_widget
bindkey '^L' clear_widget
