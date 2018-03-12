#!/bin/bash

# Install Firefox_SPC (v51) for a local users
# written by Tobias Morrison - www.tobiasmorrison.com
#
# Place a copy of Firefox_SPC that exists in a DMG in /Library/Management/Utilities
# into ~/Applications for a user and add it to their Dock.
# Designed to be triggered with outset/login-once

## variables
# dockutil path
dockutil="/usr/local/bin/dockutil"

# path to local Applications folder
localApps="${3}/Users/${USER}/Applications"

# path to Firefox_SPC DMG
firefoxApp="${3}/Library/Management/bin/Firefox_SPC.app"


## functions
# check for existence of ~/Applications, create directory and set permissions if path does not exist
createLocalDir() { #path to ~/Applications
	if [ ! -d "$1" ]; then
		/bin/echo "~/Applications does not exist. Creating the directory."
		/bin/mkdir -p "$1"
		/usr/sbin/chown "$USER":staff "$1"
		/bin/chmod 700 "$1"
	else
		/bin/echo "~/Applications already exists. Proceeding."
	fi
}


# mount dmg and move app to ~/Applications
addFirefox() { #path to Firefox_SPC.app, path to local Applications folder
	/bin/cp -R "$firefoxApp" "$2"/Firefox_SPC.app
	/bin/echo "Copying Firefox_SPC to ~/Applications."
}

## All the things!
# directory function
createLocalDir "$localApps"

# copy function
addFirefox "$firefoxApp" "$localApps"

# dockutil --add

$dockutil --add ${localApps}/Firefox_SPC.app

exit 0