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

GAMEDIR="/$directory/ports/swarmracer"

export PAN_MESA_DEBUG=gl3
export BOX64_LOG=1
export SDL_DYNAMIC_API=libSDL2-2.0.so.0

cd $GAMEDIR/gamedata

$ESUDO chmod 666 /dev/uinput
$GPTOKEYB "swarm" -c "$GAMEDIR/control.gptk" &
box64 $GAMEDIR/gamedata/swarm 2>&1 | tee $GAMEDIR/log.txt
$ESUDO kill -9 $(pidof gptokeyb)
unset LD_LIBRARY_PATH
printf "\033c" >> /dev/tty1
printf "\033c" > /dev/tty0
