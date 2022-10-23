#!/bin/sh
# script to auto-generate my github dotfiles

set -e
# &-> autoquits on the first error

if [ -z "$1" ];then
    output="$HOME/Documents/repos/dotfiles"
else
    output="$1"
fi

( mkdir -p "$output" > /dev/null 2>&1; )
# &-> execute this in a subshell so set -e doesn't quit if directory already
# exists

paths=\
"$HOME/.zshrc
$HOME/.config/nvim/init.vim
$HOME/.config/alacritty/alacritty.yml"

for i in $paths; do
    cp "$i" "$output"
done
