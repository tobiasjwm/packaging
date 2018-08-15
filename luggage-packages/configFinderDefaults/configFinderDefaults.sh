#!/bin/bash

#	configFinderDefaults.sh
#	version: 1.0
#	created: 23 Feb 2018
#	author: Tobias Morrison
#
#	A script to configure sane defaults in a new user account.
#	Choices are based on years of feedback from clients. Nothing
#+	is forced here and users can customise their envoiroment
#+	after this has run.
#
#	Designed to run as an Outset 'login-once' script.

###	Set PATH ###

PATH=/usr/bin:/bin:/usr/sbin:/sbin export PATH

###	Variables ###

# Where is mysides? Not in the PATH. Let's set it.
mySides=/usr/local/bin/mysides

# Get the Username of the currently logged user
loggedInUser=`/bin/ls -l /dev/console | /usr/bin/awk '{ print $3 }'`


### Give the Finder Sidebar sane defaults ###

# Check that mysides is installed then run
if [ -e /usr/local/bin/mysides ]
then
	$mySides remove All\ My\ Files file:///System/Library/CoreServices/Finder.app/Contents/Resources/MyLibraries/myDocuments.cannedSearch/ && sleep 2
	$mySides remove iCloud x-apple-finder:icloud && sleep 2
	sfltool add-item com.apple.LSSharedFileList.FavoriteItems file:///Applications && sleep 2
	sfltool add-item com.apple.LSSharedFileList.FavoriteItems file:///Users/$loggedInUser/Desktop && sleep 2
	sfltool add-item com.apple.LSSharedFileList.FavoriteItems file:///Users/$loggedInUser/Documents && sleep 2
	sfltool add-item com.apple.LSSharedFileList.FavoriteItems file:///Users/$loggedInUser/Downloads && sleep 2
	touch /Users/$loggedInUser/.sidebarshortcuts
fi

### Set Finder preferences ###

# New Window opens ~/Desktop
defaults write com.apple.finder NewWindowTarget PfDe

# Default Finder search path is current folder
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Set Show scroll bars to 'always'
defaults write -g AppleShowScrollBars -string "Always"

# Display mounted server shares
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true

### Expand Save and Print Dialogs ###
defaults write -g NSNavPanelExpandedStateForSaveMode -bool true
defaults write -g PMPrintingExpandedStateForPrint -bool true


### Refresh cached preferences ###
killall cfprefsd