#!/bin/bash
# PORTMASTER: openxcom.zip, OpenXcomEX.sh

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
$ESUDO chmod 666 /dev/uinput

GAMEDIR=/$directory/ports/openxcom

export TEXTINPUTINTERACTIVE="Y"
export TEXTINPUTNOAUTOCAPITALS="Y"

export LD_LIBRARY_PATH="$GAMEDIR/libs"

#To be PR'd into portmaster
if [[ -e "/dev/input/by-path/platform-gou_joypad-event-joystick" ]]; then
  DEVICE="03001354474f2d556c74726120476100"
  param_device="ogu"
  LOWRES="Y"
fi

# Load custom SDL if device is OGU on JELOS
if [ "${OS_NAME}" == "JELOS" ] && [ $param_device == "ogu" ]; then
  export SDL_DYNAMIC_API=$GAMEDIR/libs/libSDL2-2.0.so.0-custom
fi

if [ "${OS_NAME}" == "JELOS" ] && [ $param_device == "rg552" ]; then
  unset SDL_VIDEODRIVER
fi

# Set edge scroll if there is only one analog stick
if [$ANALOGSTICKS == 1]; then
  EDGE_SCROLL=1
else
  EDGE_SCROLL=0
fi

# Massage game config
sed -i "/^[[:space:]]*battleEdgeScroll:/ s/:.*/: $EDGE_SCROLL/" $GAMEDIR/config/options.config

cd $GAMEDIR/gamedata

$GPTOKEYB  "openxcom" $HOTKEY textinput -c "$GAMEDIR/openxcom.gptk" &
./openxcom  -user "$GAMEDIR/user" -config "$GAMEDIR/config" 2>&1 | tee -a ./log.txt
$ESUDO kill -9 $(pidof gptokeyb)
$ESUDO systemctl restart oga_events &
printf "\033c" >> /dev/tty1