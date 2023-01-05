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
GAMEDIR=$PORTFOLDER/dandara

$ESUDO rm -rf ~/.config/unity3d
$ESUDO mkdir ~/.config/unity3d
$ESUDO mkdir ~/.config/unity3d/Long\ Hat\ House
$ESUDO ln -s /$GAMEDIR/savedata ~/.config/unity3d/Long\ Hat\ House/Dandara

cd $GAMEDIR/gamedata/Dandara_Data

$ESUDO chmod 666 /dev/uinput

$GPTOKEYB "Dandara.x86_64" xbox360 &

$PORTFOLDER/MAINLINE/run.sh box64 $GAMEDIR/gamedata/Dandara.x86_64 2>&1 | tee $GAMEDIR/log.txt
$ESUDO kill -9 $(pidof gptokeyb)

printf "\033c" >> /dev/tty1