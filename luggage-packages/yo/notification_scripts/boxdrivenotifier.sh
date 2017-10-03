#!/bin/bash

# boxdrivenotifier.sh

# Author: Tobias Morrison
# Date: 3 Oct 2017

# send a message to end-points to prompt employees to check out Box Drive.
#! requires Yo! > 2.0 https://github.com/sheagcraig/yo

# Set our variables

DRIVE="/Applications/Box.app"
SCHED="/usr/local/bin/yo_scheduler"

# Check for Box Drive before setting message for delivery

if [ -e "$DRIVE" ] ; then
	exit 1
else
	# this should be made into a function
	$SCHED \
	--title 'Box Drive Now Available' \
	--subtitle 'A Better Way to Access Your Box Files' \
	--info 'Click to find out more.' \
	--action-btn 'More Info…' \
	--action-path 'https://globalmac-it.itglue.com/DOC-1673628-1147218'
	