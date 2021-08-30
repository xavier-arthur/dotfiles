#!/bin/sh

[ -z "$1" ] || xdg-open "$1" > /dev/null 2>&1 & exit 0
