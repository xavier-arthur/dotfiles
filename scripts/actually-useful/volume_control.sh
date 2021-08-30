#!/bin/sh
# usage: volume_contro INPUT VOlUME OUTPUT
# volume is set to 1.0 by default

input="$1"
volume="$2"
ouput="$3"

ffmpeg -i "$input" -filter:a "volume=$volume" "$ouput"
