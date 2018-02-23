#!/bin/bash

# munki admin-provided conditional. 
# thank you to @eholtam on MacAdmins Slack. 
# https://macadmins.slack.com/archives/C04QVPFGU/p1518538489000816

plistLocation="/Library/Managed Installs/ConditionalItems"
applicationLocation="/Applications/Box Sync.app"
prefName=isBoxSyncInstalled

#Verify a user is logged in
if [ -e "${applicationLocation}" ]
then
    defaults write "${plistLocation}" "${prefName}" -bool true
else
    defaults write "${plistLocation}" "${prefName}" -bool false
fi
plutil -convert xml1 ${plistLocation}".plist