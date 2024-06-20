#!/bin/bash

EDITOR='zed'

fzf_widget() {
    CURRENT_DIR=$(pwd)
    cd
    zed "$(find -type f | fzf)"
    cd $CURRENT_DIR
    zle reset-prompt
}
zle -N fzf_widget
bindkey '^F' fzf_widget

clear_widget() {
    clear
    zle reset-prompt
}
zle -N clear_widget
bindkey '^L' clear_widget
