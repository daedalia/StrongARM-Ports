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

export PAN_MESA_DEBUG=gl3
export BOX64_LOG=1
export SDL_DYNAMIC_API=libSDL2-2.0.so.0

$ESUDO cp $GAMEDIR/gamedata/lib/libsteam_api.so $GAMEDIR/gamedata/VirtuaVerse_Data/Plugins/libsteam_api.so

$ESUDO mkdir ~/.config/unity3d
$ESUDO mkdir ~/.config/unity3d/Theta\ Division\ Games
$ESUDO rm -rf ~/.config/unity3d/Theta\ Division\ Games/VirtuaVerse
$ESUDO ln -s /$GAMEDIR/savedata ~/.config/unity3d/Theta\ Division\ Games/VirtuaVerse


cd $GAMEDIR/gamedata

box64 VirtuaVerse.x86_64 2>&1 | tee $GAMEDIR/log.txt
ESUDO kill -9 $(pidof gptokeyb)
$ESUDO systemctl restart oga_events