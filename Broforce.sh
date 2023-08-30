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

$ESUDO chmod 666 /dev/tty1
printf "\033c" > /dev/tty1

PORTFOLDER=/storage/roms/ports
GAMEDIR=$PORTFOLDER/broforce

export LD_LIBRARY_PATH=$GAMEDIR/lib

$ESUDO cp $GAMEDIR/Options.xml $GAMEDIR/gamedata/Saves/Options.xml
$ESUDO cp $GAMEDIR/gamedata/lib/libsteam_api.so $GAMEDIR/gamedata/Broforce_Data/Plugins/x86_64/libsteam_api.so

cd $GAMEDIR/gamedata

$ESUDO chmod 666 /dev/uinput

$GPTOKEYB "Broforce.x86_64" xbox360 -c "$GAMEDIR/control.gptk" &

$PORTFOLDER/MAINLINE/run.sh box64 $GAMEDIR/gamedata/Broforce.x86_64 2>&1 | tee $GAMEDIR/log.txt
$ESUDO kill -9 $(pidof gptokeyb)

printf "\033c" >> /dev/tty1