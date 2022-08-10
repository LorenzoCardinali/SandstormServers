#!/bin/bash
  ###### ######## ####### #######  ###  #######
###           ##       ##      ## ###         
###      #######  ######  ###  ## ###  #######
###      ###  ##  ##  ##  ###  ## ###  ##     
 ######  ###  ##  ##   ## ######  ###  ## 

port=${1}
queryport=${2}
rconport=${3}
rconpassword=${4}
servername=${5}
serverpassword=${6}
defaultmap=${7}
defaultscenario=${8}
maxplayers=${9}
bots=${10}
spawnprotection=${11}
mutators=${12}
mapcycle=${13}
modsfile=${14}
modmap=${15}
modscenario=${16}
enablecheats=${17}
gamestats=${18}
gst=${19}
gslt=${20}

travelparameters="${defaultmap}?Scenario=${defaultscenario}?MaxPlayers=${maxplayers}"

if [ "${bots}" == "true" ]
then
	travelparameters="${travelparameters}?bBots=1"
fi

if [ ! "${spawnprotection}" == "true" ]
then
	spawnprotection="-DisableSpawnProtection"
else
        spawnprotection=""
fi

if [ "${modmap}" == "" ]||[ "${modscenario}" == "" ]
then
        modtravelparameters="${defaultmap}?Scenario=${defaultscenario}"
else
        modtravelparameters="${modmap}?Scenario=${modscenario}"
fi

if [ ! "${modsfile}" == "" ]
then
        modsfile="-Mods -ModList=${modsfile}.txt -ModDownloadTravelTo=${modtravelparameters}"
fi

if [ ! "${serverpassword}" == "" ]
then
        travelparameters="${travelparameters}?password=\"${serverpassword}\""
fi

if [ ! ${mutators} == "" ]
then
        mutators="-mutators=\"${mutators}\""
fi

if [ ! ${mapcycle} == "" ]
then
        mapcycle="-MapCycle=${mapcycle}"
fi

if [ ${enablecheats} == "true" ]
then
        cheatsenabled="-EnableCheats"
else
        cheatsenabled=""
fi

if [ ${gamestats} == "true" ]
then
        gst="-GameStatsToken=${gst}"
else
        gst=""
fi

echo "${travelparameters} -useksm -ksmmergeall -hostname=\"${servername}\" -Port=${port} -QueryPort=${queryport} -Rcon -RconPassword=\"${rconpassword}\" -RconListenPort=${rconport} -log -motd ${mutators} ${mapcycle} -GSLTToken=${gslt} ${gst} ${cheatsenabled} ${spawnprotection} ${modsfile}"