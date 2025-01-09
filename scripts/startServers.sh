#!/bin/bash
# author Cardif     

# move to script directory if possible
cd "$(dirname "${BASH_SOURCE[0]}")" || exit 1

serversfile=$(pwd)/servers

if ! [ -f "$serversfile" ]
then
	echo Missing servers list file
	exit
fi

while read server_name
do
	"$(pwd)"/"$server_name" start
done < "$serversfile"