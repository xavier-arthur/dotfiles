#!/bin/sh

#Recebe um diretorio como parametro

cd "$1" || exit 1
count=0

for file in *.jpeg;
do
	mv "$file" "$count"
    count=$((count+1))
done
