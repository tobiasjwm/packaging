#!/bin/sh

# Get current version of installed FileMaker Pro.app
version="$(/usr/libexec/plistbuddy -c Print:CFBundleShortVersionString: '/Applications/FileMaker Pro 16/FileMaker Pro.app/Contents/Info.plist' 2>/dev/null)"

# Compare with the version we want to install
if [[ $version < 16.0.5 ]]; then
    exit 0
else
    exit 1
fi