#!/bin/bash

NOTIFIER_PATH="/Library/Management/bin/updatenotifier.py"
NOTIFIER_IDENTIFIER="com.github.tobiasjwm.updatenotifier"
NOTIFIER_AGENT_PATH="/Library/LaunchAgents/$NOTIFIER_IDENTIFIER.plist"

if [ -e $NOTIFIER_PATH ] ; then
	/bin/launchctl unload $NOTIFIER_AGENT_PATH
	# in an ideal future, we would also remove the local plists using `find`
	/bin/rm $NOTIFIER_PATH
	/bin/rm $NOTIFIER_AGENT_PATH
	/usr/sbin/pkgutil --forget $NOTIFIER_IDENTIFIER
	/bin/echo "updatenotifier successfully removed."
else
	/bin/echo "updatenotifier is not installed."
fi

exit 0