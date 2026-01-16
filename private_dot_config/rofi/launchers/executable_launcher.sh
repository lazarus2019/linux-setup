#!/usr/bin/env bash
#  ┓ ┏┓┳┳┳┓┏┓┓┏┏┓┳┓
#  ┃ ┣┫┃┃┃┃┃ ┣┫┣ ┣┫
#  ┗┛┛┗┗┛┛┗┗┛┛┗┗┛┛┗
#                  


# Style-dir
style_dir="$HOME/.config/rofi/launchers/styles"
ELECTRON_LAUNCH_SCRIPT="$HOME/.config/hypr/scripts/rofi-electron-launch.sh"

# Style-theme
style_theme='style-1'


# Run
pkill rofi || true && rofi -show drun -theme ${style_dir}/${style_theme}.rasi -replace -i -run-command "$ELECTRON_LAUNCH_SCRIPT {cmd}"
