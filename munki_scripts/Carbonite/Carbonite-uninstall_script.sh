#!/bin/sh

#################################################
##    KILL THE EXECUTION OF THE EXECUTABLES    ##
#################################################

sudo launchctl remove com.dataprotection.protectionservice
sudo launchctl remove com.dataprotection.watcher
/bin/ps -A | /usr/bin/grep "DCProtect" | /usr/bin/grep -v "grep" | /usr/bin/grep -v "uninstall" | /usr/bin/awk '{ system("sudo kill -9 "$1) }'

#################################################
##         REMOVE THE FILES FROM DISK          ##
#################################################

## APPLICATION

if [ -d "/Applications/Carbonite Endpoint.app" ]; then
  sudo /bin/rm -r "/Applications/Carbonite Endpoint.app"
fi

## LIBRARY APPLICATION SUPPORT

if [ -d "/Library/Application Support/DCProtect" ]; then
  sudo /bin/rm -r "/Library/Application Support/DCProtect"
fi

## LAUNCH DAEMON

if [ -f "/Library/LaunchDaemons/com.dataprotection.protectionservice.plist" ]; then
  sudo /bin/rm "/Library/LaunchDaemons/com.dataprotection.protectionservice.plist"
fi

if [ -f "/Library/LaunchDaemons/com.dataprotection.watcher.plist" ]; then
   sudo /bin/rm "/Library/LaunchDaemons/com.dataprotection.watcher.plist"
fi

sudo pkgutil --forget com.dataprotection.DCProtect
sudo pkgutil --forget com.dataprotection.carboniteEndpointProtection.DCProtectRoot.pkg

exit 0