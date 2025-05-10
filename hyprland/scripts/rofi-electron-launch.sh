#!/bin/bash

# List of apps that require the Wayland flags
ELECTRON_APPS=(
  "discord"
  "thunar"
  "code"
  "firefox"
  "google-chrome"
  "brave-browser"
  "obsidian"
  "chromium"
  "vscode"
  "brave"
)

# Extract the base command (before any args)
CMD="$1"
BASE_CMD=$(basename "$CMD")
FLAG="--enable-features=UseOzonePlatform --ozone-platform=wayland --enable-wayland-ime"

# Check if the base command matches any Electron app
for app in "${ELECTRON_APPS[@]}"; do
  if [[ "$BASE_CMD" == "$app" ]]; then
    exec "$CMD" $FLAG
  fi
done

# If not in the list, run as-is with arguments
exec "$@"