#!/bin/bash

# setpdfpenprodefault.sh

# Quick script that calls cdef.app to set PDFpenPro as the default UTI handler for PDFs.

CDEF="/usr/local/bin/cdef.app/Contents/MacOS/cdef"
PPP="/Applications/PDFpenPro.app"

if [ -e "$PPP" ] ; then
	$CDEF -writeDefaultUti com.adobe.pdf com.smileonmymac.PDFpenPro
	exit 0
else
	echo "PDFpenPro.app is not installed. Exiting."
	exit 1
fi