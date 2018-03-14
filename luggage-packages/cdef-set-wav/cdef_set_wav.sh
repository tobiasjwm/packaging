#!/bin/bash

# cdef-set-wav.sh

# Quick script that calls cdef.app to set QuickTimeX as the default UTI handler for WAV and MP4 files.

# user-defined variables
WAV=com.microsoft.waveform-audio
MPF=public.mpeg-4
QTX=com.apple.QuickTimePlayerX

# define cdef
CDEF="/usr/local/bin/cdef.app/Contents/MacOS/cdef"

$CDEF -writeDefaultUti $WAV $QTX
$CDEF -writeDefaultUti $MPF $QTX

/bin/echo "Exit code is $?."
