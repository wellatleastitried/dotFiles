#!/bin/bash

# Enter current editor here
EDITOR='zed'

# Fuzzy finder for all files to open in editor
fzf_widget() {
    CURRENT_DIR=$(pwd)
    cd
    FILE="$(find -type f | fzf)"
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
    FILE="$(find . -type f | fzf)"
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
