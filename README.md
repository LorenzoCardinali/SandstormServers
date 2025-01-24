# SandstormServers
Common files and script for Sandstorm servers used in SPL and SandstormItalia community

# How to make a server from scratch (Debian)
1. Install required dependencies
```sh
sudo dpkg --add-architecture i386
sudo apt update
sudo apt install bc binutils bsdmainutils bzip2 ca-certificates cpio curl distro-info file gzip hostname jq lib32gcc-s1 lib32stdc++6 libsdl2-2.0-0:i386 netcat-openbsd pigz python3 tar tmux git unzip util-linux uuid-runtime wget xz-utils -y
sudo apt autoremove -y
```
2. Open ports needed for the server (optional step)
```sh
sudo ufw enable && sudo ufw allow ssh && sudo ufw allow 27102:27105/udp && sudo ufw allow 27131:27134/udp && sudo ufw allow 27015:27018/tcp
```
3. Add a new user and login into it
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
5. Download [makeServer.sh](makeServer.sh)
```sh
wget -O makeServer.sh https://raw.githubusercontent.com/LorenzoCardinali/SandstormServers/main/makeServer.sh && chmod +x makeServer.sh
```
6. Execute [makeServer.sh](makeServer.sh) adding the wanted server name as parameter
```sh
bash makeServer.sh <MyServerName>
```
7. Follow the installation
8. Edit the following config files as needed
- <ServerDirectory>/serverfiles/Insurgency/Saved/Config/LinuxServer/Game.ini
- <ServerDirectory>/lgsm/config-lgsm/inssserver/<MyServerName>.cfg
9. Follow [this guide](https://insurgencysandstorm.mod.io/guides/server-admin-guide#read22) to get a token for mods
10. Start the server
```sh
./<MyServerName> start
```

# How to update your server
1. Install git in your machine
```sh
sudo apt update && sudo apt install git wget
```
2. Get in the main folder of the sandstorm server
3. Download [updateFiles.sh](updateFiles.sh) and execute it
```sh
wget -O updateFiles.sh https://raw.githubusercontent.com/LorenzoCardinali/SandstormServers/main/updateFiles.sh && chmod +x updateFiles.sh && ./updateFiles.sh
```
