#!/bin/bash
  ###### ######## ####### #######  ###  #######
###           ##       ##      ## ###         
###      #######  ######  ###  ## ###  #######
###      ###  ##  ##  ##  ###  ## ###  ##     
 ######  ###  ##  ##   ## ######  ###  ##       

# path of the server folder
SERVER_PATH="$(dirname "${BASH_SOURCE[0]}")"
CONFIG_PATH="$SERVER_PATH/serverfiles/Insurgency/Config/Server/"
TMP_PATH=$(mktemp -d)

cd $SERVER_PATH || exit 1

#echo server: $SERVER_PATH
#echo config: $CONFIG_PATH
#echo pwd: $(pwd)

# clone of the repo in a temp directory
git clone -q https://github.com/LorenzoCardinali/SandstormServers.git $TMP_PATH

# update scripts
mv -f $TMP_PATH/scripts/* $SERVER_PATH
chmod +x *.sh 

# update Admins.txt
mv -f $TMP_PATH/files/Admins.txt $CONFIG_PATH

# delete temp directory
rm -rf $TMP_PATH