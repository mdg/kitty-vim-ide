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

    # Set layout to splits
    kitty @ goto-layout splits

    # Set current window title to "sh-<tab_name>"
    kitty @ set-window-title "sh $tab_name"

    # Split current window side by side and rename new window to "vim-<tab_name>"
    kitty @ launch --location=vsplit --title="vim $tab_name" --keep-focus --cwd=current

    # Split original window top to bottom and rename bottom window to "agent-<tab_name>"
    kitty @ launch --location=hsplit --title="agent $tab_name" --keep-focus --cwd=current
}

# Krun3 layout function - 3 windows on left, 1 on right
krun3() {
    # Set tab title
    kitty @ set-tab-title "run 3"

    # Set layout to splits
    kitty @ goto-layout splits

    # Split window to the right
    kitty @ launch --location=vsplit --keep-focus --bias 30

    # Split the left window horizontally (top to bottom)
    kitty @ launch --location=hsplit --keep-focus --cwd=current --bias 33

    # Split the left window again horizontally to create 3 windows on the left
    kitty @ launch --location=hsplit --keep-focus --cwd=current --bias 50
}
