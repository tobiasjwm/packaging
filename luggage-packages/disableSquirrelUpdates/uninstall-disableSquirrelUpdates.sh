#!/bin/bash

#	uninstall_check-disableSquirrelUpdates.sh
#	Tobias Morrison
#	GlobalMac IT
#	created: 30 Mar 2017
#	uninstall script for disableSquirrelUpdates for use with Munki

/bin/rm -f /Library/Management/scriptRunner/every/DisableSquirrelUpdates.sh
/usr/sbin/pkgutil --forget com.github.tobiasjwm.DisableSquirrelUpdates