#!/bin/sh

cd "$1" || exit 1

for file in *
do
    mv "$file" "$(echo "$file" | sed 's/[0-9]*\s*')"
done
