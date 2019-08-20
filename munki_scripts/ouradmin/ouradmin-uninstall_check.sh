#!/bin/bash

# uninstall_check script for Munki to determine if a user account exists.

# Get a list of account names for all accounts above 500
listAccts=`dscl . list /Users UniqueID | /usr/bin/awk '$2 > 500 { print $1 }'`
# Add the shortname of the target account.
ourAdmin='ouradmin'

# Check the list for our admin. Exit 0 to run the uninstall script. 
# Exit 1 if the account does not exist.
if [[ $listAccts == *"$ourAdmin"* ]]; then
    exit 0
else
	exit 1
fi