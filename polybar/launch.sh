#!/bin/bash

# Terminate any bar instances that are already running
polybar-msg cmd quit

echo "---" | tee -a /tmp/polybar.log
polybar 2>&1 | tee -a /tmp/polybar.log & disown
echo "Bar launched!"