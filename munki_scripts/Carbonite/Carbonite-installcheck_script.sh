#!/bin/bash -x

# This script does not deal with a version greater than the target. We will end up 
# hoping that installer will reject the install is a newer version is installed.
# Bash makes comparing floats difficult, and I am not clever, so it will have to wait
# another day.

# REPLACE with current installer version
installerVersion="10.3.5.236"
dcprotectSettings="/Library/Application Support/DCProtect/Service/LocalServiceSettings.config.xml"


# This will check Carbonite's odd versioning scheme.
carboniteVersion=$(grep  ClientVersion "$dcprotectSettings" | tr -d '\t' | sed 's/^<.*>\([^<].*\)<.*>$/\1/' | cut -f2 -d ">" | cut -f1 -d "<")

# Compare and determine if we have the same version installed.
if [ ! -f "$dcprotectSettings" ]; then
	echo "Carbonite is not installed. Exiting."
	exit 1

if [ "$carboniteVersion" == "$installerVersion" ]; then
	echo "Carbonite version $installerVersion already installed. Skipping."
	exit 2
else
	echo "Carbonite version $installerVersion not installed. Installing."
	exit 0
	fi
fi