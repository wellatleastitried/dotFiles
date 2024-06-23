#!/bin/bash

CLIPBOARD_CONTENT=$(xclip -o -selection clipboard)

notify-send --urgency=normal --expire-time=5000 --icon= "Clipboard:" "$CLIPBOARD_CONTENT"