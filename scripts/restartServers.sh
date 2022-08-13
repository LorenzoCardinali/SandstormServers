#!/bin/bash
  ###### ######## ####### #######  ###  #######
###           ##       ##      ## ###         
###      #######  ######  ###  ## ###  #######
###      ###  ##  ##  ##  ###  ## ###  ##     
 ######  ###  ##  ##   ## ######  ###  ##       

# path of the server folder
SERVER_PATH="$(dirname ${BASH_SOURCE[0]})"

## DO NOT TOUCH ANYTHING BELOW THIS LINE! ##

logWithDate () {
	echo "[$(date)] : $1" >> restartlog.txt
}

cd $SERVER_PATH || exit 1
serversfile=servers

logWithDate "Restarting servers..."

if ! [ -f $serversfile ]
then
	logWithDate "ERROR: Missing servers list"
	exit
fi

logWithDate "Stopping Servers..."
while read server_name
do
	./$server_name stop
done < $serversfile

logWithDate "Checking for updates..."
./inssserver update

logWithDate "Updating Server files..."
./updateFiles.sh

logWithDate "Starting servers..."
while read server_name
do
	./$server_name start
done < $serversfile

logWithDate "Servers restarted."

echo "" >> restartlog.txt
