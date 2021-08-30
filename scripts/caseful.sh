#!/bin/bash

function handful () {
	while true
	do
		read -p "Do you want to exit? y/n:" LOCAL_CHOICE

		case "$LOCAL_CHOICE" in
			[yY] | [yY][eE][sS])
				echo "Exiting script. . ."
				exit 0
				;;
			[nN] | [nN][oO])
				echo "Running again"
				;;
			*)
				echo "Fala zeze bom dia cara"
				;;
		esac
	done

}

handful
