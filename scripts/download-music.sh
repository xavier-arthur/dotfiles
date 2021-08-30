#!/bin/bash

cat << EOF
 _____      _                                   _       
/__   \___ | |__  _ __ _   _    /\/\  _   _ ___(_) ___  
  / /\/ _ \| '_ \| '__| | | |  /    \| | | / __| |/ __| 
 / / | (_) | | | | |  | |_| | / /\/\ \ |_| \__ \ | (__  
 \/   \___/|_| |_|_|   \__,_| \/    \/\__,_|___/_|\___| 
                                                        

EOF

while true;
do
	cd ~/Music

	read -p "Insert the URL:" LINK

	read -p "do you want to download it into a directory? y/n:" CHOICE

	if [ "$CHOICE" == "y" ]; then
		read -p "Insert the directory name:" DIRNAM
		mkdir -p "$DIRNAM" ; cd "$dirnam"
	fi

	youtube-dl -i -x --audio-format mp3 --embed-thumbnail $LINK 

	read -p "Press q to quit or any key to download more songs:" EXT

	if [ "$EXT" == "q" ]; then
		break
	fi
done
