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
GAMEDIR=$PORTFOLDER/SuperMeatBoy

cd $GAMEDIR/gamedata

$PORTFOLDER/MAINLINE/run.sh box64 $GAMEDIR/amd64/SuperMeatBoy 2>&1 | tee $GAMEDIR/log.txt
ESUDO kill -9 $(pidof gptokeyb)
$ESUDO systemctl restart oga_events