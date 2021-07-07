#!/bin/bash

# tobiasmorrison.com
# created: 5 Apr 2021

# Install the PDF Sevice "Send to Outlook"" in the path `~/Library/PDF Services/`. 
# Install the Quick Action "Share with Outlook"" in the path `~/Library/Services/`. 
# This script is written for use with Outset's login-once function
# https://github.com/chilcote/outset/wiki

PATH=/usr/bin:/bin:/usr/sbin:/sbin export PATH

# variables
currentUser=$(python -c 'from SystemConfiguration import SCDynamicStoreCopyConsoleUser; import sys; username = (SCDynamicStoreCopyConsoleUser(None, None, None) or [None])[0]; username = [username,""][username in [u"loginwindow", None, u""]]; sys.stdout.write(username + "\n");')
srcDir="/Library/Management/Utilities"
pdfDir="$HOME/Library/PDF Services"
servicesDir="$HOME/Library/Services"
sendTo="Send to Outlook.workflow"
shareWith="Share with Outlook.workflow"

# Check for the PDF Services directory and create it if it does not exist.
if [ ! -d "$pdfDir" ]; then
	mkdir -p "$pdfDir"/
	chown "$currentUser":staff "$pdfDir"
	chmod 755 "$pdfDir"
fi

# Copy the PDF Service to the local directory
cp -R "$srcDir"/"$sendTo" "$pdfDir"/"$sendTo"

# Copy the Quick Action to the local directory
cp -R "$srcDir"/"$shareWith" "$servicesDir"/"$shareWith"