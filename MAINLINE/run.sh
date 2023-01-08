#!/bin/bash

# export WAYLAND_DISPLAY=wayland-0
export PAN_MESA_DEBUG=gl3
export BOX64_LOG=1
export BOX86_LOG=${BOX64_LOG}
export SDL_DYNAMIC_API=libSDL2-2.0.so.0
export PATH=~/roms/ports/MAINLINE/box86:~/roms/ports/MAINLINE/box64:$PATH
export BOX86_LD_LIBRARY_PATH=~/roms/ports/MAINLINE/box86/x86lib/
export BOX64_LD_LIBRARY_PATH=~/roms/ports/MAINLINE/box64/x64lib/

"${@}"
