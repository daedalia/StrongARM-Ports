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

export PAN_MESA_DEBUG=gl3
export BOX64_LOG=1
export SDL_DYNAMIC_API=libSDL2-2.0.so.0

cd $GAMEDIR/gamedata

box64 $GAMEDIR/amd64/SuperMeatBoy 2>&1 | tee $GAMEDIR/log.txt
$ESUDO systemctl restart oga_events