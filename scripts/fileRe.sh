#!/bin/sh
# this is way way easier to do in bash but I forced my self to do it in POSIX
# to grasp it's concepts even further.

jpg=0
png=0
jpeg=0

i+i=$((1+i))

cd "$1" || exit 1

ls | while read -r fl
do
    if echo "$fl" | grep -q -s -i '.png'; then
        mv "$fl" "${png}.png"
        png=$((1+png))
    elif echo "$fl" | grep -q -s -i '.jpg'; then
        mv "$fl" "${jpg}.jpg"
        jpg=$((1+jpg))
    elif echo "$fl" | grep -q -s -i '.jpeg'; then
        mv "$fl" "${jpeg}.jpeg"
        jpeg=$((1+jpeg))
    fi
done
