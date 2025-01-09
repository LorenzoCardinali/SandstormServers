#!/bin/bash
# author Cardif     

# path of the server folder
SERVER_PATH="$(dirname ${BASH_SOURCE[0]})"

## DO NOT TOUCH ANYTHING BELOW THIS LINE! ##

logWithDate () {
	echo "[$(date)] : $1" >> restartlog.txt
}

# move to server directory if possible
cd "$SERVER_PATH" || exit 1
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
	bash "$server_name" stop
done < $serversfile

logWithDate "Checking for updates..."
bash inssserver update

logWithDate "Updating Server files..."
(curl https://raw.githubusercontent.com/LorenzoCardinali/SandstormServers/main/updateFiles.sh > updateFiles.sh) > /dev/null 2>&1
chmod +x updateFiles.sh
bash updateFiles.sh

logWithDate "Starting servers..."
while read server_name
do
	bash "$server_name" start
done < $serversfile

logWithDate "Servers restarted."

echo "" >> restartlog.txt
