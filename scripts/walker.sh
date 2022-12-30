#!/bin/sh

catch() {
    echo "bye"
    tput cnorm
    exit 0
}

auto_walk() {
    xdotool keydown w
}

trap 'catch' INT
tput civis

while true
do
    if xset q | grep -iq "caps lock:\s*on" 2>/dev/null ;then
        xdotool keydown w
    fi
done
