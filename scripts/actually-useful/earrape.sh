#!/bin/sh

name=$(echo "$1" | sed 's/\..*//; s/.*\///')
[ -n "$2" ] && dest="$2" || dest='./'

ffmpeg -i "$1" -af acrusher=.1:1:64:0:log "${dest}${name}-earrape.opus"
