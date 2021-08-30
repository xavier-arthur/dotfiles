#!/bin/sh

adder() {

    if [ -e ./lista.py ]; then
        printf "file already exists, overwrite? [y/*] "
        read -r wrt
        [ "$wrt" = "y" ] && echo "vars = [" > lista.py || exit
    else
        echo "vars = [" > lista.py
    fi

    while true
    do
        a=0
        printf "type an item to append:"
        read -r appendix

        [ "$appendix" = "q" ] && break

        for line in $(cat "./lista.py")
        do
            [ "$line" = "$appendix," ] && a=1 && break
        done

        [ "$a" -eq 0 ] && echo "${appendix}," >> lista.py || echo "already in"
    done

    tac lista.py | sed -e '0,/,/{s/,//;}' | tac > tmp && mv tmp lista.py
    echo "]" >> lista.py
}

adder
