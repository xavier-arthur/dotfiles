#!/bin/bash

function spinningBar() {
    itens=(\\ \| / -)
    while true
    do
        for i in "${itens[@]}"
        do
            printf "$i"
            printf "\b"
            sleep 0.1
        done
    done
}

spinningBar
