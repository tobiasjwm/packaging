#!/bin/sh

# Get current version of installed Brief Encounter.app
version="$(/usr/libexec/plistbuddy -c Print:CFBundleShortVersionString: '/Applications/Brief EnCounter/Brief EnCounter.app/Contents/Info.plist' 2>/dev/null)"

# Compare with the version we want to install
if [[ $version < 5.5.41 ]]; then
	exit 0
else
	exit 1
fi