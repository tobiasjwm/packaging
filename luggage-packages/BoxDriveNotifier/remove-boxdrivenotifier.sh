#!/bin/bash

# boxdrivenotifier.py remover
# Author: Tobias Morrison
# Created: 28 Sep 2017

# get the UID for the logged-in user
user=$(/usr/bin/stat -f '%u' /dev/console)

# Check if a user is logged in and bootout the Agent if they are
if [[ ! -z "$user" ]]; then
	/bin/launchctl asuser ${user} /bin/launchctl unload /Library/LaunchAgents/com.github.tobiasjwm.boxdrivenotifier.plist
else
	exit 1
fi

# remove the LaunchAgent
rm -f /Library/LaunchAgents/com.github.tobiasjwm.boxdrivenotifier.plist

# remove the script
rm -f /Library/Management/bin/boxdrivenotifier.py