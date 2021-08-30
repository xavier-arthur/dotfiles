#!/bin/sh

rmover() {

    dir="$1"

    if [ -n "$dir" ];then
        cd "$dir" 2> /dev/null ||
        echo "invalid directory" ||
        exit 1
    else
        dir="$(pwd)"
    fi

	echo "You entered the deleter!"
    printf "Enter a ext:"
	read -r local_ext

    echo
    if ls ./*."$local_ext" >/dev/null 2>&1;then
        ls ./*."$local_ext"
    else
        echo "$(pwd) contains no .${local_ext} files, exiting..."
        exit 2
    fi
    echo

    printf "delete all %s files in %s? [y/*] " "$local_ext" "$dir"
    read -r temp
    [ "$temp" != "y" ] && exit 0
    echo

	for local_file in *."$local_ext"
	do
		rm "$local_file" &&
        printf "Deleting %s\tDONE!\n" "$local_file"
	done

	exit 0
}

rmover "$1"
