#!/bin/bash

#	remove_BriefClient.sh
#	version: 0.1
#	created: 8 Nov 2017
#	author: Tobias Morrison
#
#	Find and remove existing Brief Client installs.
#	Designed as a preinstall script for Munki. 
#	Yes, I understand that Munki should just overwrite the existing app,
#+  but the vendor is specific about removing existing installs. So, cleanup.

# where's Waldo?
baclient="/Applications/Brief Client.app"

# Check and remove the apps
if [ -e "${baclient}" ]; then
    /bin/echo "Found Brief Client. Will remove app at path ${baclient}"
    /bin/rm -rf "${baclient}"
fi

exit $?