#!/bin/bash

# Shell scripts to add items to a python3 list
# It receives the file path as an argument

BUFFER=()

while true
do
    [ -f "$1" ] && cp "$1" "adderBackup" || exit 1   # creates a backup just in case

    read -p "ADD SOMETHING TO THE LIST:" ADD
    [ "$ADD" == 'q' ] && break

    if grep "$ADD" "$1" >/dev/null 2>&1; then
        if [[ " ${BUFFER[@]} " =~ " ${ADD} " ]]; then
            echo "word already in list"
            continue
        fi
    else
        echo "word added to buffer"
        BUFFER+=(,"$ADD")
    fi

done

echo "[${BUFFER}]" > "$2"
