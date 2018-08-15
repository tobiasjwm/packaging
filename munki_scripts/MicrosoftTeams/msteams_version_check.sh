#!/bin/sh

# Get current version of installed DocMotoClient.app
version="$(/usr/libexec/plistbuddy -c Print:CFBundleShortVersionString: '/Applications/Microsoft Teams.app/Contents/Info.plist' 2>/dev/null)"

# Compare with the version we want to install
if [[ $version < 1.00.117852 ]]; then
	echo 'Older version present. Installing new version.'
	exit 0
else
	echo 'Current version installed. Skipping.'
	exit 1
fi