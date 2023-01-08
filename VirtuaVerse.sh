#!/bin/bash

if [ -d "/opt/system/Tools/PortMaster/" ]; then
  controlfolder="/opt/system/Tools/PortMaster"
elif [ -d "/opt/tools/PortMaster/" ]; then
  controlfolder="/opt/tools/PortMaster"
else
  controlfolder="/roms/ports/PortMaster"
fi

source $controlfolder/control.txt

get_controls

PORTFOLDER=/storage/roms/ports
GAMEDIR=$PORTFOLDER/VirtuaVerse

$ESUDO cp $GAMEDIR/gamedata/lib/libsteam_api.so $GAMEDIR/gamedata/VirtuaVerse_Data/Plugins/libsteam_api.so

cd $GAMEDIR/gamedata

$PORTFOLDER/MAINLINE/run.sh box64 VirtuaVerse.x86_64 2>&1 | tee $GAMEDIR/log.txt
ESUDO kill -9 $(pidof gptokeyb)
$ESUDO systemctl restart oga_events