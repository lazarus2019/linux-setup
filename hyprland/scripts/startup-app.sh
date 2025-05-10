#!/bin/bash
# This script will startup the app with custom flag (optional)

# ref: https://www.reddit.com/r/hyprland/comments/16bql40/launching_apps_and_moving_to_a_specific_workspace/

# receive 3 arguments: (workspace, app_class, flags?)
# flag: optional

MAX_ARGUMENTS=3

# This script using hyprctl, update to your system if needed
start_app() {
  local workspace=$1
  local command="$2"
  sleep 2 # Delay 2 second for system loaded (hyprland exec-once will run parallel)
  hyprctl dispatch exec "[workspace $workspace silent] $command"
}

log_error_syntax() {
  echo "Wrong syntax, follow arguments: (workspace, app_class, flags?)" 
}

start_app_without_flags() {
  start_app $1 $2
  # hyprctl dispatch exec "[workspace $1] $2"
}

start_app_with_flags() {
  start_app $1 "$2 $3"
  # hyprctl dispatch exec "[workspace $1] $2 $3"
}

if [ "$#" -eq $((MAX_ARGUMENTS - 1)) ]; then
  start_app_without_flags $1 $2
elif [ "$#" -eq $MAX_ARGUMENTS ]; then
  start_app_with_flags $1 $2 $3
else
  log_error_syntax
fi