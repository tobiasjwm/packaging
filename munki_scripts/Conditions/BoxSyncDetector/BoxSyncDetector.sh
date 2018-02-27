#!/bin/bash

#	munki admin-provided conditional. 
#	thank you to @eholtam on MacAdmins Slack. 
#	https://macadmins.slack.com/archives/C04QVPFGU/p1518538489000816

plistLocation="/Library/Managed Installs/ConditionalItems"
applicationLocation="/Applications/Box Sync.app/Contents/MacOS/Box Sync"
prefName=isBoxSyncInstalled

#	Check to see if Box Sync is installed
if [ -e "${applicationLocation}" ]
    then
        defaults write "${plistLocation}" "${prefName}" -bool true
    else
    	defaults write "${plistLocation}" "${prefName}" -bool false
fi
#	Since 'defaults' outputs a binary plist, we need to ensure that munki can read it by 
#+	converting it to xml 
plutil -convert xml1 "${plistLocation}".plist