#!/usr/bin/env bash
A_1080=400
B_1080=400

# Check if wlogout is already running
if pgrep -x "wlogout" > /dev/null; then
    pkill -x "wlogout"
    exit 0
fi

# Detect monitor resolution and scaling factor
resolution=$(hyprctl -j monitors | jq -r '.[] | select(.focused==true) | if .transform == 1 then "vertical" else "horizontal" end' | awk -F'.' '{print $1}')
hypr_scale=$(hyprctl -j monitors | jq -r '.[] | select(.focused==true) | .scale')

if [[ $resolution == 'vertical' ]]; then
    wlogout -C $HOME/.config/wlogout/style.css -l $HOME/.config/wlogout/layout -b 3 -s
else
    wlogout -C $HOME/.config/wlogout/style.css -l $HOME/.config/wlogout/layout -b 5 -s
fi

# wlogout -C $HOME/.config/wlogout/style.css -l $HOME/.config/wlogout/layout --protocol layer-shell -b 5 -T $(awk "BEGIN {printf \"%.0f\", $A_1080 * 1080 * $hypr_scale / $resolution}") -B $(awk "BEGIN {printf \"%.0f\", $B_1080 * 1080 * $hypr_scale / $resolution}") &
