#!/bin/sh
# Check for the existence of the MozyPro Pref Pane
if [ -e "/Library/PreferencePanes/MozyPro.prefPane" ]; then
	# MozyPro still exists. Tell Munki to remove.
	echo "MozyPro found. Running uninstall script."
	exit 0
else
	exit 1
fi