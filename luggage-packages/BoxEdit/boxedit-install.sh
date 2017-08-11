#!/bin/bash

# outset login-once script to install Box Edit.app and Box Local Com Server.app
# into ~/Library/Application Support/Box/Box\ Edit/
# This script must be run as $USER

# System variables
target="$3"
ourUser="$(whoami)"

# Directory variables
appDir="${target}/Applications/Install Box Tools.app/Contents/Resources"
tgtDir="${target}/Users/$ourUser/Library/Application Support/Box/Box Edit"

# App variables, because there are spaces
boxEdit="Box Edit.app"
boxSvr="Box Local Com Server.app"

# Version checks
#appVer=`/usr/bin/defaults read "$appDir/$boxEdit/Contents/Info.plist" CFBundleShortVersionString`
#userVer=`/usr/bin/defaults read "$tgtDir/$boxEdit/Contents/Info.plist" CFBundleShortVersionString`


# Function to create our directory
createDir() { # path mode
    if [ ! -d "$1" ]; then
        mkdir -p "$1"
        chmod "$2" "$1"
    fi
}

# Function to move Box Edit.app and Box Local Com Server.app into local account
copyApps() { # srcdir destdir srcItem1 srcItem2
	# Check if our directory exists and create it if it does not
    if [ -e "${target}/$1/$3" ]; then
    	/bin/cp -R "$1/$3" "$2/$3"
    	/bin/cp -R "$1/$4" "$2/$4"
    else
    	/bin/echo "Install Box Tools.app is not installed on this device."
    fi
}

# Create directory
createDir "$tgtDir" 755

# Copy apps to local user folder
copyApps "$appDir" "$tgtDir" "$boxEdit" "$boxSvr"

# Launch apps to activate
/usr/bin/open "${target}/$tgtDir/$boxEdit"
/usr/bin/open "${target}/$tgtDir/$boxSvr"