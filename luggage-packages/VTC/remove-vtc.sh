#!/bin/bash

#	remove-vtc.sh
#	version: 0.1
#	created: 11 Oct 2017
#	author: Tobias Morrison
#
#	Find and remove existing Virtual TimeClock installs.
#	Designed as a preinstall script for Munki. 
#	Yes, I understand that Munki should just overwrite the existing app,
#!	but there are two versions of the app, and we want just one. So, cleanup.

# where's Waldo?
VTCP="/Applications/Virtual TimeClock Pro Client.app"
VTCU="/Applications/Virtual TimeClock User Client.app"

# Check and remove the apps
if [ -e "${VTCP}" ]; then
    /bin/echo "Found Virtual TimeClock. Will remove app at path ${VTCP}"
    /bin/rm -rf "${VTCP}"
fi

if [ -e "${VTCU}" ]; then
    /bin/echo "Found Virtual TimeClock. Will remove app at path ${VTCU}"
    /bin/rm -rf "${VTCU}"
fi

exit $?