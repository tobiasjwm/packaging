#!/bin/bash

#	uninstall_check-disableSquirrelUpdates.sh
#	Tobias Morrison
#	GlobalMac IT
#	created: 30 Mar 2017
#	uninstall_check for disableSquirrelUpdates for use with Munki

if [ -e /Library/Management/scriptRunner/every/DisableSquirrelUpdates.sh ] ; then
	exit 0
else
	exit 1
fi