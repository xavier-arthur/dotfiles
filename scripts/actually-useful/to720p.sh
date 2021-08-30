#!/usr/bin/sh

# takes a 1080p or higher and transforms it to 720p using ffmpeg
# Arthur Xavier : garok102@gmail.com

input="$1"
output="$2"

ffmpeg -i "$input" -vf scale=-1:720 -c:v libx264 -crf 18 -preset veryslow -c:a copy "$output"
