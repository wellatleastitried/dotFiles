#!/bin/bash -e

/home/walitsnb/.config/i3lock-fancy/i3lock-fancy

sleep 60; pgrep /home/walitsnb/.config/i3lock-fancy/i3lock-fancy && xset dpms force off
