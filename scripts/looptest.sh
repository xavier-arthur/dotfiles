#!/bin/sh

STAHP="true"

while [ "$STAHP" = "true" ]; do
    printf "do you wish to continue? y/n:" && read STAHP
	[ "$STAHP" = "y" ] && STAHP="true"
done
