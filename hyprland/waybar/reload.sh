#!/bin/bash

CONFIG="$HOME/.config/hypr/waybar/config"
STYLE="$HOME/.config/hypr/waybar/style.css"

if pgrep -x "waybar" > /dev/null; then
    echo "Waybar is running. Reloading..."
    killall waybar
    sleep 1
else
    echo "Waybar is not running. Starting..."
fi

# Start Waybar with specified config and style
# waybar -c "$CONFIG" -s "$STYLE" &
waybar
