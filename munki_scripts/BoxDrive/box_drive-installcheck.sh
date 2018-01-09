#!/bin/bash

# box_drive-installcheck.sh
# check for the existence of Box Sync and prevent install if it does.
# created as an installcheck_script script for Munki.

if [ -e "/Applications/Box Sync.app" ] ; then  
    /bin/echo "Box Sync is installed. Exiting."  
    exit 1  
else  
    /bin/echo "Box Sync is NOT installed. Proceeding."  
    exit 0  
fi