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
GAMEDIR=$PORTFOLDER/Huntdown

$ESUDO mkdir ~/.config/unity3d
$ESUDO mkdir ~/.config/unity3d/Coffee\ Stain\ Publishing
$ESUDO rm -rf ~/.config/unity3d/Coffee\ Stain\ Publishing/Huntdown
$ESUDO ln -s /$GAMEDIR/savedata ~/.config/unity3d/Coffee\ Stain\ Publishing/Huntdown

$ESUDO cp $GAMEDIR/gamedata/lib/libsteam_api.so $GAMEDIR/gamedata/Huntdown_Data/Plugins/libsteam_api.so
#Copy configuration over

cd $GAMEDIR/gamedata

export LD_LIBRARY_PATH="$GAMEDIR/lib"
$ESUDO chmod 666 /dev/uinput

# $GPTOKEYB "Huntdown.x86_64" xbox360 -c "$GAMEDIR/Huntdown.gptk" &
$PORTFOLDER/MAINLINE/run.sh box64 $GAMEDIR/gamedata/Huntdown.x86_64 2>&1 | tee $GAMEDIR/log.txt
# $ESUDO kill -9 $(pidof gptokeyb)
$ESUDO systemctl restart oga_events &
unset 

printf "\033c" >> /dev/tty1