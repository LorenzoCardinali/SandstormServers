#!/bin/bash
  ###### ######## ####### #######  ###  #######
###           ##       ##      ## ###         
###      #######  ######  ###  ## ###  #######
###      ###  ##  ##  ##  ###  ## ###  ##     
 ######  ###  ##  ##   ## ######  ###  ##       

# path of the server folder
SERVER_PATH="$(dirname "${BASH_SOURCE[0]}")"

## DO NOT TOUCH ANYTHING BELOW THIS LINE! ##

cd $SERVER_PATH || exit 1
serversfile=servers

echo "[$(date)] : Restarting servers..." >> restartlog.txt

if ! [ -f $serversfile ]
then
	echo "[$(date)] : ERROR: Missing servers list" >> restartlog.txt
	exit
fi

echo "[$(date)] : Stopping Servers..." >> restartlog.txt
while read server_name
do
	./$server_name stop
done < $serversfile

echo "[$(date)] : Checking for updates..." >> restartlog.txt
./inssserver update

echo "[$(date)] : Starting servers..." >> restartlog.txt
while read server_name
do
	./$server_name start
done < $serversfile

echo "[$(date)] : Servers restarted." >> restartlog.txt
echo "" >> restartlog.txt