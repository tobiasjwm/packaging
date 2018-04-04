#!/bin/bash

#	Check if a version of MRD exists and remove it 
#+	before installing v 10.x.

if [[ -e "/Applications/Microsoft Remote Desktop.app" ]] ; then
	/bin/echo "An older version of MRD exists. Removing."
	/bin/rm -R "/Applications/Microsoft Remote Desktop.app"
	/usr/sbin/pkgutil --forget com.microsoft.rdc.mac
fi