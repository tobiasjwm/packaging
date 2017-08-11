#!/bin/bash

# outset login-once script to install Box Edit.app and Box Local Com Server.app
# into ~/Library/Application Support/Box/Box\ Edit/
# This script must be run as $USER

# System variables
target="$3"
ourUser="$(whoami)"

# Directory variables
appDir="${target}/Applications/Install\ Box\ Tools.app/Contents/Resources"
tgtDir="${target}/Users/$ourUser/Library/Application\ Support/Box/Box\ Edit"

# App variables, because there are spaces
boxEdit="Box\ Edit.app"
boxSvr="Box\ Local\ Com\ Server.app"

# Version checks
appVer=`/usr/bin/defaults read "$appDir/$boxEdit/Contents/Info.plist" CFBundleShortVersionString`
userVer=`/usr/bin/defaults read "$tgtDir/$boxEdit/Contents/Info.plist" CFBundleShortVersionString`


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
    	if [ appVer <= userVer ]; then
    		/bin/cp "$1/$3" "$2/$3"
    		/bin/cp "$1/$4" "$2/$4"
    	else
    		/bin/echo "Newer version already installed. Exiting."
    	fi
    else
    	/bin/echo "Install Box Tools.app is not installed on this device."
    fi
}



# unit tests
/bin/echo $ourUser
/bin/echo $appDir
/bin/echo $tgtDir
/bin/echo $appVer
/bin/echo $userVer