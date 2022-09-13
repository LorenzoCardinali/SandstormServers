# SandstormServers
Common files and script for Sandstorm servers used in SPL and ICL community

# How to make a server from scratch (Debian 11)
1. Install the needed packages:
```sh
sudo dpkg --add-architecture i386; sudo apt update; sudo apt install curl wget file tar bzip2 gzip unzip bsdmainutils python3 util-linux ca-certificates binutils bc jq tmux netcat lib32gcc-s1 lib32stdc++6 git htop distro-info libsdl2-2.0-0:i386; sudo apt autoremove
```
2. Open ports needed for the server:
```sh
sudo ufw enable && sudo ufw allow ssh && sudo ufw allow 27102:27105/udp && sudo ufw allow 27131:27134/udp && sudo ufw allow 27015:27018/tcp
```
3. Add a new user and login into it (optional):
```sh
sudo adduser <UserName>
```
```sh
su - <UserName>
```
4. Make a folder for your server and get in it:
```sh
mkdir <ServerDirectory> && cd <ServerDirectory>
```
5. Dowload [makeServer.sh](makeServer.sh):
```sh
wget -O makeServer.sh https://raw.githubusercontent.com/LorenzoCardinali/SandstormServers/main/makeServer.sh && chmod +x makeServer.sh
```
6. Execute [makeServer.sh](makeServer.sh) adding the wanted server name as parameter:
```sh
./makeServer.sh <MyServerName>
```
7. Follow the installation
8. Edit the following config files as needed:
- %ServerDirectory%/serverfiles/Insurgency/Saved/Config/LinuxServer/Game.ini
- %ServerDirectory%/lgsm/config-lgsm/inssserver/%MyServerName%.cfg
9. Follow this guide to get a token for mods (https://insurgencysandstorm.mod.io/guides/server-admin-guide#read22)
10. Start the server
```sh
./<MyServerName> start
```
11. Done

# How to update your server
1. Install git in your machine:
```sh
sudo apt update && sudo apt install git wget
```
2. Get in the main folder of the sandstorm server
3. Download [updateFiles.sh](updateFiles.sh) and execute it:
```sh
wget -O updateFiles.sh https://raw.githubusercontent.com/LorenzoCardinali/SandstormServers/main/updateFiles.sh && chmod +x updateFiles.sh && ./updateFiles.sh
```
4. Done
