#!/bin/bash

# Enter current editor here
# EDITOR='zed' # Uncomment this line for Zed
# EDITOR='nvim' # Uncomment this line for Neovim
EDITOR='code' # Uncomment this line for VSCode
# EDITOR='subl' # Uncomment this line for Sublime Text

# Open current directory in intellij
ij_widget() {
    CURRENT_DIR=$(pwd)
    if [ ! -d "$CURRENT_DIR/.git" ]; then
        echo "Not a git repository."
        zle reset-prompt
    else
        idea "$CURRENT_DIR"
    fi
}
zle -N ij_widget
bindkey '^J' ij_widget

# Fuzzy finder for all files to open in editor
fzf_widget() {
    CURRENT_DIR=$(pwd)
    cd
    FILE="$(find -type f | fzf --height=15)"
    if [ -n "$FILE" ]; then
        eval $EDITOR "$FILE"
    fi
    cd $CURRENT_DIR
    zle reset-prompt
}
zle -N fzf_widget
bindkey '^F' fzf_widget

# Fuzzy finder for current directory
fzf_local() {
    FILE="$(find . -type f | fzf --height=15)"
    if [ -n "$FILE" ]; then
        eval $EDITOR "$FILE"
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
