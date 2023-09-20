#!/bin/bash

if [ -d "/opt/system/Tools/PortMaster/" ]; then
  controlfolder="/opt/system/Tools/PortMaster"
elif [ -d "/opt/tools/PortMaster/" ]; then
  controlfolder="/opt/tools/PortMaster"
elif [ -d "/roms/ports" ]; then
  controlfolder="/roms/ports/PortMaster"
 elif [ -d "/roms2/ports" ]; then
  controlfolder="/roms2/ports/PortMaster"
else
  controlfolder="/storage/roms/ports/PortMaster"
fi

source $controlfolder/control.txt
source $controlfolder/tasksetter

get_controls

GAMEDIR="/$directory/ports/fez"
cd "$GAMEDIR/gamedata"

# Grab text output...
$ESUDO chmod 666 /dev/tty0
printf "\033c" > /dev/tty0
echo "Loading... Please Wait." > /dev/tty0

# Setup mono
monodir="$HOME/mono"
monofile="$controlfolder/libs/mono-6.12.0.122-aarch64.squashfs"
$ESUDO mkdir -p "$monodir"
$ESUDO umount "$monofile" || true
$ESUDO mount "$monofile" "$monodir"

$ESUDO rm -rf ~/.local/share/FEZ
$ESUDO ln -s $GAMEDIR/savedata ~/.local/share/FEZ

$ESUDO rm -rf ~/.config/FEZ
$ESUDO ln -s $GAMEDIR/savedata ~/.config/FEZ

# Remove all the dependencies in favour of system libs - e.g. the included 
# newer version of FNA with patcher included
rm -f System*.dll mscorlib.dll FNA.dll Mono.*.dll

# Setup path and other environment variables
export FNA_PATCH="$GAMEDIR/dlls/FezPatches.dll"
export MONO_PATH="$GAMEDIR/dlls"
export LD_LIBRARY_PATH=$GAMEDIR/libs:$LD_LIBRARY_PATH
export PATH="$monodir/bin:$GAMEDIR/libs:$PATH"
#export MONO_LOG_LEVEL=debug


export FNA3D_FORCE_DRIVER=OpenGL
export FNA3D_OPENGL_FORCE_ES3=1

isitarkos=$(grep "title=" /usr/share/plymouth/themes/text.plymouth)
if [[ $isitarkos == *"ArkOS"* ]]; then
  $ESUDO perfnorm
fi


$ESUDO chmod 666 /dev/tty1
$ESUDO chmod 666 /dev/uinput
$GPTOKEYB "mono" &
$TASKSET mono FEZ.exe 2>&1 | tee $GAMEDIR/log.txt
$ESUDO kill -9 $(pidof gptokeyb)
$ESUDO systemctl restart oga_events &
$ESUDO umount "$monodir"
unset LD_LIBRARY_PATH

# Disable console
printf "\033c" >> /dev/tty1
printf "\033c" > /dev/tty0