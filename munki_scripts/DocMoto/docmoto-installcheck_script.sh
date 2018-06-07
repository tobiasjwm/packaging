#!/bin/sh

# Get current version of installed Brief Encounter.app
version="$(/usr/libexec/plistbuddy -c Print:CFBundleShortVersionString: '/Applications/DocMotoClient.app/Contents/Info.plist' 2>/dev/null)"

# Compare with the version we want to install
if [[ $version < 3.8.9 ]]; then
	exit 0
else
	exit 1
fi