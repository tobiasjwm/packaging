#!/bin/bash

# tobiasmorrison.com
# created: 20 Aug 2019

# Install the file Exhibit_Stamp.pdf in the path `~/Library/Application Support/Adobe/Acrobat/DC/Stamps/`. 
# This script is written for use with Outset's login-once function
# https://github.com/chilcote/outset/wiki

# variables
loggedInUser=`python -c 'from SystemConfiguration import SCDynamicStoreCopyConsoleUser; import sys; username = (SCDynamicStoreCopyConsoleUser(None, None, None) or [None])[0]; username = [username,""][username in [u"loginwindow", None, u""]]; sys.stdout.write(username + "\n");'`
srcDir="/Library/Management/Utilities"
tgtDir="/Users/${loggedInUser}/Library/Application Support/Adobe/Acrobat/DC/Stamps"

# Check for and remove any existing versions
/usr/bin/find "$tgtDir" -iname "Exhibit-Stamp*.pdf" -delete

# Check for the Adobe DC directory and create it if it does not exist
if [ ! -e "$tgtDir" ]
then
	/bin/mkdir -p "$tgtDir"/
fi

# Copy the new file into place
/bin/cp "$srcDir"/Exhibit_Stamp.pdf "$tgtDir"/Exhibit_Stamp.pdf