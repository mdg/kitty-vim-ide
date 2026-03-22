#!/bin/bash

# Kide terminal setup function
kide() {
    # Check if tab name parameter is provided
    if [ -z "$1" ]; then
        echo "Error: Tab name is required. Usage: kide <tab_name>"
        return 1
    fi

    local tab_name="$1"

    # Set tab title
    kitty @ set-tab-title "$tab_name"

    # Set current window title to "sh-<tab_name>"
    kitty @ set-window-title "sh $tab_name"

    # Split current window side by side and rename new window to "vim-<tab_name>"
    kitty @ launch --location=hsplit --title="vim $tab_name" --keep-focus

    # Split original window top to bottom and rename bottom window to "agent-<tab_name>"
    kitty @ launch --location=vsplit --title="agent $tab_name" --keep-focus
}
