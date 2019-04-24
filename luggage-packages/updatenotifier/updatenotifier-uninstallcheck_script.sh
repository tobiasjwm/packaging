#!/bin/bash

NOTIFIER_PATH="/Library/Management/bin/updatenotifier.py"

if [ -e $NOTIFIER_PATH ] ; then
	exit 0
else
	exit 1
fi