#!/bin/bash

# Checks for the existence of the ouradmin user and removes 
#  the account, any running processes, the home folder, 
#  the public share, and the cached credentials.
/usr/sbin/sysadminctl -deleteUser ouradmin