#!/bin/bash

# boxdrivenotifier.sh

# Author: Tobias Morrison
# Date: 3 Oct 2017

# send a message to end-points to prompt employees to check out Box Drive.
#! requires Yo! > 2.0 https://github.com/sheagcraig/yo

# Messaging variables. Change the items in quotes to suit your needs.

TITLE="Box Drive Now Available"
SUBTITLE="A Better Way to Access Your Box Files"
INFO="Click to find out more."
BUTTON="More Info…"
ACTION="https://globalmac-it.itglue.com/DOC-1673628-1147218"

# Set our static variables

DRIVE="/Applications/Box.app"
SCHED="/usr/local/bin/yo_scheduler"

# function to run our commands

yo_action {
	/usr/local/bin/yo_scheduler \
	--title "$TITLE" \
	--subtitle "$SUBTITLE" \
	--info "$INFO" \
	--action-btn "$BUTTON" \
	--action-path "$ACTION"

# Check for Box Drive before setting message for delivery

if [ -e "$DRIVE" ] ; then
	exit 1
else
	yo_action
fi