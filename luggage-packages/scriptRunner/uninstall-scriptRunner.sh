#!/bin/bash

#	uninstall-scriptRunner.sh
#	Tobias Morrison
#	GlobalMac IT
#	created: 07 Mar 2017
#	uninstall_check for scriptRunner for use with Munki

/bin/rm -f /Library/LaunchAgents/com.tobiasmorrison.scriptrunner.plist
/bin/rm -rf /Library/Management/scriptRunner
/bin/rm -f /usr/local/bin/scriptRunner.py
/usr/sbin/pkgutil --forget com.tobiasmorrison.scriptRunnerPkg