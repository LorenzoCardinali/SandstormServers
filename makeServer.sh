#!/bin/bash
  ###### ######## ####### #######  ###  #######
###           ##       ##      ## ###         
###      #######  ######  ###  ## ###  #######
###      ###  ##  ##  ##  ###  ## ###  ##     
 ######  ###  ##  ##   ## ######  ###  ##       

# path of the server folder
SERVER_PATH=$(pwd)
TXT_PATH="$SERVER_PATH/serverfiles/Insurgency/Config/Server"
INI_PATH="$SERVER_PATH/serverfiles/Insurgency/Saved/Config/LinuxServer"
LGSM_PATH="$SERVER_PATH/lgsm/config-lgsm/inssserver"
TMP_PATH=$(mktemp -d)
SERVER_NAME=$1

# check if server name is not empty
if [ "$SERVER_NAME" == "" ]
then
  echo "Error: Missing server name"
  exit 1
fi

##################
### LGSM files ###
##################

wget -O linuxgsm.sh https://linuxgsm.sh > /dev/null 2>&1
chmod +x linuxgsm.sh
bash linuxgsm.sh inssserver > /dev/null 2>&1
./inssserver install

####################
### Server files ###
####################

# clone of the repo in a temp directory
git clone -q https://github.com/LorenzoCardinali/SandstormServers.git $TMP_PATH

# make needed directories
mkdir --parents $TXT_PATH
mkdir --parents $INI_PATH

# move scripts
mv -f $TMP_PATH/updateFiles.sh $SERVER_PATH
mv -f $TMP_PATH/scripts/* $SERVER_PATH
chmod +x *.sh 

# move txt and ini files
mv -f $TMP_PATH/files/txtFiles/* $TXT_PATH
mv -f $TMP_PATH/files/iniFiles/* $INI_PATH

# move LGSM config file
mv -f $TMP_PATH/files/Server.cfg $LGSM_PATH/$SERVER_NAME.cfg

# make Server script
cp inssserver $SERVER_NAME

# make servers file
echo "$SERVER_NAME" > servers

################
### SSH keys ###
################

# make needed directory
mkdir --parents $HOME/.ssh

# move keys file
mv -f $TMP_PATH/files/authorized_keys $HOME/.ssh

# set permissions 
chmod 700 $HOME/.ssh
chmod 600 $HOME/.ssh/authorized_keys

###############
### Crontab ###
###############

# write out current crontab
(crontab -l > $TMP_PATH/mycron) > /dev/null 2>&1
# echo new cron into cron file
echo "00 07 * * * $SERVER_PATH/restartServers.sh > /dev/null 2>&1" >> $TMP_PATH/mycron
# install new cron file
crontab $TMP_PATH/mycron

# delete temp directory
rm -rf $TMP_PATH