#!/bin/sh

# Macro which checks if gitkraken is open and if so, focus on it, otherwise it just opens the program

# The block below makes the script super slow
# if ! dpkg -S wmctrl > /dev/null ; then
#     notify-send 'Required dependacy wmctrl not installed, macro quitting...'
# fi

open_string=$(wmctrl -l | grep -i 'gitkraken' | awk '{ print $4 }')

if [ ${#open_string} -gt 0 ]; then
    wmctrl -a "${open_string}"
else
    gitkraken
fi
