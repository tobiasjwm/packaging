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
firefoxDmg="${3}/Library/Management/Utilities/Firefox_SPC_51.0.1_EN.dmg"

# DMG mountpoint
mnt="${3}/Volumes/Firefox_SPC/"


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
addFirefox() { #path to Firefox DMG, path to local Applications folder
	/bin/echo "Mounting Firefox_SPC DMG."
	/usr/bin/hdiutil attach "$1" -quiet -nobrowse
	/bin/echo "Copying Firefox_SPC to ~/Applications."
	/bin/cp "$mnt"/Firefox_SPC.app "$2"/Firefox_SPC.app
	/bin/echo "Ejecting Firefox_SPC DMG."
	/usr/bin/hdiutil eject "$mnt" -quiet
}

## All the things!
# directory function
createLocalDir "$localApps"

# copy function
addFirefox "$firefoxDmg" "$localApps"

# dockutil -add

$dockutil --add '${localApps}/Firefox_SPC.app'

exit 0