#!/bin/bash
  ###### ######## ####### #######  ###  #######
###           ##       ##      ## ###         
###      #######  ######  ###  ## ###  #######
###      ###  ##  ##  ##  ###  ## ###  ##     
 ######  ###  ##  ##   ## ######  ###  ##       

# path of the server folder
SERVER_PATH="$(dirname "${BASH_SOURCE[0]}")"
CONFIG_PATH=$SERVER_PATH"/serverfiles/Insurgency/Config/Server/"

#echo server: $SERVER_PATH
#echo config: $CONFIG_PATH
#echo pwd: $(pwd)

# files source
ADMIN_FILE=https://raw.githubusercontent.com/LorenzoCardinali/SandstormServers/main/Admin.txt

# update Admin.txt
wget -qN $ADMIN_FILE -P $CONFIG_PATH
