#!/bin/bash

# DisableSquirrelUpdates.sh
# created: 03 Jan 2017
# author: Tobias Morrison
#
# A down and dirty way to stop Slack (and other apps) from bugging users to 
# install a helper app.
#
# Credit to Tim Sutton for the fix. 
# Read more about this issue here https://macops.ca/disabling-squirrel-updates
#
# This must be run in a user context. Use scriptRunner or Outset to automate.

/bin/launchctl setenv DISABLE_UPDATE_CHECK 1
