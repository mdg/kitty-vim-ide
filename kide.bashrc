#!/bin/bash

# Kide terminal setup function
kide() {
    # Set tab title to first parameter if provided
    if [ -n "$1" ]; then
        kitty @ set-tab-title "$1"
    fi

    # Split current window side by side and rename new window to "vim"
    kitty @ launch --location=hsplit --title="vim" --keep-focus

    # Split original window top to bottom and rename bottom window to "agent"
    kitty @ launch --location=vsplit --title="agent" --keep-focus
}
