#!/bin/sh
# format = ./run 00:00:30 00:00:45 in.mkv
# this would cut the video from 30s to 45s

strt="$1"
finish="$2"
input="$3"
[ -n "$4" ] && dest="$4" || dest='./out.mp4'

ffmpeg -i "$input" -ss "$strt" -to "$finish" -async 1 "${dest}"
