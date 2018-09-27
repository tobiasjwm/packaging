#!/bin/bash

# setpdfpenprodefault.sh

# Quick script that calls cdef.app to set Adobe Acrobat Reader DC as the default UTI handler for PDFs.

CDEF="/usr/local/bin/cdef.app/Contents/MacOS/cdef"
ADC="/Applications/Adobe Acrobat Reader DC.app"

if [ -e "$ADC" ] ; then
	$CDEF -writeDefaultUti com.adobe.pdf com.adobe.Reader
	exit 0
else
	echo "Adobe Acrobat Reader DC.app is not installed. Exiting."
	exit 1
fi