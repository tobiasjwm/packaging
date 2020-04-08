#!/bin/bash
# munki postinstall_script for OverSight.app
/Library/Management/bin/OverSight_Installer.app/Contents/MacOS/OverSight_Installer -install

if [ $? == "OVERSIGHT: install ok!" ]; then
	exit 0
else
	exit 1
fi