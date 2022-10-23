#!/bin/sh

if [ $(id -u) -ne 0 ]; then
    echo "run as root"
    exit 1
fi

device="$1"

tput civis
echo "Use ^C to stop. . ."

on_exit() {
    tc qdisc del dev "$device" root
    sudo wondershaper clear "$device"
    tput cnorm
    exit 0
}

trap on_exit INT

sudo wondershaper "$device" 60 60
sudo tc qdisc add dev "$device" root netem delay 1000ms

while true; do
    true
done
