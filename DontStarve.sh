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
GAMEDIR=$PORTFOLDER/dontstarve

export PAN_MESA_DEBUG=gl3
export BOX64_LOG=1
export SDL_DYNAMIC_API=libSDL2-2.0.so.0

$ESUDO mkdir ~/.klei
$ESUDO rm -rf ~/.klei/DoNotStarve
$ESUDO ln -s /$GAMEDIR/savedata ~/.klei/DoNotStarve

cd $GAMEDIR/gamedata/bin

$GPTOKEYB "dontstarve" xbox360 -c "$GAMEDIR/control.gptk" &
box64 $GAMEDIR/gamedata/bin/dontstarve 2>&1 | tee $GAMEDIR/log.txt

$ESUDO kill -9 $(pidof gptokeyb)
unset SDL_GAMECONTROLLERCONFIG