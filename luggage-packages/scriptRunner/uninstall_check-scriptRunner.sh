#!/bin/bash

#	uninstall_check-scriptRunner.sh
#	Tobias Morrison
#	GlobalMac IT
#	created: 13 Mar 2017
#	uninstall_check for scriptRunner for use with Munki

if [ -e "/usr/local/bin/scriptRunner.py" ] ; then
	exit 0
else
	exit 1
fi