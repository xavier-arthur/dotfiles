#!/bin/sh

catch() {
    echo "bye"
    tput cnorm
    exit 0
}

trap 'catch' INT
tput civis

while true
do
    if xset q | grep -iq "caps lock:\s*on" 2>/dev/null ;then
        xdotool click 1 &
        sleep 0.1
    fi
done
