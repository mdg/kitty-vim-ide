#!/bin/bash

# Kide terminal setup function
kide() {
    kitty @ set-tab-title "$1"

    # Rename current window to "sh"

    # Split current window side by side and rename new window to "vim"
    kitty @ launch --location=vsplit --title="vim"

    # Focus back on original window (left side)
    kitty @ focus-tab --match title:sh

    # Split original window top to bottom and rename bottom window to "agent"
    kitty @ launch --location=hsplit --title="agent"

    # Focus back on the top-left window (original "sh" window)
    kitty @ focus-tab --match title:sh
}
