#!/bin/sh

# shell script to compile commmon files which I use
# Arthur Xavier : garok102@gmail.com

ext=$(echo "$1" | grep '\..*')
compiler=""
# $1 : file
# $2 : output TODO implement

function comp_java() {

    if [ "${PWD##*/}" == "src" ]; then
        mkdir "../bin"
        javac "$1" -d "../bin"
    else
        javac "$1"
    fi
    exit
}

case ext in
    ".tex")
        compiler="xelatex"
        ;;
    ".c")
        compiler="gcc"
        ;;
    ".rs")
        compiler="rustc"
        ;;
    ".java")
        compiler="javac"
        ;;
esac

[ "$ext" == "javac" ] && comp_java


