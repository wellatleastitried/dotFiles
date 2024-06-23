#!/bin/bash

CLIPBOARD_CONTENT=$(xclip -o -selection clipboard)
URL_REGEX="^((https?|ftp|file):\/\/|www\.)[-A-Za-z0-9+&@#/%?=~_|!:,.;]*[-A-Za-z0-9+&@#/%=~_|]$"

if [[ $CLIPBOARD_CONTENT =~ $URL_REGEX ]]; then
    if [[ $CLIPBOARD_CONTENT =~ ^www\. ]]; then
        CLIPBOARD_CONTENT="http://$CLIPBOARD_CONTENT"
    fi
    if ping -c 1 "$CLIPBOARD_CONTENT" > /dev/null 2>&1; then
        notify-send --expire-time=5000 "QR Error:" "Cannot make QR because there is not a valid URL on the clipboard."
        exit 1
    fi
    qrencode -o /tmp/qrcode.png "$CLIPBOARD_CONTENT"
    notify-send --urgency=normal --expire-time=5000 "QR Code:" "QR code is being generated"
    feh -Z /tmp/qrcode.png
else
    notify-send --expire-time=5000 "QR Error:" "Clipboard does not contain a valid URL."
fi
