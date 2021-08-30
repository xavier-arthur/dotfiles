#!/bin/sh

file="$1"
[ -z "$2" ] && dest="./" || dest="$2"

case $(echo "$file" | grep -o '\..*') in
    .tar|.tar.xz|.tar.gz) tar -xf "$file" -C "$dest" ;;
    .rar) unrar x "$file" "$dest" ;;
    .zip) unzip "$file" "$dest" ;;
    *) echo "extension not supported try again" || exit 1
esac
